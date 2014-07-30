CREATE FUNCTION [mm].[OutcomeXMenuLink]
(
		@OutcomeId int 
)
RETURNS @OutcomeXMenuLinkTable TABLE
(
	Title VarChar(50) NOT NULL,
	link VARCHAR NULL,
	id INT PRIMARY KEY NOT NULL,
	parent VARCHAR NULL
)
AS
BEGIN
  DECLARE 
    @Title VarChar(50),
	@link VARCHAR,
	@id INT,
	@parent VARCHAR 

  SELECT @Title = Substring(title, 1, 50), 
         @link = link, 
         @id = id, 
         @parent = parent 
  FROM   mm.all_outcomemenulink 
  WHERE  outcomeid = @OutcomeId

  INSERT @OutcomeXMenuLinkTable
  SELECT @Title, @link, @id, @parent;

  RETURN
END
