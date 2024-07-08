Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$notification = New-Object System.Windows.Forms.NotifyIcon
$notification.Icon = [System.Drawing.SystemIcons]::Information
$notification.BalloonTipTitle = 'Salesforce CLI'
$notification.BalloonTipText = 'Deployment Finished'
$notification.Visible = $true
$notification.ShowBalloonTip(3000)

# Play a system sound
[System.Media.SystemSounds]::Asterisk.Play()

# Dispose of the notification icon after the balloon tip is shown
$notification.Dispose()
