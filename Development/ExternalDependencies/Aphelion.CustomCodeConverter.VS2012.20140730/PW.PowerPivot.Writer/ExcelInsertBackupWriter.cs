using System;
using System.Collections.Generic;
//using System.Linq;
using System.Text;
//using PW.XMLA.Reader;
using Microsoft.AnalysisServices;
//using PW.XMLA.Reader.XMLAPropertyClasses;
//using Microsoft.Office.Interop;
//using Microsoft.Office.Interop.Excel;
//using System.IO.Packaging;
using System.IO;
//using PW.XMLA.Writer;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Lifetime;
using PW.Compression;
using PW.PowerPivot.Writer;
using PW.XMLA.Reader;
namespace PW.ExcelCode.Writer
{
    public class ExcelInsertBackupWriter
    {

        private string ErrorSource = "";
        #region Properties
        private string connSrcTemplate = @"Provider=MSOLAP.4;Integrated Security=SSPI;Persist Security Info=True;Data Source={0};Initial Catalog={1}";        

        public string connSrcConnection = @"Provider=MSOLAP.4;Integrated Security=SSPI;Persist Security Info=True;Data Source=.\sql2012Tabular;Initial Catalog=PWZero1RCS";        
        public string sFilename = @"D:\Dropbox\Clients\XMLA_TabularConverter\Test123.xlsx";
        public string sTemplateFilename = @"D:\Dropbox\Clients\XMLA_TabularConverterD:\Dropbox\Clients\XMLA_TabularConverter\ExcelCode\PW.PowerPivotTemplate.xlsx";
        
        public string sDBName = "PowerPivotTimesheetsImport";
        public string sCubeName = "Model";
        public string XMLADefinition = "";

        //public PW.XMLA.Reader.MultiDimensionalReader srcCubeReader;
        #endregion 
        public string XMLACreateDatabase;
        public string SSASServer;
        public string strBackupFilename;
        public string strInsertFilename;
        private string sMsg = "";
        Microsoft.AnalysisServices.Server cubeServer = new Server();
        Microsoft.AnalysisServices.Database cubeDatabase;
 

        #region ExcelCreation
        
