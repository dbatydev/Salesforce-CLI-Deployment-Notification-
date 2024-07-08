Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create a custom form for the notification
$form = New-Object Windows.Forms.Form
$form.Text = "Salesforce CLI"
$form.Size = New-Object Drawing.Size(300, 150)
$form.StartPosition = "CenterScreen"

# Add a label to the form
$label = New-Object Windows.Forms.Label
$label.Text = "Deployment Finished"
$label.Dock = "Fill"
$label.TextAlign = "MiddleCenter"
$form.Controls.Add($label)

# Add an OK button to the form
$button = New-Object Windows.Forms.Button
$button.Text = "OK"
$button.Dock = "Bottom"
$button.Add_Click({ $form.Close() })
$form.Controls.Add($button)

# Show the form
$form.Topmost = $true
$form.Add_Shown({ $form.Activate() })
$form.ShowDialog()

# Play a system sound
[System.Media.SystemSounds]::Asterisk.Play()
