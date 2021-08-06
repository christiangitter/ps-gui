Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
#####################START BUILD THE GUI##############################
######################################################################
#Settings for the Window
$psGui = New-Object system.Windows.Forms.Form
$psGui.ClientSize = New-Object System.Drawing.Point(305, 400)
$psGui.text = "psGui"
$psGui.TopMost = $false
$psGui.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#eaeaea")
#Settings for the Button ButtonMsgBx
$ButtonMsgBx = New-Object system.Windows.Forms.Button
$ButtonMsgBx.text = "show MessageBox"
$ButtonMsgBx.width = 262
$ButtonMsgBx.height = 63
$ButtonMsgBx.location = New-Object System.Drawing.Point(19, 21)
$ButtonMsgBx.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 15, [System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$ButtonMsgBx.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
#Settings for the Button ButtonLblTxt
$ButtonLblTxt = New-Object system.Windows.Forms.Button
$ButtonLblTxt.text = "Set Label Text"
$ButtonLblTxt.width = 260
$ButtonLblTxt.height = 66
$ButtonLblTxt.location = New-Object System.Drawing.Point(20, 99)
$ButtonLblTxt.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 15, [System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$ButtonLblTxt.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
#Settings for the Button ButtonPthDlg
$ButtonPthDlg = New-Object system.Windows.Forms.Button
$ButtonPthDlg.text = "show PathDialog"
$ButtonPthDlg.width = 260
$ButtonPthDlg.height = 68
$ButtonPthDlg.location = New-Object System.Drawing.Point(20, 181)
$ButtonPthDlg.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 15, [System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$ButtonPthDlg.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
#Settings for the Label
$LabelTxt = New-Object system.Windows.Forms.Label
$LabelTxt.AutoSize = $true
$LabelTxt.width = 50
$LabelTxt.height = 10
$LabelTxt.location = New-Object System.Drawing.Point(28, 292)
$LabelTxt.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 12)
#set all the components visible
$psGui.controls.AddRange(@($ButtonMsgBx, $ButtonLblTxt, $ButtonPthDlg, $LabelTxt))
#####################END BUILD THE GUI################################
######################################################################
function showMsgBox() {
    [System.Windows.Forms.MessageBox]::Show("Pretty nice Text","MY MESSAGEBOX",0)
}
function setLblText(){
    $LabelTxt.Text += "I LOVE MY LABEL" + "`n"
}
function showPath(){
    $OrdnerWahl = New-Object System.Windows.Forms.FolderBrowserDialog        
    $OrdnerWahl.ShowNewFolderButton = $false  
	$OrdnerWahl.ShowDialog() 
    if ($OrdnerWahl.SelectedPath -ne "")            
    {
        $ordnerpfad = $OrdnerWahl.SelectedPath
		$LabelTxt.Text += "Pfad: " + $ordnerpfad + "`n"
    }
}

$ButtonMsgBx.Add_Click({showMsgBox})
$ButtonLblTxt.Add_Click({setLblText})
$ButtonPthDlg.Add_Click({showPath})

#prompt all the components
[void]$psGui.ShowDialog()
