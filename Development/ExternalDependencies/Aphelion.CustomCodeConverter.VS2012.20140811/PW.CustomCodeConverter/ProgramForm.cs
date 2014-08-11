using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using PW.XMLA.Reader;
using PW.XMLA.Writer;
//using PW.ExcelCode.Writer;
using PW.ExcelCode.Writer;
using PW.PowerPivot.Writer;
using Aphelion.DW.StagingCreate;
using Aphelion.XMLA.FromMetadata;

namespace PW.CustomCodeConverter
{
    public partial class ProgramForm : Form
    {
        public TabularPopulateStarFromViews TPR;
        public MultiDimensionalReader mdrCube = new MultiDimensionalReader();
        public TabularXMLAWriter txwCube = new TabularXMLAWriter();
        public ExcelSrcCopyWriter excelCube = new ExcelSrcCopyWriter();
        public ProgramForm()
        {
            InitializeComponent();
        }

        private void tstConvert_Click(object sender, EventArgs e)
        {
            txwCube = new TabularXMLAWriter();
            mdrCube = new MultiDimensionalReader();
            mdrCube.connSrcConnection = this.txtsrcConnectionString.Text;
            mdrCube.sSrcDBName = this.txtsrcDatabase.Text;
            //Should do cube as well


            mdrCube.PopulateDefinitionFromMultiDimensional();

            txwCube.connDestConnection = txtdestConnectionString.Text;
            txwCube.sDBName = txtdestDatabase.Text;

            txwCube.srcCubeReader = mdrCube;
           // txwCube.CreateTabular();
            txwCube.BuildTabularXMLA();

            


        }

        private void btnCreateExcel_Click(object sender, EventArgs e)
        {
            excelCube = new ExcelSrcCopyWriter();

            mdrCube = new MultiDimensionalReader();
            mdrCube.connSrcConnection = this.txtTabularConnection.Text;
            mdrCube.sSrcDBName = this.txtTabularSrcDB.Text;
            mdrCube.isTabular = true;
            //Should do cube as well


            mdrCube.PopulateDefinitionFromMultiDimensional();

            //excelCube.connSrcConnection = txtdestConnectionString.Text;
            excelCube.connSrcConnection = this.txtTabularConnection.Text;
            excelCube.sTemplateFilename = txtTemplateFileName.Text;

            excelCube.sDBName = txtTabularSrcDB.Text;
            excelCube.sFilename = txtFilename.Text;
            excelCube.srcCubeReader = mdrCube;
            
            excelCube.CreateExcel();
             

        }

        private void btnInsert_Click(object sender, EventArgs e)
        {
            string sServer = this.txtExServer.Text;
            string sDB = this.txtExDB.Text;
            string sDest = this.txtExDest.Text;
            string sInsertPath = this.txtExInsertPath.Text;
            string sBackupPath = this.txtExBackupPath.Text;
            string sTemplate = this.txtExTemplate.Text;
            



            ExcelInsertBackupWriter excel = new ExcelInsertBackupWriter(sServer, sDB, sTemplate, sDest, sBackupPath, sInsertPath);
            excel.CreateExcel();
            //excel.CreateExcel();
        }

        private void btnSubset_Click(object sender, EventArgs e)
        {
            string sServer = this.txtExServer.Text;
            string sDB = this.txtExDB.Text;
            string stempDB = this.txtExDB.Text + "_TEMP";
            string sDest = this.txtExDest.Text;
            string sInsertPath = this.txtExInsertPath.Text;
            string sBackupPath = this.txtExBackupPath.Text;
            string sTemplate = this.txtExTemplate.Text;

            /*mdrCube = new MultiDimensionalReader();
            mdrCube.connSrcConnection = string.Format("Provider=MSOLAP.4;Integrated Security=SSPI;Persist Security Info=True;Data Source={0};Initial Catalog={1};", sServer, sDB);

            mdrCube.sSrcDBName = sDB;
            mdrCube.isTabular = true;
            mdrCube.isTabularSource = true;
            //Should do cube as well

            mdrCube.PopulateDefinitionFromMultiDimensional();


            TabularSubSet ts = new TabularSubSet();
            ts.xmlaReader = mdrCube;
            ts.CreateTabular(sServer, stempDB, sDB);
            //ts.xmlaWriter.CreateTabular();
            ts.sFilterTable = "Dates";
            ts.xmlaWriter.BuildTabularXMLA();
            ts.xmlaWriter.ProcessTabular();
             * */



            ExcelInsertBackupWriter excel = new ExcelInsertBackupWriter(sServer, sDB, sTemplate, sDest, sBackupPath, sInsertPath);
            //excel.CreateExcelFromSubset(sDB);
            excel.CreateExcelFromSubset(sDB, this.txtExDim.Text, this.txtExDimValue.Text, ">",true);
            //excel.CreateExcelFromSubset(sDB);
        }

        private void btnStage_Click(object sender, EventArgs e)
        {
            OLAPStarCreate scOLAP = new OLAPStarCreate(
                this.txtSrcConn.Text
                , this.txtDestConn.Text
                , this.txtSchema.Text
                , this.txtFactPrefix.Text
                , this.txtDimPrefix.Text
                , this.txtFieldExcl.Text
                , this.txtTableExcl.Text
                , this.txtFactFilter.Text
                , this.txtDimFilter.Text
                , this.chkSchema.Checked
                );
            scOLAP.CreateScript();

            this.txtResults.Text = scOLAP.OutputScript();
            scOLAP.RunScript();

        }

