/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

/*Outcomes Meerkat*/

SET IDENTITY_INSERT [app].[Outcome] ON 


INSERT  [app].[Outcome]
        ( [app].[Outcome].[Outcome_ID] ,
          [app].[Outcome].[Code] ,
          [app].[Outcome].[LongName] ,
          [app].[Outcome].[BusinessKey] ,
          [app].[Outcome].[ShortName] ,
          [app].[Outcome].[TextDescription] ,
          [app].[Outcome].[OutcomeSiteName] ,
          [app].[Outcome].[DataVersion]
        )
        SELECT  1 ,
                N'Outcome 1' ,
                N'Eradicate Extreme Poverty and Hunger' ,
                N'Outcome 1' ,
                N'Eradicate Extreme Poverty and Hunger' ,
                N'The Ministry of Agriculture formulated the Strategy for Revitalizing Agriculture (2004-2014) and developed a Strategic Plan (2008-2012) both of which put forward fairly elaborate interventions that could contribute very substantially to improved agricultural productivity at the household level thereby touching positively the food security of the poor.' ,
                N'Outcome1' ,
                0
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Outcome]
                             WHERE  [app].[Outcome].[Outcome_ID] = 1 ) 
 
INSERT  [app].[Outcome]
        ( [app].[Outcome].[Outcome_ID] ,
          [app].[Outcome].[Code] ,
          [app].[Outcome].[LongName] ,
          [app].[Outcome].[BusinessKey] ,
          [app].[Outcome].[ShortName] ,
          [app].[Outcome].[TextDescription] ,
          [app].[Outcome].[OutcomeSiteName] ,
          [app].[Outcome].[DataVersion]
        )
        SELECT  2 ,
                N'Outcome 2' ,
                N'Achieve Universal Primary Education' ,
                N'Outcome 2' ,
                N'Achieve Universal Primary Education' ,
                N'Enrolment in both public and private schools increased by 2.3% from 8.6 million in 2008 to 8.8 million in 2009. The gross enrolment rate (GER) rose from 109.8% in 2008 to 110% in the year 2009. The net enrolment rate (NER) rose slightly from 92.5% in 2008 to 92.9% in 2009. There has been a consistent improvement of NER from 2005 to 2009. This is attributed to the introduction of the Free Primary Education which enabled children to begin schooling at the right school going age.' ,
                N'Outcome2' ,
                0
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Outcome]
                             WHERE  [app].[Outcome].[Outcome_ID] = 2 ) 

INSERT  [app].[Outcome]
        ( [app].[Outcome].[Outcome_ID] ,
          [app].[Outcome].[Code] ,
          [app].[Outcome].[LongName] ,
          [app].[Outcome].[BusinessKey] ,
          [app].[Outcome].[ShortName] ,
          [app].[Outcome].[TextDescription] ,
          [app].[Outcome].[OutcomeSiteName] ,
          [app].[Outcome].[DataVersion]
        )
        SELECT  3 ,
                N'Outcome 3' ,
                N'Gender Equality and Women Empowerment' ,
                N'Outcome 3' ,
                N'Gender Equality and Women Empowerment' ,
                N'The governments commitment to invest in social services to improve the welfare of the population has been consistent in the past 8 years. The total social sector expenditure increased by 19.8 per cent from KES 197,537.4 million in the 2008/09 to KES 236,578.7 million in the 2009/10 Financial Year. The ministry of Gender, Children and Social Services recorded the highest increase in expenditure of 82.3 per cent. The central government expenditure on social services in regard to Gender increased from KES 1,421.42 in 2008/09 to 3,049.36 million in the 2009/10 FY. The new constitution inaugurated in 2010 provides for 30% representation of women in all elected and public offices.' ,
                N'Outcome3' ,
                0
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Outcome]
                             WHERE  [app].[Outcome].[Outcome_ID] = 3 ) 


INSERT  [app].[Outcome]
        ( [app].[Outcome].[Outcome_ID] ,
          [app].[Outcome].[Code] ,
          [app].[Outcome].[LongName] ,
          [app].[Outcome].[BusinessKey] ,
          [app].[Outcome].[ShortName] ,
          [app].[Outcome].[TextDescription] ,
          [app].[Outcome].[OutcomeSiteName] ,
          [app].[Outcome].[DataVersion]
        )
        SELECT  4 ,
                N'Outcome 4' ,
                N'Reduce child mortality' ,
                N'Outcome 4' ,
                N'Reduce child mortality' ,
                N'Government launched a Child Survival and development Strategy that is budgeted in 2009 as an effort to accelerate child survival and provide a framework to improve indicators for children. The strategy is guided by the National Health Sector Strategic Plan II (NHSSP II) and the Vision 2030 Medium Term Plan that aim to reduce inequalities in the health care services and improve on the child health indicators.' ,
                N'Outcome4' ,
                0
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Outcome]
                             WHERE  [app].[Outcome].[Outcome_ID] = 4 ) 


