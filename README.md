# Salesforce CLI Deployment Notification Windows 11

This project includes a setup for displaying a notification on Windows after a Salesforce CLI deployment finishes.

## Setup Instructions

### 1. Configure the Hook

Create a file named `.sfdx/hooks.json` in the root of your project directory with the following content:

```json
{
  "after:source:deploy": "./notify-deploy-finish.bat"
}
```
### 2.  Create the Notification Scripts

#### Batch Script
Create a batch script named `notify-deploy-finish.bat` in the root of your project directory with the following content:

```
@echo off
powershell -ExecutionPolicy Bypass -File notify-deploy-finish.ps1
```

#### PowerShell Script

Create a PowerShell script named `notify-deploy-finish.ps1` in the root of your project directory with the following content:

```
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
```
### 3.  Directory Structure

```
your-project/
│
├── .sfdx/
│   └── hooks.json
│
├── notify-deploy-finish.bat
└── notify-deploy-finish.ps1
```

### 4.  Deploy

```
sfdx project deploy start --source-dir .\force-app\main\default\classes\LocationSiteSyncTriggersTest.cls
```