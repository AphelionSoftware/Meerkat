
set nocount on
declare @tbl table	( txt varchar(255), ord int)

INSERT INTO @TBL VALUES ('txtlDatabaseServer',1)
INSERT INTO @TBL VALUES ('txtlFarmAccount', 2)
INSERT INTO @TBL VALUES ('txtlrootname', 3)
INSERT INTO @TBL VALUES ('txtlsitecoll', 4)
INSERT INTO @TBL VALUES ('txtlrootfilePath', 5)
INSERT INTO @TBL VALUES ('txtltemplate', 6)
INSERT INTO @TBL VALUES ('txtluser', 7)
INSERT INTO @TBL VALUES ('txtlreportsfilepath', 8)
INSERT INTO @TBL VALUES ('txtlbaseURL', 9)
INSERT INTO @TBL VALUES ('txtlmasterpage', 10)



select '$' + txt + '.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 144
$System_Drawing_Point.Y = ' + cast( 100 + (ord * 30) as varchar(255)) +'
$' + txt + '.Location = $System_Drawing_Point
$' + txt + '.Name = "' + txt + '"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 232
$' + txt + '.Size = $System_Drawing_Size
$' + txt + '.TabIndex = '+ cast( 10 + (ord) as varchar(255)) +'
$' + txt + '.UseSystemPasswordChar = $True

$MeerkatForm.Controls.Add($' + txt + ')
'
from @tbl


update @tbl set txt = replace(txt, 'txtl', 'lbl')


select '
$' + txt + '.DataBindings.DefaultDataSourceUpdateMode = 0
$' + txt + '.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = ' + cast( 100 + (ord * 30) as varchar(255)) +'
$' + txt + '.Location = $System_Drawing_Point
$' + txt + '.Name = "' + txt + '"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$' + txt + '.Size = $System_Drawing_Size
$' + txt + '.TabIndex = '+ cast( 100 + (ord) as varchar(255)) +'
$' + txt + '.Text = "' + txt + ':"

$MeerkatForm.Controls.Add($' + txt + ')'
from @tbl

