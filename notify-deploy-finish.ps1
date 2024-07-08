Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$notification = New-Object System.Windows.Forms.NotifyIcon
$notification.Icon = [System.Drawing.SystemIcons]::Information
$notification.BalloonTipTitle = 'Salesforce CLI'
$notification.BalloonTipText = 'Deployment Finished'
$notification.Visible = $true
$notification.ShowBalloonTip(3000)
Start-Sleep -Seconds 5
$notification.Dispose()