        private void btnStaging_Click(object sender, EventArgs e)
        {
            StagingCreate scTables = new StagingCreate(this.txtStgSrcConn.Text, this.txtStgDB.Text, this.txtStgSchema.Text, this.txtStgFactPrefix.Text, this.txtStgDimPrefix.Text, this.txtStgFieldExcl.Text, this.txtSrcKeyName.Text, this.chkStageDrop.Checked);
            scTables.CreateScript();

            this.txtStageScript.Text = scTables.OutputScript();
        }

        private void btnTblCreateCube_Click(object sender, EventArgs e)
        {
            this.TPR = new TabularPopulateStarFromViews(
                txtTblCubeDB.Text
                , txtTblDSConn.Text
                , txtTblConnSecurity.Text
                , txtTblImpersonationMode.Text
                , txtTblUsername.Text
                , txtTblPwd.Text
                , txtTblImpersonationSecurity.Text
                , txtTblSrcConn.Text
                , txtTblDestConn.Text
                , txtTblSchema.Text
                , ""
                , ""
                );

            MultiDimensionalReader mdr = new MultiDimensionalReader();
            mdr.cbOriginalCube =
                TPR.ScanDB();

            TPR.CreateCube();

        }

        private void btnInsert_Click_1(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            StagingCreate scTables = new StagingCreate(this.txtStgSrcConn.Text, this.txtStgDB.Text, this.txtStgSchema.Text, "", "", this.txtStgFieldExcl.Text, this.chkStageDrop.Checked, this.chkInclKeysStg.Checked, this.chkInclRefKeysStg.Checked ,this.txtTableExclStg.Text, this.txtSchemaExclStg.Text, this.txtSrcKeyName.Text);
            scTables.CreateScript();

            this.txtStageScript.Text = scTables.OutputScript();
        
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            btnStage_Click( sender, e);
            btnTblCreateCube_Click(sender, e);
            btnProcess_Click(sender, e);
        }

        private void btnProcess_Click(object sender, EventArgs e)
        {
            if (TPR == null)
            {
                btnTblCreateCube_Click(sender, e);
            }
            TPR.ProcessCube();
        }

        private void btnInsert_Click_2(object sender, EventArgs e)
        {
            string sServer = this.txtExServer.Text;
            string sDB = this.txtExDB.Text;
            string sDest = this.txtExDest.Text;
            string sInsertPath = this.txtExInsertPath.Text;
            string sBackupPath = this.txtExBackupPath.Text;
            string sTemplate = this.txtExTemplate.Text;




            ExcelInsertBackupWriter excel = new ExcelInsertBackupWriter(sServer, sDB, sTemplate, sDest, sBackupPath, sInsertPath);
            excel.CreateExcel();
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            btnStage_Click(sender, e);
            btnTblCreateCube_Click(sender, e);
            btnProcess_Click(sender, e);
            btnInsert_Click_2(sender, e);
        }

        private void button3_Click(object sender, EventArgs e)
        {

            btnStage_Click(sender, e);
            btnTblCreateCube_Click(sender, e);
            btnProcess_Click(sender, e);
            btnInsert_Click_2(sender, e);
        }

        private void txtSrcKeyName_TextChanged(object sender, EventArgs e)
        {

        }

        private void tabPage6_Click(object sender, EventArgs e)
        {

        }

        private void btnGenerateErrors_Click(object sender, EventArgs e)
        {
            ErrorDBCreate errTables = new ErrorDBCreate(this.txtErrorStg.Text, this.txtErrorSrc.Text, this.txtErrorDB.Text, this.txtErrorStagingSchema.Text, this.txtErrorsSchema.Text, this.chkErrorsDropDB.Checked, this.txtErrorsFieldExcl.Text);
            errTables.CreateScript();
            this.txtErrorResult.Text = errTables.OutputScript();
        }

        private void button4_Click(object sender, EventArgs e)
        {

        }

        private void btnStgCreateDB_Click(object sender, EventArgs e)
        {
            StagingCreate scTables = new StagingCreate(this.txtStgSrcConn.Text, this.txtStgDB.Text, this.txtStgSchema.Text, "", "", this.txtStgFieldExcl.Text, this.chkStageDrop.Checked, this.chkInclKeysStg.Checked, this.chkInclRefKeysStg.Checked, this.txtTableExclStg.Text, this.txtSchemaExclStg.Text, this.txtSrcKeyName.Text);
            scTables.CreateScript();

            this.txtStageScript.Text = scTables.OutputScript();
            scTables.RunScript();
        }

        private void btnErrorCreate_Click(object sender, EventArgs e)
        {
            ErrorDBCreate errTables = new ErrorDBCreate(this.txtErrorStg.Text, this.txtErrorSrc.Text, this.txtErrorDB.Text, this.txtErrorStagingSchema.Text, this.txtErrorsSchema.Text, this.chkErrorsDropDB.Checked, this.txtErrorsFieldExcl.Text);
            errTables.CreateScript();
            this.txtErrorResult.Text = errTables.OutputScript();
            errTables.RunScript();
        }
    }
}
