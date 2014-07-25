using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PW.XMLA.Reader;
using Microsoft.AnalysisServices;
using PW.XMLA.Reader.XMLAPropertyClasses;
using Microsoft.Office.Interop;
using Microsoft.Office.Interop.Excel;
using System.IO.Packaging;
using System.IO;
using PW.XMLA.Writer;
namespace PW.ExcelCode.Writer
{
    public class ExcelInsertBackupWriter
    {


        #region Properties
        private string connSrcTemplate = @"Provider=MSOLAP.4;Integrated Security=SSPI;Persist Security Info=True;Data Source={0};Initial Catalog={1}";        

        public string connSrcConnection = @"Provider=MSOLAP.4;Integrated Security=SSPI;Persist Security Info=True;Data Source=.\sql2012Tabular;Initial Catalog=PWZero1RCS";        
        public string sFilename = @"D:\Dropbox\Clients\XMLA_TabularConverter\Test123.xlsx";
        public string sTemplateFilename = @"D:\Dropbox\Clients\XMLA_TabularConverterD:\Dropbox\Clients\XMLA_TabularConverter\ExcelCode\PW.PowerPivotTemplate.xlsx";
        
        public string sDBName = "PowerPivotTimesheetsImport";
        public string sCubeName = "Model";
        public string XMLADefinition = "";

        public PW.XMLA.Reader.MultiDimensionalReader srcCubeReader;
        #endregion 
        public string XMLACreateDatabase;
        public string strBackupFilename;
        public string strInsertFilename;

        Microsoft.AnalysisServices.Server cubeServer = new Server();
        Microsoft.AnalysisServices.Database cubeDatabase;
 

        #region ExcelCreation
        
        private Application appExcel = null;
        private Workbook wkbkExcel = null;
        private Worksheet worksheet = null;
        private Range workSheet_range = null;

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

            this.connSrcConnection = string.Format(this.connSrcTemplate, sSSASServer, sSourceCube);
            this.sDBName = sSourceCube;
            this.sTemplateFilename = sTemplate;
            this.sFilename = sExcelFile;
            this.strBackupFilename = sBackupLocation;
            this.strInsertFilename = sBackupUNCLocation;
        }

        public void CreateExcel() 
        {
            CreateExcelWorkbook();                    
            InsertCubeIntoWorkbook();
        }


        public void InsertCubeIntoWorkbook()
        {
            BackupCube();
            WritePackagePartContents(sFilename, @"/xl/customData/item1.data", ReadContentsFromFile(strInsertFilename));
        }

        public void BackupCube()
        {

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

        private static readonly Server srv = new Server();
        private static readonly Scripter scripter = new Scripter();
        private static Database db;

        private static byte[] GetPackagePartContents(string packagePath, string partPath)
        {
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

        private static byte[] ReadContentsFromFile(string filePath)
        {
            var fileStream = File.Open(filePath, FileMode.Open, FileAccess.Read);
            var b = new byte[fileStream.Length];
            fileStream.Read(b, 0, b.Length);
            fileStream.Flush();
            fileStream.Close();
            return b;
        }

        private static void WritePackagePartContents(string packagePath, string partPath, byte[] contents)
        {
            var uri = new Uri(partPath, UriKind.Relative);
            var pack = Package.Open(packagePath, FileMode.OpenOrCreate, FileAccess.ReadWrite);
            var part = pack.GetPart(uri);
            var type = part.ContentType;
            pack.DeletePart(uri);
            pack.CreatePart(uri, type);
            part = pack.GetPart(uri);
            var stream = part.GetStream();
            stream.Write(contents, 0, contents.Length);
            stream.Flush();
            stream.Close();
            pack.Flush();
            pack.Close();
        }


        #endregion

        public void CreateExcelWorkbook()
        {

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
}
