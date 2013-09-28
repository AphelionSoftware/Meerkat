
CREATE  VIEW  [dbo].[DimIndicatorMultiLevel]
as 


      SELECT TermSetLevel1 = oc.ShortName --+ ' : ' + LEFT(oc.Longname,80) 
       
      ,TermSetLevel2 = 'Indicators'
      ,TermSetLevel3 =   i.ShortName + ' : ' + left(i.longname,80)
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
      
      ,NameLevel1 = oc.ShortName 
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
      ,i.UnitOfMeasure
      from [app].[Outcome] oc

      
       inner join app.INdicator I
      on oc.OutcomeID = i.OutcomeID
           UNION ALL
      ------------------------------------
      --Outputs
      


      SELECT TermSetLevel1 = oc.ShortName --+ ' : ' + LEFT(oc.Longname,80) 
      ,TermSetLevel2 =  otp.ShortName + ' : ' + left(otp.longname,80)
      ,TermSetLevel3 = 'Indicators'
      ,TermSetLevel4 =  i.ShortName + ' : ' + left(i.longname,80)
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
      
      ,NameLevel1 = oc.ShortName --+ ' : ' + LEFT(oc.Longname,80)
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
      ,i.UnitOfMeasure
      from [app].[Outcome] oc
      inner join app.Output otp
      on oc.OutcomeID = otp.OutcomeID

      
       inner join app.INdicator I
      on otp.Output_ID = i.Output_ID
      
           
      
      
       UNION ALL
      SELECT TermSetLevel1 = oc.ShortName --+ ' : ' + LEFT(oc.Longname,80) 
      ,TermSetLevel2 =  otp.ShortName + ' : ' + left(otp.longname,80)
      ,TermSetLevel3 = so.ShortName + ' : ' + left(so.longname,80)
      ,TermSetLevel4 = 'Indicators'
      ,TermSetLevel5 = i.ShortName + ' : ' + left(i.longname,80)
      ,TermSetLevel6 = null
      ,TermSetLevel7 = null
      ,CodeLevel1 = oc.Code
      ,CodeLevel2 = otp.Code
      ,CodeLevel3 = so.Code
      ,CodeLevel4 = 'Ind'
      ,CodeLevel5 = i.Code
      ,CodeLevel6 = null
      ,CodeLevel7 = null
      
      ,NameLevel1 = oc.ShortName --+ ' : ' + LEFT(oc.Longname,80) 
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
       ,i.UnitOfMeasure
      from [app].[Outcome] oc
      inner join app.Output otp
      on oc.OutcomeID = otp.OutcomeID
       inner join [app].[SubOutput] so
      on otp.Output_ID = so.Output_ID
      
       inner join app.INdicator I
      on so.SubOutput_ID = i.SubOutput_ID
      
      
  GO


