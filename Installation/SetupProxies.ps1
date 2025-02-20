#Import-Module “sqlps” -DisableNameChecking

#Generated Form Function
function GenerateForm {

#region Import the Assemblies
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null

# Load the IntegrationServices Assembly
[Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Management.IntegrationServices")

# Store the IntegrationServices Assembly namespace to avoid typing it every time
$ISNamespace = "Microsoft.SqlServer.Management.IntegrationServices"

#endregion

#region Generated Form Objects
$MeerkatForm = New-Object System.Windows.Forms.Form
$Install = New-Object System.Windows.Forms.Button
$password = New-Object System.Windows.Forms.TextBox
$username = New-Object System.Windows.Forms.TextBox
$datasource = New-Object System.Windows.Forms.TextBox
$label8 = New-Object System.Windows.Forms.Label
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
#Declare variables
$user = $username.Text
$name = $datasource.Text
$pass = $admin_password.Text

#Set up for using msdb
$sqlConnectionStringMsdb = "Data Source=" + $name + ";Initial Catalog=msdb;Integrated Security=SSPI;"
$sqlConnectionMsdb = New-Object System.Data.SqlClient.SqlConnection $sqlConnectionStringMsdb

$sqlConnectionMsdb.Open()

$comm = "CREATE LOGIN [" + $user + "] FROM WINDOWS WITH DEFAULT_DATABASE=[master]"
$cmd = New-Object System.Data.SqlClient.SqlCommand($comm,$sqlConnectionMsdb)
$cmd.ExecuteNonQuery()


$comm = "ALTER SERVER ROLE [sysadmin] ADD MEMBER [" + $user + "]"
$cmd = New-Object System.Data.SqlClient.SqlCommand($comm,$sqlConnectionMsdb)
$cmd.ExecuteNonQuery()

#Set up for using master
$sqlConnectionStringMsdb = "Data Source=" + $name + ";Initial Catalog=master;Integrated Security=SSPI;"
$sqlConnectionMaster = New-Object System.Data.SqlClient.SqlConnection $sqlConnectionStringMsdb

$sqlConnectionMaster.Open()
$comm = "CREATE CREDENTIAL [" + $user + "] WITH IDENTITY = N'" + $user + "', SECRET = N'" + $pass + "'"
$cmd = New-Object System.Data.SqlClient.SqlCommand($comm,$sqlConnectionMaster)
$cmd.ExecuteNonQuery()

#Back to msdb
$comm = "EXEC msdb.dbo.sp_add_proxy @proxy_name=N'" + $user + "',@credential_name=N'" + $user + "', @enabled=1"
$cmd = New-Object System.Data.SqlClient.SqlCommand($comm,$sqlConnectionMsdb)
$cmd.ExecuteNonQuery()



$comm = "EXEC msdb.dbo.sp_grant_proxy_to_subsystem @proxy_name=N'" + $user + "', @subsystem_id=11"
$cmd = New-Object System.Data.SqlClient.SqlCommand($comm,$sqlConnectionMsdb)
$cmd.ExecuteNonQuery()





#$SQLCommandText = @(Get-Content -Path "Installation\Create_Job_Controller_QueueReader.sql") 
#$cmd = New-Object System.Data.SqlClient.SqlCommand($SQLCommandText,$sqlConnectionCmd)
#$cmd.ExecuteNonQuery()
#$sqlConnectionCmd.Close()




#Close the form after executing
$MeerkatForm.close()







#invoke-sqlcmd -inputfile "CreateSSISFolders_Environments.sql" -serverinstance "servername\serverinstance" -database "SSISDB"


}

$OnLoadForm_StateCorrection=
{#Correct the initial state of the form to prevent the .Net maximized form issue
	$MeerkatForm.WindowState = $InitialFormWindowState
}

#----------------------------------------------
#region Generated Form Code
$MeerkatForm.BackColor = [System.Drawing.Color]::FromArgb(255,240,240,240)
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 374
$System_Drawing_Size.Width = 592
$MeerkatForm.ClientSize = $System_Drawing_Size
$MeerkatForm.DataBindings.DefaultDataSourceUpdateMode = 0
$MeerkatForm.Name = "MeerkatForm"
$MeerkatForm.StartPosition = 1
$MeerkatForm.Text = "Meerkat Installation Wizard"


$Install.DataBindings.DefaultDataSourceUpdateMode = 0
$Install.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 156
$System_Drawing_Point.Y = 319
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

$password.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 200
$System_Drawing_Point.Y = 258
$password.Location = $System_Drawing_Point
$password.Name = "Password"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 232
$password.Size = $System_Drawing_Size
$password.TabIndex = 10
$password.UseSystemPasswordChar = $True

$MeerkatForm.Controls.Add($password)

$username.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 200
$System_Drawing_Point.Y = 228
$username.Location = $System_Drawing_Point
$username.Name = "username"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 232
$username.Size = $System_Drawing_Size
$username.TabIndex = 9

$MeerkatForm.Controls.Add($username)


$datasource.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 200
$System_Drawing_Point.Y = 288
$datasource.Location = $System_Drawing_Point
$datasource.Name = "datasource"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 232
$datasource.Size = $System_Drawing_Size
$datasource.TabIndex = 9

$MeerkatForm.Controls.Add($datasource)


$label8.DataBindings.DefaultDataSourceUpdateMode = 0
$label8.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 288
$label8.Location = $System_Drawing_Point
$label8.Name = "label8"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 156
$label8.Size = $System_Drawing_Size
$label8.TabIndex = 5
$label8.Text = "Datasource"

$MeerkatForm.Controls.Add($label8)



$label7.DataBindings.DefaultDataSourceUpdateMode = 0
$label7.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 255
$label7.Location = $System_Drawing_Point
$label7.Name = "label7"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$label7.Size = $System_Drawing_Size
$label7.TabIndex = 6
$label7.Text = "Password:"

$MeerkatForm.Controls.Add($label7)

$label6.DataBindings.DefaultDataSourceUpdateMode = 0
$label6.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 228
$label6.Location = $System_Drawing_Point
$label6.Name = "label6"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 156
$label6.Size = $System_Drawing_Size
$label6.TabIndex = 5
$label6.Text = "Domain\Username"

$MeerkatForm.Controls.Add($label6)


$label1.DataBindings.DefaultDataSourceUpdateMode = 0
$label1.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 43
$label1.Location = $System_Drawing_Point
$label1.Name = "label1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 163
$System_Drawing_Size.Width = 343
$label1.Size = $System_Drawing_Size
$label1.TabIndex = 0
$label1.Text = "Creating jobs to load data on a schedule. Click the button to start installing the product."

$MeerkatForm.Controls.Add($label1)

#endregion Generated Form Code

#Save the initial state of the form
$InitialFormWindowState = $MeerkatForm.WindowState
#Init the OnLoad event to correct the initial state of the form
$MeerkatForm.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$MeerkatForm.ShowDialog()| Out-Null

} #End Function

#Call the Function
GenerateForm