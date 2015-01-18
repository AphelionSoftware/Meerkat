Import-Module WebAdministration

#Generated Form Function
function GenerateForm {

#region Import the Assemblies
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
#endregion

#region Generated Form Objects
$MeerkatForm = New-Object System.Windows.Forms.Form
$Install = New-Object System.Windows.Forms.Button
$password = New-Object System.Windows.Forms.TextBox
$username = New-Object System.Windows.Forms.TextBox
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
$name = $username.Text
$pass = $admin_password.Text

# This section details the preparation for and deployment of the Lightswitch deploy module.
# Create MeerkatAdmin Directory, Site and IIS:\AppPools\ND_Meerkat Pool and set properties.
# New Directories
New-Item C:\inetpub\ND_Meerkat_Admin -type Directory
New-Item C:\inetpub\ND_Meerkat_Capture -type Directory
New-Item C:\inetpub\ND_Meerkat_EventRegister -type Directory
New-Item C:\inetpub\ND_Meerkat_FormBuilder -type Directory
New-Item C:\inetpub\ND_Meerkat_FormCapture -type Directory
New-Item C:\inetpub\ND_Meerkat_ReportsManager -type Directory
New-Item C:\inetpub\ND_Meerkat_UAM -type Directory
New-Item C:\inetpub\ND_Meerkat_MegaMenu -type Directory


# New IIS:\AppPools\ND_Meerkat Pools
New-Item IIS:\AppPools\ND_Meerkat_Admin
$Admin = Get-Item IIS:\AppPools\ND_Meerkat_Admin
$Admin.managedRuntimeVersion = "v4.0"
$Admin.processModel.identityType = 3
$Admin.processModel.userName = [string]($name)
$Admin.processModel.password = [string]($pass)
$Admin | Set-Item

New-Item IIS:\AppPools\ND_Meerkat_Capture
$Capture = Get-Item IIS:\AppPools\ND_Meerkat_Capture
$Capture.managedRuntimeVersion = "v4.0"
$Capture.processModel.identityType = 3
$Capture.processModel.userName = [string]($name)
$Capture.processModel.password = [string]($pass)
$Capture | Set-Item

New-Item IIS:\AppPools\ND_Meerkat_EventRegister
$Capture = Get-Item IIS:\AppPools\ND_Meerkat_EventRegister
$Capture.managedRuntimeVersion = "v4.0"
$Capture.processModel.identityType = 3
$Capture.processModel.userName = [string]($name)
$Capture.processModel.password = [string]($pass)
$Capture | Set-Item

New-Item IIS:\AppPools\ND_Meerkat_FormCapture
$Capture = Get-Item IIS:\AppPools\ND_Meerkat_FormCapture
$Capture.managedRuntimeVersion = "v4.0"
$Capture.processModel.identityType = 3
$Capture.processModel.userName = [string]($name)
$Capture.processModel.password = [string]($pass)
$Capture | Set-Item

New-Item IIS:\AppPools\ND_Meerkat_FormBuilder
$Capture = Get-Item IIS:\AppPools\ND_Meerkat_FormBuilder
$Capture.managedRuntimeVersion = "v4.0"
$Capture.processModel.identityType = 3
$Capture.processModel.userName = [string]($name)
$Capture.processModel.password = [string]($pass)
$Capture | Set-Item

New-Item IIS:\AppPools\ND_Meerkat_ReportsManager
$Capture = Get-Item IIS:\AppPools\ND_Meerkat_ReportsManager
$Capture.managedRuntimeVersion = "v4.0"
$Capture.processModel.identityType = 3
$Capture.processModel.userName = [string]($name)
$Capture.processModel.password = [string]($pass)
$Capture | Set-Item

New-Item IIS:\AppPools\ND_Meerkat_UAM
$Capture = Get-Item IIS:\AppPools\ND_Meerkat_UAM
$Capture.managedRuntimeVersion = "v4.0"
$Capture.processModel.identityType = 3
$Capture.processModel.userName = [string]($name)
$Capture.processModel.password = [string]($pass)
$Capture | Set-Item


New-Item IIS:\AppPools\ND_Meerkat_MegaMenu
$MegaMenu = Get-Item IIS:\AppPools\ND_Meerkat_MegaMenu
$MegaMenu.managedRuntimeVersion = "v4.0"
$MegaMenu.processModel.identityType = 3
$MegaMenu.processModel.userName = [string]($name)
$MegaMenu.processModel.password = [string]($pass)
$MegaMenu | Set-Item


# New Sites
New-Item IIS:\Sites\ND_Meerkat_Admin -physicalPath C:\inetpub\ND_Meerkat_Admin -bindings @{protocol="http";bindingInformation=":400:"}
Set-ItemProperty IIS:\Sites\ND_Meerkat_Admin -name IIS:\AppPools\ND_MeerkatPool -value Meerkat_Admin

New-Item IIS:\Sites\ND_Meerkat_Capture -physicalPath C:\inetpub\ND_Meerkat_Capture -bindings @{protocol="http";bindingInformation=":430:"}
Set-ItemProperty IIS:\Sites\ND_Meerkat_Capture -name IIS:\AppPools\ND_MeerkatPool -value Meerkat_Capture

New-Item IIS:\Sites\ND_Meerkat_EventRegister -physicalPath C:\inetpub\ND_Meerkat_EventRegister -bindings @{protocol="http";bindingInformation=":440:"}
Set-ItemProperty IIS:\Sites\ND_Meerkat_EventRegister -name IIS:\AppPools\ND_MeerkatPool -value Meerkat_EventRegister

New-Item IIS:\Sites\ND_Meerkat_FormBuilder -physicalPath C:\inetpub\ND_Meerkat_FormBuilder -bindings @{protocol="http";bindingInformation=":410:"}
Set-ItemProperty IIS:\Sites\ND_Meerkat_FormBuilder -name IIS:\AppPools\ND_MeerkatPool -value Meerkat_FormBuilder

New-Item IIS:\Sites\ND_Meerkat_FormCapture -physicalPath C:\inetpub\ND_Meerkat_FormCapture -bindings @{protocol="http";bindingInformation=":420:"}
Set-ItemProperty IIS:\Sites\ND_Meerkat_FormCapture -name IIS:\AppPools\ND_MeerkatPool -value Meerkat_FormCapture

New-Item IIS:\Sites\ND_Meerkat_ReportsManager -physicalPath C:\inetpub\ND_Meerkat_ReportsManager -bindings @{protocol="http";bindingInformation=":450:"}
Set-ItemProperty IIS:\Sites\ND_Meerkat_ReportsManager -name IIS:\AppPools\ND_MeerkatPool -value Meerkat_ReportsManager

New-Item IIS:\Sites\ND_Meerkat_UAM -physicalPath C:\inetpub\ND_Meerkat_UAM -bindings @{protocol="http";bindingInformation=":470:"}
Set-ItemProperty IIS:\Sites\ND_Meerkat_UAM -name IIS:\AppPools\ND_MeerkatPool -value Meerkat_UAM

New-Item IIS:\Sites\ND_Meerkat_MegaMenu -physicalPath C:\inetpub\ND_Meerkat_MegaMenu -bindings @{protocol="http";bindingInformation=":4082:"}
Set-ItemProperty IIS:\Sites\ND_Meerkat_MegaMenu -name IIS:\AppPools\ND_MeerkatPool -value Meerkat_MegaMenu

#Deploy Lightswitch IIS:\AppPools\ND_Meerkats
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

$username.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 144
$System_Drawing_Point.Y = 228
$username.Location = $System_Drawing_Point
$username.Name = "username"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 232
$username.Size = $System_Drawing_Size
$username.TabIndex = 9

$MeerkatForm.Controls.Add($username)


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
$label6.Text = "Svc account:"

$MeerkatForm.Controls.Add($label6)


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
$label1.Text = "Welcome to the Meerkat Installation Wizard. Fill out the details for web services below and click the button to start installing the product."

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