        /*private Application appExcel = null;
        private Workbook wkbkExcel = null;
        private Worksheet worksheet = null;
        private Range workSheet_range = null;
        */
        /// <summary>
        /// Only use when running this code on the same machine as the Analysis Services machine
        /// </summary>
        /// <param name="sSSASServer">Name of the Analysis Services instance</param>
        /// <param name="sSourceCube">Name of the cube to backup and insert</param>
        /// <param name="sTemplateFilename">Excel template file to copy - include the path</param>
        /// <param name="sExcelFile">Destination excel file - include the path. </param>
        /// <param name="sBackupLocation">Local backup path that SSAS can backup to. Include the filename.</param>
        public ExcelInsertBackupWriter(string sSSASServer, string sSourceCube, string sTemplate, string sExcelFile, string sBackupLocation) : this (sSSASServer, sSourceCube, sTemplate, sExcelFile, sBackupLocation, sBackupLocation)
        {
            
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sSSASServer">Name of the Analysis Services instance</param>
        /// <param name="sSourceCube">Name of the cube to backup and insert</param>
        /// <param name="sTemplateFilename">Excel template file to copy - include the path</param>
        /// <param name="sExcelFile">Destination excel file - include the path</param>
        /// <param name="sBackupLocation">Local backup path that SSAS can backup to. Include the filename.</param>
        /// <param name="sBackupUNCLocation">A location from another machine that maps to the SSAS backup path. Include the filename, and match to BackupLocation.</param>
        public ExcelInsertBackupWriter(string sSSASServer, string sSourceCube, string sTemplate, string sExcelFile, string sBackupLocation, string sBackupUNCLocation)
        {
            this.ErrorSource = "ExcelInsertBackupWriter";
            this.connSrcConnection = string.Format(this.connSrcTemplate, sSSASServer, sSourceCube);
            this.SSASServer = sSSASServer;
            this.sDBName = sSourceCube;
            this.sTemplateFilename = sTemplate;
            this.sFilename = sExcelFile;
            this.strBackupFilename = sBackupLocation;
            this.strInsertFilename = sBackupUNCLocation;
        }

        public void SubSetCube(string pDB, string pFilterTable = "Dates", string pFilterValue = "2012/07/01", string pFilterCondition = ">" )
        {
            
            string sTempDB = pDB + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString().PadLeft(2, '0') + DateTime.Now.Day.ToString().PadLeft(2, '0');
            this.sDBName = sTempDB;
            MultiDimensionalReader mdrCube = new MultiDimensionalReader();
            mdrCube = new MultiDimensionalReader();
            mdrCube.connSrcConnection = string.Format("Provider=MSOLAP.4;Integrated Security=SSPI;Persist Security Info=True;Data Source={0};Initial Catalog={1};", SSASServer, pDB);

            mdrCube.sSrcDBName = pDB;
            mdrCube.isTabular = true;
            mdrCube.isTabularSource = true;
            //Should do cube as well

            mdrCube.PopulateDefinitionFromMultiDimensional();


            TabularSubSet ts = new TabularSubSet();
            ts.sProcessAddTable.Add("ActivityDetails");

            ts.sFilterTable = pFilterTable;
            ts.sFilterValue = pFilterValue;
            ts.sFilterCondition = pFilterCondition;
            ts.xmlaReader = mdrCube;
            ts.CreateTabular(SSASServer, sTempDB, pDB);
            //ts.xmlaWriter.CreateTabular();
            ts.sFilterTable = "Dates";
            ts.xmlaWriter.BuildTabularXMLA();
            ts.xmlaWriter.ProcessTabular();
            ts.xmlaWriter.ProcessAdd(ts.sProcessAddTable, pFilterValue);
            
        }


        public bool CreateExcelFromSubset(string pDB)
        {

            SubSetCube(pDB);
            CreateExcel();
            
            return true;
        }


        public bool CreateExcelFromSubset(string pDB, string pFilterTable = "Dates", string pFilterValue = "2012/10/01", string pFilterCondition = ">", bool pDelete = false)
        {
            
            SubSetCube(pDB,pFilterTable, pFilterValue, pFilterCondition);
            CreateExcel();
            if (pDelete)
            {
                string sTempDB = pDB + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString().PadLeft(2, '0') + DateTime.Now.Day.ToString().PadLeft(2, '0');
                TabularSubSet ts = new TabularSubSet(SSASServer, sTempDB, pDB);
                
                ts.xmlaWriter.DeleteCube();
            }

            
            return true;
        }


        public void DeleteCube()
        {
            try
            {
                this.ErrorSource = "BackupCube";
                //sDBName = "PWZero1RCS";
                ///HERE
                //return sMsg;
            }
            catch (System.Exception ex)
            {

                throw (new System.Exception("At " + this.sMsg + @"
                            Error in " + this.ErrorSource + @" : 
                " + ex.Message, ex));

            }

        }

        public void CreateExcel() 
        {
            try
            {

                CreateExcelWorkbook();
                InsertCubeIntoWorkbook();
                //return sMsg;
            }
            catch (System.Exception ex)
            {

                throw (new System.Exception ( "At " + this.sMsg +  @"
                            Error in " + this.ErrorSource + @" : 
                " + ex.Message , ex));
                     
            }

        }


        public void InsertCubeIntoWorkbook()
        {
            this.sMsg = "Backing up cube to : " + this.strBackupFilename + " from server " + this.sCubeName + " and database " + this.sDBName;
            BackupCube();
            this.ErrorSource = "ZipInsert";
            this.sMsg = "Inserting cube from file " + this.strInsertFilename + " into file " + this.sFilename + " using template " + this.sTemplateFilename;
            //ZipInsert(sFilename, @"/xl/customData/item1.data", strInsertFilename);
            ZipInsert(sFilename, @"/xl/model/item.data", strInsertFilename);
        

        }

        [Serializable] private class leaseRenewerClass : ISponsor
        {
            int iRenewCount = 0;

            TimeSpan ISponsor.Renewal (ILease lease)
            {
                if (++iRenewCount < 3)
                {
                    return TimeSpan.FromSeconds(5);
                }
                else
                {
                    return TimeSpan.FromSeconds(0);
                }
            }
        }

        public void BackupCube()
        {
            this.ErrorSource = "BackupCube";
            //sDBName = "PWZero1RCS";
            if (!cubeServer.Connected)
            {
                cubeServer.Connect(string.Format(this.connSrcConnection, this.sDBName));
            }
            //strBackupFilename = @"D:\Dropbox\Clients\XMLA_TabularConverter\" + DateTime.Now.ToString().Replace("/","").Replace(":","") + ".abf";
            cubeServer.Databases.FindByName(this.sDBName).Backup(strBackupFilename, true);
        }


        #region InsertZip

        

        public void ZipInsert(string pFilename, string pPath, string pInsertFileName)
        {
            ZipStorer zip = ZipStorer.Open(pFilename, System.IO.FileAccess.ReadWrite);
            List<ZipStorer.ZipFileEntry> removeList = new List<ZipStorer.ZipFileEntry>();
            //ZipStorer.ZipFileEntry fen = new ZipStorer.ZipFileEntry();
            List<ZipStorer.ZipFileEntry> dir =  zip.ReadCentralDir();
            foreach (ZipStorer.ZipFileEntry entry in dir)
            {
                if (entry.FilenameInZip == pPath)
                {
                    this.sMsg += @"
                        removing : " + entry.ToString() + " from path " + pPath;
                    removeList.Add(entry);
                    //string t = "1";            
                }
                //string s = "";
            }
            ZipStorer.RemoveEntries(ref zip, removeList);

            this.sMsg += @"
            Adding file at path: " + pPath;
            zip.AddFile(ZipStorer.Compression.Store, pInsertFileName, pPath, "");

            //zip.Close();
            zip.Dispose();
        }

        #endregion
        public void CreateExcelWorkbook()
        {
            this.ErrorSource = "CreateExcelWorkbook";
            File.Copy(this.sTemplateFilename, this.sFilename, true);
            /*try
            {
                appExcel = new Application();
                appExcel.Visible = true;
                appExcel.DisplayAlerts = false; 
                wkbkExcel  = appExcel.Workbooks.Open(sTemplateFilename,         0, false, 5, "", "", false, XlPlatform.xlWindows, "",        true, false, 0, true, false, false);
                //workbook = appExcel.Workbooks.Add(1);
                wkbkExcel.SaveAs(this.sFilename);
                worksheet = (Worksheet)wkbkExcel.Sheets[1];
               
            }
            catch (Exception e)
            {
                wkbkExcel.Save();
                //Console.Write("Error");
            }
            finally
            {
                wkbkExcel.Close();
                System.Runtime.InteropServices.Marshal.ReleaseComObject(wkbkExcel);                   
                appExcel.Quit();                    
                System.Runtime.InteropServices.Marshal.ReleaseComObject(appExcel);                    
                GC.Collect();                    
                GC.WaitForPendingFinalizers();
                GC.Collect();
                
            }*/




        }

       
        #endregion

 
    }


    /*[Serializable] public class PackageWriter 
    {
        public string ErrorSource = "";
        public void WritePackagePartContents(string packagePath, string partPath, byte[] contents)
        {
            this.ErrorSource = "WritePackagePartContents";
            var uri = new Uri(partPath, UriKind.Relative);
            this.ErrorSource = "WritePackagePartContents: Package Open";
            var pack = Package.Open(packagePath, FileMode.OpenOrCreate, FileAccess.ReadWrite);
            this.ErrorSource = "WritePackagePartContents: Get part";
            var part = pack.GetPart(uri);

            var type = part.ContentType;
            this.ErrorSource = "WritePackagePartContents: Delete part";
            pack.DeletePart(uri);
            this.ErrorSource = "WritePackagePartContents:Create oart";
            pack.CreatePart(uri, type);
            this.ErrorSource = "WritePackagePartContents:Get part 2";
            part = pack.GetPart(uri);
            this.ErrorSource = "WritePackagePartContents: Get stream";
            var stream = part.GetStream();
            this.ErrorSource = "WritePackagePartContents: write";
            stream.Write(contents, 0, contents.Length);
            this.ErrorSource = "WritePackagePartContents: Flush";
            stream.Flush();
            stream.Close();
            pack.Flush();
            pack.Close();


        }
    }*/
}
