#Generated Form Function
function GenerateForm {

#region Import the Assemblies
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
#endregion

#region Generated Form Objects
$MeerkatForm = New-Object System.Windows.Forms.Form
$Install = New-Object System.Windows.Forms.Button
$capture_password = New-Object System.Windows.Forms.TextBox
$capture_username = New-Object System.Windows.Forms.TextBox
$admin_password = New-Object System.Windows.Forms.TextBox
$admin_username = New-Object System.Windows.Forms.TextBox
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
$admin_name = $admin_username.Text
$admin_pass = $admin_password.Text
$capture_name = $capture_username.Text
$capture_pass = $capture_password.Text

# This section details the preparation for and deployment of the Lightswitch deploy module.
# Create MeerkatAdmin Directory, Site and Application Pool and set properties.
# New Directories
New-Item C:\inetpub\Meerkat_Admin -type Directory
New-Item C:\inetpub\Meerkat_Capture -type Directory
New-Item C:\inetpub\Meerkat_EventRegister -type Directory
New-Item C:\inetpub\Meerkat_FormBuilder -type Directory
New-Item C:\inetpub\Meerkat_FormCapture -type Directory
New-Item C:\inetpub\Meerkat_ReportsManager -type Directory

# New Application Pools
New-Item IIS:\AppPools\Meerkat_Admin
$Admin = Get-Item IIS:\AppPools\Meerkat_Admin
$Admin.managedRuntimeVersion = "v4.0"
$Admin.processModel.identityType = 3
$Admin.processModel.userName = [string]($admin_name)
$Admin.processModel.password = [string]($admin_pass)
$Admin | Set-Item

New-Item IIS:\AppPools\Meerkat_Capture
$Capture = Get-Item IIS:\AppPools\Meerkat_Capture
$Capture.managedRuntimeVersion = "v4.0"
$Capture.processModel.identityType = 3
$Capture.processModel.userName = [string]($admin_name)
$Capture.processModel.password = [string]($admin_pass)
$Capture | Set-Item

# New Sites
New-Item IIS:\Sites\MeerkatAdmin -physicalPath C:\inetpub\Meerkat_Admin -bindings @{protocol="http";bindingInformation=":300:"}
Set-ItemProperty IIS:\Sites\MeerkatAdmin -name applicationPool -value Meerkat_Admin

New-Item IIS:\Sites\Meerkat_Capture -physicalPath C:\inetpub\Meerkat_Capture -bindings @{protocol="http";bindingInformation=":330:"}
Set-ItemProperty IIS:\Sites\Meerkat_Capture -name applicationPool -value Meerkat_Capture

New-Item IIS:\Sites\MeerkatAdmin -physicalPath C:\inetpub\Meerkat_EventRegister -bindings @{protocol="http";bindingInformation=":340:"}
Set-ItemProperty IIS:\Sites\MeerkatAdmin -name applicationPool -value Meerkat_EventRegister

New-Item IIS:\Sites\Meerkat_Capture -physicalPath C:\inetpub\Meerkat_FormBuilder -bindings @{protocol="http";bindingInformation=":310:"}
Set-ItemProperty IIS:\Sites\Meerkat_Capture -name applicationPool -value FormBuilder

New-Item IIS:\Sites\MeerkatAdmin -physicalPath C:\inetpub\Meerkat_FormCapture -bindings @{protocol="http";bindingInformation=":320:"}
Set-ItemProperty IIS:\Sites\MeerkatAdmin -name applicationPool -value Meerkat_FormCapture

New-Item IIS:\Sites\Meerkat_Capture -physicalPath C:\inetpub\Meerkat_ReportsManager -bindings @{protocol="http";bindingInformation=":350:"}
Set-ItemProperty IIS:\Sites\Meerkat_Capture -name applicationPool -value Meerkat_ReportsManager

#Deploy Lightswitch Applications
#Deploys done through standard deploy tool
#C:\Deploy\MeerkatAdmin\MeerkatAdmin_2_1.deploy.cmd /Y
#C:\Deploy\MeerkatCapture\Meerkat_Capture.deploy.cmd /Y

#Close the form after executing
$MeerkatForm.close()

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

$capture_password.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 104
$System_Drawing_Point.Y = 255
$capture_password.Location = $System_Drawing_Point
$capture_password.Name = "capture_password"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 232
$capture_password.Size = $System_Drawing_Size
$capture_password.TabIndex = 10
$capture_password.UseSystemPasswordChar = $True

$MeerkatForm.Controls.Add($capture_password)

$capture_username.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 104
$System_Drawing_Point.Y = 228
$capture_username.Location = $System_Drawing_Point
$capture_username.Name = "capture_username"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 232
$capture_username.Size = $System_Drawing_Size
$capture_username.TabIndex = 9

$MeerkatForm.Controls.Add($capture_username)

$admin_password.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 104
$System_Drawing_Point.Y = 163
$admin_password.Location = $System_Drawing_Point
$admin_password.Name = "admin_password"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 232
$admin_password.Size = $System_Drawing_Size
$admin_password.TabIndex = 8
$admin_password.UseSystemPasswordChar = $True

$MeerkatForm.Controls.Add($admin_password)

$admin_username.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 104
$System_Drawing_Point.Y = 137
$admin_username.Location = $System_Drawing_Point
$admin_username.Name = "admin_username"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 232
$admin_username.Size = $System_Drawing_Size
$admin_username.TabIndex = 7

$MeerkatForm.Controls.Add($admin_username)

$label7.DataBindings.DefaultDataSourceUpdateMode = 0
$label7.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 255
$label7.Location = $System_Drawing_Point
$label7.Name = "label7"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 71
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
$System_Drawing_Size.Width = 71
$label6.Size = $System_Drawing_Size
$label6.TabIndex = 5
$label6.Text = "Username:"

$MeerkatForm.Controls.Add($label6)

$label5.DataBindings.DefaultDataSourceUpdateMode = 0
$label5.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 201
$label5.Location = $System_Drawing_Point
$label5.Name = "label5"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$label5.Size = $System_Drawing_Size
$label5.TabIndex = 4
$label5.Text = "Capture Site:"

$MeerkatForm.Controls.Add($label5)

$label4.DataBindings.DefaultDataSourceUpdateMode = 0
$label4.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 164
$label4.Location = $System_Drawing_Point
$label4.Name = "label4"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 71
$label4.Size = $System_Drawing_Size
$label4.TabIndex = 3
$label4.Text = "Password:"

$MeerkatForm.Controls.Add($label4)

$label3.DataBindings.DefaultDataSourceUpdateMode = 0
$label3.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 137
$label3.Location = $System_Drawing_Point
$label3.Name = "label3"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 71
$label3.Size = $System_Drawing_Size
$label3.TabIndex = 2
$label3.Text = "Username:"

$MeerkatForm.Controls.Add($label3)

$label2.DataBindings.DefaultDataSourceUpdateMode = 0
$label2.Font = New-Object System.Drawing.Font("Segoe UI",9.75,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 110
$label2.Location = $System_Drawing_Point
$label2.Name = "label2"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$label2.Size = $System_Drawing_Size
$label2.TabIndex = 1
$label2.Text = "Admin Site:"

$MeerkatForm.Controls.Add($label2)

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
$label1.Text = "Welcome to the Meerkat Installation Wizard. Fill out the details below and click the button to start installing the product."

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