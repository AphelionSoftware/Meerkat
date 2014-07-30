using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace OX.Copyable.Tests
{
    class JustNumbersDefault
    {
        private int _a;
        private float _b;

        public JustNumbersDefault()
        {
            _a = 0;
            _b = 0.0f;
        }

        public int TheA { get { return _a; } set { _a = value; } }
        public float TheB { get { return _b; } set { _b = value; } }
    }
    class JustNumbers
    {
        private int _a;
        private float _b;

        public JustNumbers(int a, float b)
        {
            _a = a;
            _b = b;
        }

        public int TheA { get { return _a; } }
        public float TheB { get { return _b; } }
    }

    class CopyableNumbers : Copyable
    {
        private int _a;
        private float _b;
        
        public CopyableNumbers(int a, float b)
            : base(a, b)
        {
            _a = a;
            _b = b;
        }

        public int TheA { get { return _a; } }
        public float TheB { get { return _b; } }
    }
    /// <summary>
    /// Summary description for UnitTest1
    /// </summary>
    [TestClass]
    public class CloneFlatObjectTests
    {
        public CloneFlatObjectTests()
        {
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

        [TestMethod]
        public void TestCloneCopyable()
        {
            CopyableNumbers n = new CopyableNumbers(3, 4.0f);
            CopyableNumbers c = (CopyableNumbers)n.Copy();
            Assert.AreNotSame(n, c);
            Assert.AreEqual(n.TheA, c.TheA);
            Assert.AreEqual(n.TheB, c.TheB);
        }

        [TestMethod]
        public void TestCloneRegularObjectWithoutDefaultConstructor()
        {
            JustNumbers n = new JustNumbers(3, 4.0f);
            JustNumbers c = (JustNumbers)n.Copy(new JustNumbers(0, 0));
            Assert.AreNotSame(n, c);
            Assert.AreEqual(n.TheA, c.TheA);
            Assert.AreEqual(n.TheB, c.TheB);
        }
        [TestMethod]
        public void TestCloneRegularObjectWithDefaultConstructor()
        {
            JustNumbersDefault n = new JustNumbersDefault();
            n.TheA = 3;
            n.TheB = 4.0f;
            JustNumbersDefault c = (JustNumbersDefault)n.Copy(new JustNumbersDefault());
            Assert.AreNotSame(n, c);
            Assert.AreEqual(n.TheA, c.TheA);
            Assert.AreEqual(n.TheB, c.TheB);
        }
    }
}
