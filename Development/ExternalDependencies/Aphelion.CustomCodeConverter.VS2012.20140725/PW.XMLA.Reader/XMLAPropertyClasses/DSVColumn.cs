using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class DSVColumn
    {
        public override string ToString()
        {
            return this.sID;
        }
        public string sName;
        public string sID;

        public string sDBColumnName;
        public string sFriendlyName;
        public string sType;

        public string sComputedColumnExpression;
        public string sRestrictionBase;
        public string sRestrictionMaxLength;

        #region Tabular generator - keeping here for ease of use later
        /// <summary>
        /// For tabular generation from extended properties
        /// </summary>
        public string sHierarchyName;
        /// <summary>
        /// For tabular generation from extended properties
        /// </summary>
        public string sHierarchyLevel;
        
        
        /// <summary>
        /// For tabular generation from extended properties
        /// </summary>
        public string sDataType;
        /// <summary>
        /// For tabular generation from extended properties
        /// </summary>
        public string sCharMaxLength;
        /// <summary>
        /// For tabular generation from extended properties
        /// </summary>
        public string sNumericPrecision;
        /// <summary>
        /// For tabular generation from extended properties
        /// </summary>
        public string sNumericScale;
        /// <summary>
        /// For tabular generation from extended properties
        /// </summary>
        public string sNumericRadix;
        /// <summary>
        /// For tabular generation from extended properties
        /// </summary>
        public string sAggregationType;

        #endregion

        public DSVColumn()
        {
        }

        public DSVColumn(string pName, string pID, string pDBColumnName, string pFriendlyName, string pType, string pComputedColumnExpression, string pRestrictionBase, string pRestrictionMaxLength)
        {
            sName = pName;
            sID = pID;

            sDBColumnName = pDBColumnName;
            sFriendlyName = pFriendlyName;
            sType = pType;

            sComputedColumnExpression = pComputedColumnExpression;
            sRestrictionBase = pRestrictionBase;
            sRestrictionMaxLength = pRestrictionMaxLength;

        }

    }
}
