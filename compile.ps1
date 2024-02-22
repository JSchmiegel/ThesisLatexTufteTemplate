#!/usr/bin/env pwsh
function showNotification($time) {
    Add-Type -AssemblyName System.Windows.Forms 
    $global:balloon = New-Object System.Windows.Forms.NotifyIcon
    $path = (Get-Process -id $pid).Path
    $balloon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path) 
    $balloon.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Info 
    $balloon.BalloonTipText = "Compiled within " + $time + " min."
    $balloon.BalloonTipTitle = "Compile Successfull" 
    $balloon.Visible = $true 
    $balloon.ShowBalloonTip(5000)
}


$stopwatch = New-Object System.Diagnostics.Stopwatch
$stopwatch.Start()
pdflatex -shell-escape thesis
biber thesis
makeindex thesis
pdflatex -shell-escape thesis
pdflatex -shell-escape thesis
$stopwatch.Stop()
$stopwatch.Elapsed

if ($stopwatch.Elapsed.Minutes -lt 10) {
    $minutes = "0"
}
$minutes += $stopwatch.Elapsed.Minutes
if ($stopwatch.Elapsed.Seconds -lt 10){
    $seconds = "0"
}
$seconds += $stopwatch.Elapsed.Seconds
$time = "" + $minutes + ":" + $seconds

$tmp = Get-Date -Format "HH:mm"
Write-Host "Executed at $tmp" 
Write-Host "-----------------"

if ($IsWindows) {
    showNotification($time)
}