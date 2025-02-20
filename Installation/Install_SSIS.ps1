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
$datasource = New-Object System.Windows.Forms.TextBox
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
$name = $datasource.Text
$pass = $admin_password.Text


#Close the form after executing
$MeerkatForm.close()



# Create a connection to the server
$sqlConnectionString = "Data Source=" + $name + ";Initial Catalog=master;Integrated Security=SSPI;"
$sqlConnection = New-Object System.Data.SqlClient.SqlConnection $sqlConnectionString
# Create the Integration Services object
$integrationServices = New-Object $ISNamespace".IntegrationServices" $sqlConnection

# Provision a new SSIS Catalog
$catalog = New-Object $ISNamespace".Catalog" ($integrationServices, "SSISDB", $pass)
$catalog.Create()


#Set up system configurations

$comm = "sp_configure 'show advanced options', 1"
$cmd = New-Object System.Data.SqlClient.SqlCommand($comm,$sqlConnection)
$cmd.ExecuteNonQuery()

$comm = "RECONFIGURE WITH OverRide"
$cmd = New-Object System.Data.SqlClient.SqlCommand($comm,$sqlConnection)
$cmd.ExecuteNonQuery()

$comm = "sp_configure 'Ad Hoc Distributed Queries', 1"
$cmd = New-Object System.Data.SqlClient.SqlCommand($comm,$sqlConnection)
$cmd.ExecuteNonQuery()

$comm = "RECONFIGURE WITH OVERRIDE"
$cmd = New-Object System.Data.SqlClient.SqlCommand($comm,$sqlConnection)
$cmd.ExecuteNonQuery()

$comm = "EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0' ,  N'AllowInProcess' ,  1"
$cmd = New-Object System.Data.SqlClient.SqlCommand($comm,$sqlConnection)
$cmd.ExecuteNonQuery()

$comm = "EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0' ,  N'DynamicParameters' ,  1"
$cmd = New-Object System.Data.SqlClient.SqlCommand($comm,$sqlConnection)
$cmd.ExecuteNonQuery()




#Set up for using SSISDB
$sqlConnectionStringCmd = "Data Source=" + $name + ";Initial Catalog=SSISDB;Integrated Security=SSPI;"
$sqlConnectionCmd = New-Object System.Data.SqlClient.SqlConnection $sqlConnectionStringCmd


#Create folders, environments
$sqlConnectionCmd.Open()
$SQLCommandText = @(Get-Content -Path "Installation\CreateSSISFolders_Environments.sql") 
$cmd = New-Object System.Data.SqlClient.SqlCommand($SQLCommandText,$sqlConnectionCmd)
$cmd.ExecuteNonQuery()
$sqlConnectionCmd.Close()




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
$System_Drawing_Size.Width = 392
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
$System_Drawing_Point.X = 144
$System_Drawing_Point.Y = 255
$password.Location = $System_Drawing_Point
$password.Name = "Password"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 232
$password.Size = $System_Drawing_Size
$password.TabIndex = 10
$password.UseSystemPasswordChar = $True

$MeerkatForm.Controls.Add($password)

$datasource.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 144
$System_Drawing_Point.Y = 228
$datasource.Location = $System_Drawing_Point
$datasource.Name = "datasource"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 232
$datasource.Size = $System_Drawing_Size
$datasource.TabIndex = 9

$MeerkatForm.Controls.Add($datasource)


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
$System_Drawing_Size.Width = 100
$label6.Size = $System_Drawing_Size
$label6.TabIndex = 5
$label6.Text = "Datasource:"

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
$label1.Text = "Welcome to the Meerkat Installation Wizard. Fill out the details for SSIS installation below and click the button to start installing the product. Make sure to save the password used to encrypte the catalog."

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