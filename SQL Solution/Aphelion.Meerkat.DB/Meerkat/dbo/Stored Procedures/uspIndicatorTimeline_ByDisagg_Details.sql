
CREATE PROC dbo.uspIndicatorTimeline_ByDisagg_Details

	@DataVersion_ID int --varchar(255)
, @indicator_id int --varchar(255)
,@AgeBand_ID		   int = 0
,@CommunityType_ID	   int = 0
,@Gender_ID			   int = 0
,@Group_ID			   int = 0
,@Institution_ID		   int = 0
,@IndicatorSimpleType_ID		   int = 0
,@ResultArea_ID			  int = 0
,@Framework_ID			  int = 0
,@Donor_ID			  int = 0
 
,@Structure_ID			  int = 0
  
,@Location_ID			  int = 0
,@LocationType_ID		  int = 0
AS
SELECT IV.IndicatorValues_ID, IV.Notes, IV.ActualLabel AS Title 
, L.Name AS LocationName
, G.Name Gender
, F.Name Framework
, Inst.Name InstitutionName
, Grp.Name GroupName
, D.Name DonorName
FROM  RBM.[IndicatorValues] IV
INNER JOIN Core.Location L
ON IV.Location_ID = L.Location_ID
LEFT JOIN disagg.Gender G
ON IV.Gender_ID = G.Gender_ID
LEFT JOIN disagg.[Group] Grp
ON IV.Group_ID = Grp.Group_ID
LEFT JOIN disagg.[Donor] D
ON IV.Donor_ID = D.Donor_ID
LEFT JOIN disagg.Framework F
ON IV.Framework_ID = F.Framework_ID 
LEFT JOIN disagg.Institution Inst
ON IV.Institution_ID = Inst.Institution_ID 
WHERE Indicator_ID = @Indicator_ID
and  (@DataVersion_ID <= 0 OR iV.DataVersion_ID = @DataVersion_ID)
	AND (iV.AgeBand_ID		  =  @AgeBand_ID			  OR  @AgeBand_ID		 = 0)
	AND (iV.CommunityType_ID =  @CommunityType_ID  OR 	  @CommunityType_ID	 = 0)
	AND (iV.Gender_ID		  =  @Gender_ID			  OR  @Gender_ID		 = 0)
	AND (iV.Group_ID		  =  @Group_ID		  OR 	  @Group_ID			 = 0)
	AND (iV.Institution_ID	  = @Institution_ID		  OR @Institution_ID	 = 0)
	AND (iV.Donor_ID         =  @Donor_ID OR  @Donor_ID = 0)
	AND (iV.Structure_ID	  =		@Structure_ID			OR @Structure_ID		 =  0) 
	AND (iV.Location_ID	  =		@Location_ID			OR @Location_ID		 =  0)  
	AND (L.LocationType_ID   = @LocationType_ID OR @LocationType_ID    = 0 )