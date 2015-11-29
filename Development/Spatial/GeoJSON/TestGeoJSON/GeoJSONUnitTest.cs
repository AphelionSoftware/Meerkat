using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.IO;
using System.Runtime.Serialization;
using GeoJSON;

namespace TestGeoJSON
{
    /// <summary>
    /// Summary description for GeoJSONWriterUnitTest
    /// </summary>
    [TestClass]
    public class GeoJSONUnitTest
    {
        public GeoJSONUnitTest()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        //
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        // Use TestInitialize to run code before running each test 
        // [TestInitialize()]
        // public void MyTestInitialize() { }
        //
        // Use TestCleanup to run code after each test has run
        // [TestCleanup()]
        // public void MyTestCleanup() { }
        //
        #endregion

        /// <summary>
        /// Summary description for TestGeoJSONExample
        /// 
        /// The testDatabase.mdf contains a table called GeoJsonTestData
        /// which contains data similar to the GeoJson sample on the
        /// geojson spec page http://geojson.org/geojson-spec.html
        ///
        /// 
        // </summary>
        [TestMethod]
        public void TestGeoJSONExample()
        {
            // execute sql against database to get result set
            StringBuilder sql = new StringBuilder();
            sql.Append("SELECT * FROM GeoJsonTestData order by prop1");

            // create JSON object and populate with data
            FeatureCollection container = new FeatureCollection();
            container.PopulateBySQL(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Projects\GeoJSON\TestGeoJSON\TestDatabase.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True", "System.Data.SqlClient", sql.ToString());

            // serialise
            System.Runtime.Serialization.Json.DataContractJsonSerializer dcjs = new System.Runtime.Serialization.Json.DataContractJsonSerializer(typeof(FeatureCollection));
            MemoryStream ms1 = new MemoryStream();
            dcjs.WriteObject(ms1, container);
            string json1 = Encoding.Default.GetString(ms1.ToArray());
            //Response.Write(json1);
            ms1.Close();

            // evaluate output javascript using the old VSA engine (marked as obsolete)
            // and ensure that the second feature is a LineString (first is a Point, third is a Polygon)
            Microsoft.JScript.Vsa.VsaEngine jsengine = Microsoft.JScript.Vsa.VsaEngine.CreateEngine();
            object Result = null;            
            try {
                StringBuilder js = new StringBuilder();
                js.Append("var jsontext = '" + json1 + "';");
                js.Append("var geojson = eval('(' + jsontext + ')');");
                js.Append("geojson.features[1].geometry.type");
                Result = Microsoft.JScript.Eval.JScriptEvaluate(js.ToString(), jsengine);
                Assert.AreEqual(Result.ToString(), "LineString");
            }
            catch (Exception ex)            
            {                
                throw;            
            }            
        }


        [TestMethod]
        public void TestGeoJSONWKBExample()
        {
            // execute sql against database to get result set
            StringBuilder sql = new StringBuilder();
            sql.Append("SELECT Feature.STAsBinary() as Feature, prop0, prop1 FROM GeoJsonTestData order by prop1");

            // create JSON object and populate with data
            FeatureCollection container = new FeatureCollection();
            container.PopulateBySQL(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Projects\GeoJSON\TestGeoJSON\TestDatabase.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True", "System.Data.SqlClient", sql.ToString());

            // serialise
            System.Runtime.Serialization.Json.DataContractJsonSerializer dcjs = new System.Runtime.Serialization.Json.DataContractJsonSerializer(typeof(FeatureCollection));
            MemoryStream ms1 = new MemoryStream();
            dcjs.WriteObject(ms1, container);
            string json1 = Encoding.Default.GetString(ms1.ToArray());
            ms1.Close();

            // evaluate output javascript using the old VSA engine (marked as obsolete)
            // and ensure that the second feature is a LineString (first is a Point, third is a Polygon)
            Microsoft.JScript.Vsa.VsaEngine jsengine = Microsoft.JScript.Vsa.VsaEngine.CreateEngine();
            object Result = null;
            try
            {
                StringBuilder js = new StringBuilder();
                js.Append("var jsontext = '" + json1 + "';");
                js.Append("var geojson = eval('(' + jsontext + ')');");
                js.Append("geojson.features[1].geometry.type");
                Result = Microsoft.JScript.Eval.JScriptEvaluate(js.ToString(), jsengine);
                Assert.AreEqual(Result.ToString(), "LineString");
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
