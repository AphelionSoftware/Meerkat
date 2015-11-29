using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class XMLADimension
    {
        public override string ToString()
        {
            return this.sID;
        }
        public string sName;
        public string sID;
        public string sDataSourceID;
        public string sDataSourceViewID;
        public string sQueryDefinition;
        public string sKeySchemaName;
        public string sKeyTableName;
        public string sKeyColumnName;
        public string sDSVID;
        public bool boolIsParentChild;
        public bool boolVisible = true;
        
        public XMLADimension()
        { }

        public XMLADimension(string	 pName, string	 pID, string	 pDataSourceID, string pDataSourceViewID, string	 pQueryDefinition, string	 pKeySchemaName, string	 pKeyTableName, string	 pKeyColumnName, string	 pDSVID, bool	pIsParentChild )
        {
            sName = pName;
            sID = pID;
            sDataSourceID = pDataSourceID;
            sDataSourceViewID = pDataSourceViewID;
            sQueryDefinition = pQueryDefinition;
            sKeySchemaName = pKeySchemaName;
            sKeyTableName = pKeyTableName;
            sKeyColumnName = pKeyColumnName;
            sDSVID = pDSVID;
            boolIsParentChild = pIsParentChild;
        }

        public XMLADimension(string	 pName, string	 pID, string	 pDataSourceID, string pDataSourceViewID, string pKeyTableName )
        {
            sName = pName;
            sID = pID;
            sDataSourceID = pDataSourceID;
            sDataSourceViewID = pDataSourceViewID;
            sKeyTableName = pKeyTableName;
            sKeySchemaName = "";
         
        }

        public List<XMLADimensionHierarchy> lstHierarchies = new List<XMLADimensionHierarchy>();
        public List<XMLAReferenceDimension> lstReferenceDimensions = new List<XMLAReferenceDimension>();
        public List<XMLARelationship> lstRelationships = new List<XMLARelationship>();
        public List<string> lstKeyColumnNames = new List<string>();
        public List<XMLADimensionAttribute> lstDimensionAttributes = new List<XMLADimensionAttribute>();
        public List<XMLADimension> lstSubsidiaryDimensions = new List<XMLADimension>();
    }
}
