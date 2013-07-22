

CREATE VIEW  [DimIndicatorMultiLevel]
as 
SELECT top 1000000 *


,TermsetDeepGrainID = COALESCE(TermSetID7, TermsetID6, TermsetId5, TermsetID4, TermsetID3, TermsetID2, TermsetID1)
 FROM (

      ---------------------------------------


      SELECT NameLevel = 'Program of Action'
	  ,TermSetDescription  = 'Program of Action Outcomes'
	  ,LCID = ''
	  ,AvailableForTagging = 'TRUE'
	  ,TermDescription = ''
      ,TermSetLevel1 = oc.shortname --+ ' : ' + LEFT(oc.Longname,80) 
       
      ,TermSetLevel2 = 'Indicators'
      ,TermSetLevel3 =   i.shortname + ' : ' + left(i.longname,80)
      ,TermSetLevel4 = null
      ,TermSetLevel5 = null
      ,TermSetLevel6 = null
      ,TermSetLevel7 = null
      
      
      ,CodeLevel1 = oc.Code
      ,CodeLevel2 = 'Ind'
      ,CodeLevel3 =   i.Code
      ,CodeLevel4 = null
      ,CodeLevel5 = null
      ,CodeLevel6 = null
      ,CodeLevel7 = null
      
      ,NameLevel1 = oc.shortname 
      ,NameLevel2 = 'Indicators'
      ,NameLevel3 =   i.ShortName
      ,NameLevel4 = null
      ,NameLevel5 = null
      ,NameLevel6 = null
      ,NameLevel7 = null
      
      ,LongNameLevel1 = oc.LongName 
      ,LongNameLevel2 = 'Indicators'
      ,LongNameLevel3 =   i.LongName
      ,LongNameLevel4 = null
      ,LongNameLevel5 = null
      ,LongNameLevel6 = null
      ,LongNameLevel7 = null
      
      
       ,TermSetID1 = RIGHT ('000' + Cast( oc.OutcomeID as varchar(50)), 4)
      ,TermSetID2 = RIGHT ('000' + Cast( oc.OutcomeID as varchar(50)), 4) + 'Indicators'
      ,TermSetID3 = RIGHT ('000' + Cast(   i.IndicatorID as varchar(50)), 4)
      ,TermSetID4 = null
      ,TermSetID5 = null
      ,TermSetID6 = null
      ,TermSetID7 = null
      ,Indicator_ID = i.IndicatorID
      ,i.UnitOfMeasure,i.isKeyIndicator
      from app.Outcome oc

      
       inner join app.INdicator I
      on oc.OutcomeID = i.OutcomeID
           UNION ALL
      ------------------------------------
      --Outputs
      


      SELECT NameLevel = 'Program of Action'
	  ,TermSetDescription  = 'Program of Action Outcomes'
	  ,LCID = ''
	  ,AvailableForTagging = 'TRUE'
	  ,TermDescription = ''
      ,TermSetLevel1 = oc.shortname --+ ' : ' + LEFT(oc.Longname,80) 
      ,TermSetLevel2 =  otp.shortname + ' : ' + left(otp.longname,80)
      ,TermSetLevel3 = 'Indicators'
      ,TermSetLevel4 =  i.shortname + ' : ' + left(i.longname,80)
      ,TermSetLevel5 = null
      ,TermSetLevel6 = null
      ,TermSetLevel7 = null
      
      ,CodeLevel1 = oc.Code
      ,CodeLevel2 = otp.Code
      ,CodeLevel3 = 'Ind'
      ,CodeLevel4 = i.Code
      ,CodeLevel5 = null
      ,CodeLevel6 = null
      ,CodeLevel7 = null
      
      ,NameLevel1 = oc.shortname --+ ' : ' + LEFT(oc.Longname,80)
      ,NameLevel2 = otp.ShortName
      ,NameLevel3 = 'Indicators' 
      ,NameLevel4 =  i.ShortName
      ,NameLevel5 = null
      ,NameLevel6 = null
      ,NameLevel7 = null
      
       ,LongNameLevel1 = oc.LongName --+ ' : ' + LEFT(oc.LongLongName,80)
      ,LongNameLevel2 = otp.LongName
      ,LongNameLevel3 = 'Indicators' 
      ,LongNameLevel4 =  i.LongName
      ,LongNameLevel5 = null
      ,LongNameLevel6 = null
      ,LongNameLevel7 = null
      ,TermSetID1 = RIGHT ('000' + Cast( oc.OutcomeID  as varchar(50)), 4) 
      ,TermSetID2 = RIGHT ('000' + Cast(  otp.Output_ID  as varchar(50)), 4) 
      ,TermSetID3 = RIGHT ('000' +Cast(  otp.Output_ID as varchar(50)), 4)  + 'Indicators' 
      ,TermSetID4 = RIGHT ('000' +Cast( i.IndicatorID as varchar(50)), 4) 
      ,TermSetID5 = null
      ,TermSetID6 = null
      ,TermSetID7 = null
      ,Indicator_ID = i.IndicatorID
      ,i.UnitOfMeasure,i.isKeyIndicator
      from app.Outcome oc
      inner join app.Output otp
      on oc.outcomeid = otp.outcomeid

      
       inner join app.INdicator I
      on otp.output_id = i.output_id
      
           
      
      
       UNION ALL
      SELECT NameLevel = 'Program of Action'
	  ,TermSetDescription  = 'Program of Action Outcomes'
	  ,LCID = ''
	  ,AvailableForTagging = 'TRUE'
	  ,TermDescription = ''
      ,TermSetLevel1 = oc.shortname --+ ' : ' + LEFT(oc.Longname,80) 
      ,TermSetLevel2 =  otp.shortname + ' : ' + left(otp.longname,80)
      ,TermSetLevel3 = so.shortname + ' : ' + left(so.longname,80)
      ,TermSetLevel4 = 'Indicators'
      ,TermSetLevel5 = i.shortname + ' : ' + left(i.longname,80)
      ,TermSetLevel6 = null
      ,TermSetLevel7 = null
      ,CodeLevel1 = oc.Code
      ,CodeLevel2 = otp.Code
      ,CodeLevel3 = so.Code
      ,CodeLevel4 = 'Ind'
      ,CodeLevel5 = i.Code
      ,CodeLevel6 = null
      ,CodeLevel7 = null
      
      ,NameLevel1 = oc.shortname --+ ' : ' + LEFT(oc.Longname,80) 
      ,NameLevel2 = otp.ShortName
      ,NameLevel3 =  so.ShortName
      ,NameLevel4 =  'Indicators'
      ,NameLevel5 = i.ShortName
      ,NameLevel6 = null
      ,NameLevel7 = null
            ,LongNameLevel1 = oc.TextDescription --+ ' : ' + LEFT(oc.LongName,80) 
      ,LongNameLevel2 = otp.TextDescription
      ,LongNameLevel3 =  so.TextDescription
      ,LongNameLevel4 =  'Indicators'
      ,LongNameLevel5 = i.LongName
      ,LongNameLevel6 = null
      ,LongNameLevel7 = null
       ,TermSetID1 = RIGHT ('000' + Cast( oc.OutcomeID as varchar(50)), 4)
      ,TermSetID2 = RIGHT ('000' +Cast(  otp.Output_ID as varchar(50)),4)
      ,TermSetID3 = RIGHT ('000' +Cast( so.SubOutput_ID as varchar(50)),4)
      ,TermSetID4 = RIGHT ('000' +Cast( so.SubOutput_ID as varchar(50)),4) + 'Indicators'
      ,TermSetID5 = RIGHT ('000' +Cast( i.IndicatorID as varchar(50)),4)
      ,TermSetID6 = null
      ,TermSetID7 = null
       ,Indicator_ID = i.IndicatorID
       ,i.UnitOfMeasure,i.isKeyIndicator
      from app.Outcome oc
      inner join app.Output otp
      on oc.outcomeid = otp.outcomeid
       inner join app.SubOutput so
      on otp.output_id = so.output_id
      
       inner join app.INdicator I
      on so.suboutput_id = i.suboutput_id
      
      
      ----------------------------------
      --Activities

      
      UNION ALL
       SELECT NameLevel = 'Program of Action'
	  ,TermSetDescription  = 'Program of Action Outcomes'
	  ,LCID = ''
	  ,AvailableForTagging = 'TRUE'
	  ,TermDescription = ''
      ,TermSetLevel1 = oc.shortname --+ ' : ' + LEFT(oc.Longname,80) 
      ,TermSetLevel2 =  otp.shortname + ' : ' + left(otp.longname,80)
      ,TermSetLevel3 = so.shortname + ' : ' + left(so.longname,80)
      ,TermSetLevel4 = a.shortname + ' : ' + left(a.longname,80)
      ,TermSetLevel5 = 'Indicators'
      ,TermSetLevel6 = i.shortname + ' : ' + left(i.longname,80)
      ,TermSetLevel7 = null
      ,CodeLevel1 = oc.Code
      ,CodeLevel2 = otp.Code
      ,CodeLevel3 = so.Code
      ,CodeLevel4 = a.Code
      ,CodeLevel5 = 'Ind'
      ,CodeLevel6 = i.Code
      ,CodeLevel7 = null
      
      ,NameLevel1 = oc.shortname --+ ' : ' + LEFT(oc.Longname,80) 
      ,NameLevel2 = otp.ShortName
      ,NameLevel3 =  so.ShortName
      ,NameLevel4 =  a.ShortName
      ,NameLevel5 = 'Indicators'
      ,NameLevel6 = i.ShortName
      ,NameLevel7 = null
            ,LongNameLevel1 = oc.LongName --+ ' : ' + LEFT(oc.LongLongName,80) 
      ,LongNameLevel2 = otp.LongName
      ,LongNameLevel3 =  so.LongName
      ,LongNameLevel4 =  a.LongName
      ,LongNameLevel5 = 'Indicators'
      ,LongNameLevel6 = i.LongName
      ,LongNameLevel7 = null
        ,TermSetID1 = RIGHT ('000' + Cast( oc.OutcomeID as varchar(50)), 4)
      ,TermSetID2 = RIGHT ('000' +Cast(  otp.Output_ID as varchar(50)),4)
      ,TermSetID3 = RIGHT ('000' +Cast( so.SubOutput_ID as varchar(50)),4)
      ,TermSetID4 =RIGHT ('000' + Cast( a.ActivityID as varchar(50)),4)
      ,TermSetID5 =RIGHT ('000' +Cast(  a.ActivityID as varchar(50)),4) + 'Indicators'
      ,TermSetID6 = RIGHT ('000' +Cast( i.IndicatorID as varchar(50)),4)
      ,TermSetID7 = null
 
 ,Indicator_ID = i.IndicatorID
 ,i.UnitOfMeasure,i.isKeyIndicator
      from app.Outcome oc
      inner join app.Output otp
      on oc.outcomeID = otp.outcomeID
       inner join app.SubOutput so
      on otp.output_id = so.output_id
      
       inner join app.Activity A
      on so.suboutput_id = a.suboutputID
      
      inner join app.Indicator I
      on a.activityID = i.activity_id

      
      ) src 
     
	  WHERE 
			(	COALESCE (TermSetLevel1, '') NOT LIKE '%Overall Status%'	) 
		AND (	COALESCE (TermSetLevel2, '') NOT LIKE '%Overall Status%'	) 
		AND (	COALESCE (TermSetLevel3, '') NOT LIKE '%Overall Status%'	) 
		AND (	COALESCE (TermSetLevel4, '') NOT LIKE '%Overall Status%'	) 
		AND (	COALESCE (TermSetLevel5, '') NOT LIKE '%Overall Status%'	) 
		AND (	COALESCE (TermSetLevel6, '') NOT LIKE '%Overall Status%'	) 
		AND (	COALESCE (TermSetLevel7, '') NOT LIKE '%Overall Status%'	)
	  

      ORDER BY TermSetID1,
  TermSetID2,
  TermSetID3,
  TermSetID4,
  TermSetID5,
  TermSetID6,
  TermSetID7

