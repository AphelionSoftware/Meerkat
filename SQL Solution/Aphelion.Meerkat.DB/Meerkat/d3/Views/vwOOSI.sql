
CREATE VIEW [d3].[vwOOSI]
AS
SELECT 'Root' As ReportLevel, 
	'Root' AS NodeLevel
	, 'Outcome' AS name
	, NULL AS parent
	, NULL AS ID
/*-----------------------------------------------------
---All Outcomes
-----------------------------------------------------*/
UNION ALL 
select 
	'Outcome' as ReportLevel,
	 'Root' as NodeLevel,
	OM.ShortName  As name
	, 'Outcome' AS parent
	, OM.Outcome_ID AS ID
from app.Outcome OM
 

/*-----------------------------------------------------
---Outcomes linked to Outputs
-----------------------------------------------------*/
UNION ALL
SELECT 
	'Output' as ReportLevel, 
	 'Node' as NodeLevel,
	
	OTP.ShortName AS name, 
	OM.ShortName AS parent 
	, OTP.Output_ID AS ID
from   app.Output OTP
			INNER JOIN app.Outcome OM
			ON OTP.Outcome_ID = OM.Outcome_ID
/*-----------------------------------------------------
---Outputs linked to SubOutputs
-----------------------------------------------------*/
UNION ALL
SELECT 
	'SubOutput' as ReportLevel, 
	 'Node' as NodeLevel,
	
	STP.ShortName AS name, 
	OTP.ShortName AS parent 
	, STP.SubOutput_ID AS ID
from   app.SubOutput STP
			INNER JOIN app.Output OTP
			ON STP.Output_ID = OTP.Output_ID

/*-----------------------------------------------------
---Indicator to SubOutput
-----------------------------------------------------*/
 UNION ALL
SELECT 
	'Indicator' as ReportLevel, 
	 'Leaf' as NodeLevel,
	I.ShortName AS name,
	STP.ShortName AS parent
	, I.IndicatorID AS ID
from app.Indicator I
INNER JOIN app.SubOutput STP
			 	ON I.SubOutput_ID = STP.SubOutput_ID

/*-----------------------------------------------------
---Indicator to Output
-----------------------------------------------------*/
 UNION ALL
SELECT 
	'Indicator' as ReportLevel, 
	 'Leaf' as NodeLevel,
	I.ShortName AS name,
	OTP.ShortName AS parent
	, I.IndicatorID AS ID
from app.Indicator I
INNER JOIN app.Output OTP
			 	ON I.Output_ID = OTP.Output_ID

/*-----------------------------------------------------
---Indicator to Outcome
-----------------------------------------------------*/
 UNION ALL
SELECT 
	'Indicator' as ReportLevel, 
	 'Leaf' as NodeLevel,
	I.ShortName AS name,
	OM.ShortName AS parent
	, I.IndicatorID AS ID
from app.Indicator I
INNER JOIN app.Outcome OM
			 	ON I.Outcome_ID = OM.Outcome_ID