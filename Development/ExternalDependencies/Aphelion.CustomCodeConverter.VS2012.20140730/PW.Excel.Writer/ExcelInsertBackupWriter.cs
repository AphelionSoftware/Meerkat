using System;
using System.Collections.Generic;
//using System.Linq;
using System.Text;
//using PW.XMLA.Reader;
using Microsoft.AnalysisServices;
//using PW.XMLA.Reader.XMLAPropertyClasses;
//using Microsoft.Office.Interop;
//using Microsoft.Office.Interop.Excel;
using System.IO.Packaging;
using System.IO;
//using PW.XMLA.Writer;
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
        public string strBackupFilename;
        public string strInsertFilename;

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
            this.sDBName = sSourceCube;
            this.sTemplateFilename = sTemplate;
            this.sFilename = sExcelFile;
            this.strBackupFilename = sBackupLocation;
            this.strInsertFilename = sBackupUNCLocation;
        }

        public void CreateExcel() 
        {
            try
            {

                CreateExcelWorkbook();
                InsertCubeIntoWorkbook();
            }
            catch (System.Exception ex)
            {

                throw (new System.Exception ( "Error in " + this.ErrorSource + " : " + ex.Message, ex));
                     
            }
        }


        public void InsertCubeIntoWorkbook()
        {
            BackupCube();
            this.ErrorSource = "WritePackagePartContents";
            //Good lord this is a bitch
            //We're doing this because, well : 
            //http://rekiwi.blogspot.com/2008/12/unable-to-determine-identity-of-domain.html
            //http://stackoverflow.com/questions/7488442/epplus-2-9-0-1-throws-system-io-isolatedstorage-isolatedstorageexception-when-tr
            //Trying to write to storage in the middle of the write that SSIS doesn't have access to 
            //WritePackagePartContents(sFilename, @"/xl/customData/item1.data", ReadContentsFromFile(strInsertFilename));

            AppDomainSetup setup = new AppDomainSetup();
            setup.ApplicationBase = AppDomain.CurrentDomain.BaseDirectory;

            System.Security.Policy.Evidence evidence = new System.Security.Policy.Evidence(AppDomain.CurrentDomain.Evidence);
            evidence.AddAssembly(System.Reflection.Assembly.GetExecutingAssembly().FullName);
            evidence.AddHost(new System.Security.Policy.Zone(System.Security.SecurityZone.MyComputer));

            AppDomain ad = AppDomain.CreateDomain("PW", evidence, setup);
            PackageWriter pkgWriteFile = (PackageWriter)ad.CreateInstanceAndUnwrap(typeof(PackageWriter).Assembly.FullName, typeof(PackageWriter).FullName);
            pkgWriteFile.WritePackagePartContents(sFilename, @"/xl/customData/item1.data", ReadContentsFromFile(strInsertFilename));
            AppDomain.Unload(ad);
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

        const string DBName = "Testing";
        const string OriginalBackupPath = @"\\MyLocation\BKUP.abf";
        const string ModifiedBackupPath = @"\\MyLocation\BKUPAfter.abf";
        const string ServerPath = @"machineName\powerpivot";

        //private  readonly Server srv = new Server();
        //private  readonly Scripter scripter = new Scripter();
       // private  Database db;

        private  byte[] GetPackagePartContents(string packagePath, string partPath)
        {
            this.ErrorSource = "GetPackagePartContents";
            var pack = Package.Open(packagePath, FileMode.OpenOrCreate, FileAccess.ReadWrite);
            var part = pack.GetPart(new Uri(partPath, UriKind.Relative));
            var stream = part.GetStream();
            var b = new byte[stream.Length];
            stream.Read(b, 0, b.Length);
            stream.Flush();
            stream.Close();
            pack.Flush();
            pack.Close();
            return b;
        }

        private  byte[] ReadContentsFromFile(string filePath)
        {
            this.ErrorSource = "ReadContentsFromFile";
            var fileStream = File.Open(filePath, FileMode.Open, FileAccess.Read);
            var b = new byte[fileStream.Length];
            fileStream.Read(b, 0, b.Length);
            fileStream.Flush();
            fileStream.Close();
            return b;
        }
        
        private void WritePackagePartContents(string packagePath, string partPath, byte[] contents)
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


    [Serializable] public class PackageWriter 
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


    }
}
