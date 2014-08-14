function GenerateForm {

#region Import the Assemblies
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
#endregion

#region Generated Form Objects
$MeerkatForm = New-Object System.Windows.Forms.Form
$Install = New-Object System.Windows.Forms.Button
$txtDatabaseServer  = New-Object System.Windows.Forms.TextBox
$txtFarmAccount  = New-Object System.Windows.Forms.TextBox
$txtrootname   = New-Object System.Windows.Forms.TextBox
$txtsitecoll   = New-Object System.Windows.Forms.TextBox
$txtrootfilePath  = New-Object System.Windows.Forms.TextBox
$txttemplate  = New-Object System.Windows.Forms.TextBox
$txtuser      = New-Object System.Windows.Forms.TextBox
$txtreportsfilepath = New-Object System.Windows.Forms.TextBox
$txtbaseURL  = New-Object System.Windows.Forms.TextBox
$txtmasterpage  = New-Object System.Windows.Forms.TextBox

$lblDatabaseServer  = New-Object System.Windows.Forms.Label
$lblFarmAccount  = New-Object System.Windows.Forms.Label
$lblrootname   = New-Object System.Windows.Forms.Label
$lblsitecoll   = New-Object System.Windows.Forms.Label
$lblrootfilePath  = New-Object System.Windows.Forms.Label
$lbltemplate  = New-Object System.Windows.Forms.Label
$lbluser      = New-Object System.Windows.Forms.Label
$lblreportsfilepath = New-Object System.Windows.Forms.Label
$lblbaseURL  = New-Object System.Windows.Forms.Label
$lblmasterpage  = New-Object System.Windows.Forms.Label


$label7 = New-Object System.Windows.Forms.Label
$label6 = New-Object System.Windows.Forms.Label
$label5 = New-Object System.Windows.Forms.Label
$label4 = New-Object System.Windows.Forms.Label
$label3 = New-Object System.Windows.Forms.Label
$label2 = New-Object System.Windows.Forms.Label
$label1 = New-Object System.Windows.Forms.Label
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
#endregion Generated Form Objects








#Code for click event.
$handler_Install_Click= 
{

#Parameters needed
#01 and 02
$DatabaseServer = $txtDatabaseServer.Text
$FarmAccount = $txtFarmAccount.Text

$rootname = $rootname.Text #RootSiteName
$sitecoll = $sitecoll.Text #RootSiteCollectionLocation
$rootfilePath =$txtrootfilePath.Text #Root site path 
$template =$txttemplate.Text #STS#0 for team site
$user     = $txtuser.Text     #site collection owner

$reportsfilepath = $txtreportsfilepath.Text #filepath for reports import

#Not implemented yet - fix reports paths
#[string]$sitecoll,
#[string]$filePath,
#[string]$library,
#[string]$datasource

#Fix LS ref
$baseURL = $txtbaseURL.Text #Base URL for LS apps
$SpSite = $sitecoll
$masterpage = $txtmasterpage.Text #Masterpage name


$ScriptPath = Split-Path $MyInvocation.InvocationName

invoke-expression -Command "$ScriptPath\01_Meerkat.PSConfig.v001.ps1 -DatabaseServer $DatabaseServer -FarmAccount $FarmAccount"
invoke-expression -Command "$ScriptPath\02_Meerkat.Service Application Setup.v001.ps1 -DatabaseServer $DatabaseServer -FarmAccount $FarmAccount"
invoke-expression -Command "$ScriptPath\03_Meerkat_ImportRootSite.ps1 -name $name -sitecoll $sitecoll -filePath $filePath -template $template -user $user"
invoke-expression -Command "$ScriptPath\04_Meerkat_ImportReportSite.ps1  -name $name -sitecoll $sitecoll -filePath $filePath -template $template -user $user"
invoke-expression -Command "$ScriptPath\06_FixLSiteReferences.ps1 -baseURL $baseURL -SpSite $SpSite"
invoke-expression -Command "$ScriptPath\07_SwitchMasterPage.ps1 -SpSite $SpSite -masterpage $masterpage"

#Close the form after executing
$MeerkatForm.close()

}

#region Other stuff

$OnLoadForm_StateCorrection=
{#Correct the initial state of the form to prevent the .Net maximized form issue
	$MeerkatForm.WindowState = $InitialFormWindowState
}

#----------------------------------------------
#region Generated Form Code
$MeerkatForm.BackColor = [System.Drawing.Color]::FromArgb(255,240,240,240)
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 674
$System_Drawing_Size.Width = 692
$MeerkatForm.ClientSize = $System_Drawing_Size
$MeerkatForm.DataBindings.DefaultDataSourceUpdateMode = 0
$MeerkatForm.Name = "MeerkatForm"
$MeerkatForm.StartPosition = 1
$MeerkatForm.Text = "Meerkat Installation Wizard"


$Install.DataBindings.DefaultDataSourceUpdateMode = 0
$Install.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 156
$System_Drawing_Point.Y = 440
$Install.Location = $System_Drawing_Point
$Install.Name = "Install"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$Install.Size = $System_Drawing_Size
$Install.TabIndex = 11
$Install.Text = "Install"
$Install.UseVisualStyleBackColor = $True
$Install.add_Click($handler_Install_Click)

$MeerkatForm.Controls.Add($Install)







$label1.DataBindings.DefaultDataSourceUpdateMode = 0
$label1.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 43
$label1.Location = $System_Drawing_Point
$label1.Name = "label1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 63
$System_Drawing_Size.Width = 343
$label1.Size = $System_Drawing_Size
$label1.TabIndex = 0
$label1.Text = "Welcome to the Meerkat Installation Wizard for SharePoint. Fill out the details below and click the button to start installing the product."

$MeerkatForm.Controls.Add($label1)


#region TSQL generated


$txtDatabaseServer.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 200
$System_Drawing_Point.Y = 130
$txtDatabaseServer.Location = $System_Drawing_Point
$txtDatabaseServer.Name = "txtDatabaseServer"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 432
$txtDatabaseServer.Size = $System_Drawing_Size
$txtDatabaseServer.TabIndex = 11
$txtDatabaseServer.UseSystemPasswordChar = $False
$txtDatabaseServer.Text = "."

$MeerkatForm.Controls.Add($txtDatabaseServer)
$txtFarmAccount.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 200
$System_Drawing_Point.Y = 160
$txtFarmAccount.Location = $System_Drawing_Point
$txtFarmAccount.Name = "txtFarmAccount"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 432
$txtFarmAccount.Size = $System_Drawing_Size
$txtFarmAccount.TabIndex = 12
$txtFarmAccount.UseSystemPasswordChar = $False
$txtFarmAccount.Text = "domain\username"

$MeerkatForm.Controls.Add($txtFarmAccount)
$txtrootname.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 200
$System_Drawing_Point.Y = 190
$txtrootname.Location = $System_Drawing_Point
$txtrootname.Name = "txtrootname"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 432
$txtrootname.Size = $System_Drawing_Size
$txtrootname.TabIndex = 13
$txtrootname.UseSystemPasswordChar = $False
$txtrootname.Text = "Meerkat"

$MeerkatForm.Controls.Add($txtrootname)
$txtsitecoll.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 200
$System_Drawing_Point.Y = 220
$txtsitecoll.Location = $System_Drawing_Point
$txtsitecoll.Name = "txtsitecoll"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 432
$txtsitecoll.Size = $System_Drawing_Size
$txtsitecoll.TabIndex = 14
$txtsitecoll.UseSystemPasswordChar = $False
$txtsitecoll.Text = "http://meerkat"

$MeerkatForm.Controls.Add($txtsitecoll)
$txtrootfilePath.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 200
$System_Drawing_Point.Y = 250
$txtrootfilePath.Location = $System_Drawing_Point
$txtrootfilePath.Name = "txtrootfilePath"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 432
$txtrootfilePath.Size = $System_Drawing_Size
$txtrootfilePath.TabIndex = 15
$txtrootfilePath.UseSystemPasswordChar = $False
$txtrootfilePath.Text = "C:\GitHub\Meerkat\Installation\SP\Export\Meerkat_Root.cmp"

$MeerkatForm.Controls.Add($txtrootfilePath)
$txttemplate.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 200
$System_Drawing_Point.Y = 280
$txttemplate.Location = $System_Drawing_Point
$txttemplate.Name = "txttemplate"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 432
$txttemplate.Size = $System_Drawing_Size
$txttemplate.TabIndex = 16
$txttemplate.UseSystemPasswordChar = $False
$txttemplate.Text = "STS#0"

$MeerkatForm.Controls.Add($txttemplate)
$txtuser.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 200
$System_Drawing_Point.Y = 310
$txtuser.Location = $System_Drawing_Point
$txtuser.Name = "txtuser"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 432
$txtuser.Size = $System_Drawing_Size
$txtuser.TabIndex = 17
$txtuser.UseSystemPasswordChar = $False
$txtuser.Text = "domain\user"

$MeerkatForm.Controls.Add($txtuser)
$txtreportsfilepath.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 200
$System_Drawing_Point.Y = 340
$txtreportsfilepath.Location = $System_Drawing_Point
$txtreportsfilepath.Name = "txtreportsfilepath"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 432
$txtreportsfilepath.Size = $System_Drawing_Size
$txtreportsfilepath.TabIndex = 18
$txtreportsfilepath.UseSystemPasswordChar = $False
$txtreportsfilepath.Text  = "C:\GitHub\Meerkat\Installation\SP\Export\Meerkat_reports.cmp"

$MeerkatForm.Controls.Add($txtreportsfilepath)
$txtbaseURL.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 200
$System_Drawing_Point.Y = 370
$txtbaseURL.Location = $System_Drawing_Point
$txtbaseURL.Name = "txtbaseURL"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 432
$txtbaseURL.Size = $System_Drawing_Size
$txtbaseURL.TabIndex = 19
$txtbaseURL.UseSystemPasswordChar = $False
$txtbaseURL.Text = "http://Meerkat"

$MeerkatForm.Controls.Add($txtbaseURL)
$txtmasterpage.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 200
$System_Drawing_Point.Y = 400
$txtmasterpage.Location = $System_Drawing_Point
$txtmasterpage.Name = "txtmasterpage"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 432
$txtmasterpage.Size = $System_Drawing_Size
$txtmasterpage.TabIndex = 20
$txtmasterpage.UseSystemPasswordChar = $False
$txtmasterpage.Text = "meerkat-care.master"


$MeerkatForm.Controls.Add($txtmasterpage)



$lblDatabaseServer.DataBindings.DefaultDataSourceUpdateMode = 0
$lblDatabaseServer.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 130
$lblDatabaseServer.Location = $System_Drawing_Point
$lblDatabaseServer.Name = "DatabaseServer"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 156
$lblDatabaseServer.Size = $System_Drawing_Size
$lblDatabaseServer.TabIndex = 101
$lblDatabaseServer.Text = "DBServer:"

$MeerkatForm.Controls.Add($lblDatabaseServer)

$lblFarmAccount.DataBindings.DefaultDataSourceUpdateMode = 0
$lblFarmAccount.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 160
$lblFarmAccount.Location = $System_Drawing_Point
$lblFarmAccount.Name = "FarmAccount"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 156
$lblFarmAccount.Size = $System_Drawing_Size
$lblFarmAccount.TabIndex = 102
$lblFarmAccount.Text = "FarmAccount:"

$MeerkatForm.Controls.Add($lblFarmAccount)

$lblrootname.DataBindings.DefaultDataSourceUpdateMode = 0
$lblrootname.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 190
$lblrootname.Location = $System_Drawing_Point
$lblrootname.Name = "Root site name"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 156
$lblrootname.Size = $System_Drawing_Size
$lblrootname.TabIndex = 103
$lblrootname.Text = "Root sitename"

$MeerkatForm.Controls.Add($lblrootname)

$lblsitecoll.DataBindings.DefaultDataSourceUpdateMode = 0
$lblsitecoll.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 220
$lblsitecoll.Location = $System_Drawing_Point
$lblsitecoll.Name = "Si"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 156
$lblsitecoll.Size = $System_Drawing_Size
$lblsitecoll.TabIndex = 104
$lblsitecoll.Text = "Site URL"

$MeerkatForm.Controls.Add($lblsitecoll)

$lblrootfilePath.DataBindings.DefaultDataSourceUpdateMode = 0
$lblrootfilePath.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 250
$lblrootfilePath.Location = $System_Drawing_Point
$lblrootfilePath.Name = "rootfilePath"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 156
$lblrootfilePath.Size = $System_Drawing_Size
$lblrootfilePath.TabIndex = 105
$lblrootfilePath.Text = "Root backup"

$MeerkatForm.Controls.Add($lblrootfilePath)

$lbltemplate.DataBindings.DefaultDataSourceUpdateMode = 0
$lbltemplate.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 280
$lbltemplate.Location = $System_Drawing_Point
$lbltemplate.Name = "template"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 156
$lbltemplate.Size = $System_Drawing_Size
$lbltemplate.TabIndex = 106
$lbltemplate.Text = "Site Template"

$MeerkatForm.Controls.Add($lbltemplate)

$lbluser.DataBindings.DefaultDataSourceUpdateMode = 0
$lbluser.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 310
$lbluser.Location = $System_Drawing_Point
$lbluser.Name = "user"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 156
$lbluser.Size = $System_Drawing_Size
$lbluser.TabIndex = 107
$lbluser.Text = "Site owner"

$MeerkatForm.Controls.Add($lbluser)

$lblreportsfilepath.DataBindings.DefaultDataSourceUpdateMode = 0
$lblreportsfilepath.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 340
$lblreportsfilepath.Location = $System_Drawing_Point
$lblreportsfilepath.Name = "reportsfilepath"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 156
$lblreportsfilepath.Size = $System_Drawing_Size
$lblreportsfilepath.TabIndex = 108
$lblreportsfilepath.Text = "Report site backup"

$MeerkatForm.Controls.Add($lblreportsfilepath)

$lblbaseURL.DataBindings.DefaultDataSourceUpdateMode = 0
$lblbaseURL.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 370
$lblbaseURL.Location = $System_Drawing_Point
$lblbaseURL.Name = "baseURL"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 156
$lblbaseURL.Size = $System_Drawing_Size
$lblbaseURL.TabIndex = 109
$lblbaseURL.Text = "LS Base URL"

$MeerkatForm.Controls.Add($lblbaseURL)

$lblmasterpage.DataBindings.DefaultDataSourceUpdateMode = 0
$lblmasterpage.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 400
$lblmasterpage.Location = $System_Drawing_Point
$lblmasterpage.Name = "masterpage"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 156
$lblmasterpage.Size = $System_Drawing_Size
$lblmasterpage.TabIndex = 110
$lblmasterpage.Text = "Masterpage name"

$MeerkatForm.Controls.Add($lblmasterpage)

#endregion



#endregion Generated Form Code

#Save the initial state of the form
$InitialFormWindowState = $MeerkatForm.WindowState
#Init the OnLoad event to correct the initial state of the form
$MeerkatForm.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$MeerkatForm.ShowDialog()| Out-Null
#endregion
} #End Function

#Call the Function
GenerateForm