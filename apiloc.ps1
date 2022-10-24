Add-Type -AssemblyName system.windows.forms
Add-Type -AssemblyName system.Drawing

function api{
    $inputSite = $guiBox.Text
    $outputSite = Invoke-RestMethod http://ip-api.com/json/$inputSite
    $outputSite = @($outputSite.org,$outputSite.query,$outputSite.country,$outputSite.city,$outputSite.lat,$outputSite.lon)

    $Ecra = Write-Output " Nome:"$outputSite[0]`n "IP:"$outputSite[1]`n "Pais:"$outputSite[2]`n "Cidade:"$outputSite[3]`n "Mapa:"$outputSite[4]","$outputSite[5]
    $guiLabel.Text = $Ecra
}

$gui = New-Object System.Windows.forms.form
$gui.Size = New-Object System.Drawing.Size(350,300)
#$gui.AutoSize = $true
$gui.Text = "Info Sites"
$gui.Font = "Arial,10"
$gui.StartPosition = "CenterScreen"
$gui.AutoSize = $true

$guiBox = New-Object System.Windows.Forms.TextBox
$guiBox.Size = New-Object System.Drawing.Size(180,30)
$guiBox.Location = New-Object System.Drawing.Point(40,20)
$guiBox.Text = "www.google.com"
$guiBox.AutoSize = $true
$gui.Controls.Add($guiBox)

$guiLabel = New-Object System.Windows.Forms.Label
$guiLabel.AutoSize = $true
$guiLabel.Location = New-Object System.Drawing.Point(40,70)
$gui.Controls.Add($guiLabel)

$Button = New-Object System.Windows.Forms.Button
$Button.AutoSize = $true
$Button.Text = "OK"
$Button.Location = New-Object System.Drawing.Point(230,17)
$gui.Controls.Add($Button)

$Button.Add_click{api}

$gui.showdialog() | Out-Null