INSERT  [app].[Outcome]
        ( [app].[Outcome].[Outcome_ID] ,
          [app].[Outcome].[Code] ,
          [app].[Outcome].[LongName] ,
          [app].[Outcome].[BusinessKey] ,
          [app].[Outcome].[ShortName] ,
          [app].[Outcome].[TextDescription] ,
          [app].[Outcome].[OutcomeSiteName] ,
          [app].[Outcome].[DataVersion]
        )
        SELECT  5 ,
                N'Outcome 5' ,
                N'Improve maternal health' ,
                N'Outcome 5' ,
                N'Improve maternal health' ,
                N'Maternal mortality in Kenya has remained unacceptably high at 488 maternal deaths per 100,000 live births (with some regions reporting MMRs of 1,000/100,000 live births) in 2008/9, an increase from 414/100,000 in 2003, 590/100,000 in 1998. Most maternal deaths are due to causes directly related to pregnancy and childbirth unsafe abortion and obstetric complications such as severe bleeding, infection, hypertensive disorders, and obstructed labor. Others are due to causes such as malaria, diabetes, hepatitis, and anaemia, which are aggravated by pregnancy.' ,
                N'Outcome5' ,
                0
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Outcome]
                             WHERE  [app].[Outcome].[Outcome_ID] = 5 ) 


INSERT  [app].[Outcome]
        ( [app].[Outcome].[Outcome_ID] ,
          [app].[Outcome].[Code] ,
          [app].[Outcome].[LongName] ,
          [app].[Outcome].[BusinessKey] ,
          [app].[Outcome].[ShortName] ,
          [app].[Outcome].[TextDescription] ,
          [app].[Outcome].[OutcomeSiteName] ,
          [app].[Outcome].[DataVersion]
        )
        SELECT  6 ,
                N'Outcome 6' ,
                N'Combat HIV/AIDS, malaria and other diseases' ,
                N'Outcome 6' ,
                N'Combat HIV/AIDS, malaria and other diseases' ,
                N'Recent studies indicate that whereas Kenya has made significant progress in the fight against HIV/AIDS, the national prevalence rates still raise concern.. The KDHS 2008/09 states that "in Kenya, HIV prevalence has not changed significantly in the past five years. The HIV prevalence is 6.3% for women and men aged 15-49, compared with 6.7% in the 2003 KDHS and 7.4% in the 2007 Kenya AIDS Indicator Survey".' ,
                N'Outcome6' ,
                0
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Outcome]
                             WHERE  [app].[Outcome].[Outcome_ID] = 6 ) 

INSERT  [app].[Outcome]
        ( [app].[Outcome].[Outcome_ID] ,
          [app].[Outcome].[Code] ,
          [app].[Outcome].[LongName] ,
          [app].[Outcome].[BusinessKey] ,
          [app].[Outcome].[ShortName] ,
          [app].[Outcome].[TextDescription] ,
          [app].[Outcome].[OutcomeSiteName] ,
          [app].[Outcome].[DataVersion]
        )
        SELECT  7 ,
                N'Outcome 7' ,
                N'Ensure environmental sustainability' ,
                N'Outcome 7' ,
                N'Ensure environmental sustainability' ,
                N'The Environmental Management and Coordination Act (EMCA) of 1999 provides a comprehensive legislative framework for the management of the environment in the country. The legislation provided for the creation of the National Environment Management Authority (NEMA), a competent authority mandated to safeguard and enhance environmental quality through coordination, research, facilitation and enforcement. The organization has an important responsibility coordinating the preparation of Environmental Action Plans (EAPs) at district, provincial and national levels. The country has also ratified and domesticated various multilateral environmental agreements.' ,
                N'Outcome7' ,
                0
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Outcome]
                             WHERE  [app].[Outcome].[Outcome_ID] = 7 ) 


INSERT  [app].[Outcome]
        ( [app].[Outcome].[Outcome_ID] ,
          [app].[Outcome].[Code] ,
          [app].[Outcome].[LongName] ,
          [app].[Outcome].[BusinessKey] ,
          [app].[Outcome].[ShortName] ,
          [app].[Outcome].[TextDescription] ,
          [app].[Outcome].[OutcomeSiteName] ,
          [app].[Outcome].[DataVersion]
        )
        SELECT  8 ,
                N'Outcome 8' ,
                N'Develop a global partnership for development' ,
                N'Outcome 8' ,
                N'Develop a global artnership for development' ,
                N'The MDG goal 8 on developing a global partnership for development gives international trade indicators that are intended to improve market access of developing countries and least developed countries exports to the developed economy markets. Trade has increasingly become the cornerstone of the Kenyas economic development in the 21st century. Kenyas trade share of GDP in 2007 stood at about 55.4%. In 2007, merchandize trade contributed about 60.6% of total exports while services constituted about 38.8%. Trade in services also continues to be critical in Kenyas quest for sustainable economic growth and development. In 2007, services accounted for about 60% of Kenyas GDP with leading contributors being Transport and communication, postal and telecommunications, and wholesale and retail trade.' ,
                N'Outcome8' ,
                0
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Outcome]
                             WHERE  [app].[Outcome].[Outcome_ID] = 8 ) 

SET IDENTITY_INSERT [app].[Outcome]  OFF
