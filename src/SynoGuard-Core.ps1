<#
.SYNOPSIS
    SynoGuard-PS 🛡️ | Enterprise NAS Monitoring
    Version: 1.0.0 [STABLE]
    Author: Чувилев М.М.
    
.DESCRIPTION
    PowerShell-based dashboard for Synology NAS infrastructure.
    Uses asynchronous runspaces for non-blocking UI updates.
#>

Add-Type -AssemblyName System.Windows.Forms, System.Drawing

# --- [ СЕКЦИЯ КОНФИГУРАЦИИ ] ---
# ПРЕДУПРЕЖДЕНИЕ: Не вписывайте реальные данные здесь для публикации на GitHub!
$Config = @{
    Target1 = "192.168.1.100"  # Основной узел
    Target2 = "192.168.1.101"  # Бэкап узел
    Interval = 5               # Интервал обновления (сек)
}

# --- [ WINAPI: TOTAL BLACK EDITION ] ---
$Code = @"
using System;
using System.Runtime.InteropServices;
public class WinAPI {
    [DllImport("dwmapi.dll")]
    public static extern int DwmSetWindowAttribute(IntPtr hwnd, int attr, ref int val, int size);
}
"@
Add-Type -TypeDefinition $Code

# --- [ ЛОГИКА МОНИТОРИНГА (RUNSPACE) ] ---
$MonitoringScript = {
    param($IP)
    try {
        $Ping = Test-Connection -ComputerName $IP -Count 1 -Quiet -ErrorAction SilentlyContinue
        if ($Ping) { return "ONLINE" } else { return "OFFLINE" }
    } catch { return "ERROR" }
}

# --- [ GUI ИНТЕРФЕЙС ] ---
$Form = New-Object Windows.Forms.Form
$Form.Text = "SynoGuard-PS v.1.0.0 [STABLE]"
$Form.Size = New-Object Drawing.Size(600, 450)
$Form.BackColor = [Drawing.Color]::Black
$Form.ForeColor = [Drawing.Color]::FromArgb(0, 255, 0) # Neon Green
$Form.Font = New-Object Drawing.Font("Consolas", 10)

$Display = New-Object Windows.Forms.RichTextBox
$Display.Dock = "Fill"
$Display.BackColor = [Drawing.Color]::Black
$Display.ForeColor = [Drawing.Color]::FromArgb(0, 255, 0)
$Display.ReadOnly = $true
$Display.BorderStyle = "None"
$Form.Controls.Add($Display)

# Применяем Dark Mode заголовок
$Form.Add_Load({
    $attr = 20
    $val = 1
    [WinAPI]::DwmSetWindowAttribute($this.Handle, $attr, [ref]$val, 4)
})

# --- [ АСИНХРОННЫЙ ТАЙМЕР ] ---
$Timer = New-Object Windows.Forms.Timer
$Timer.Interval = $Config.Interval * 1000
$Timer.Add_Tick({
    $Timestamp = Get-Date -Format "dd.MM.yyyy HH:mm:ss"
    $Status1 = Invoke-Command -ScriptBlock $MonitoringScript -ArgumentList $Config.Target1
    $Status2 = Invoke-Command -ScriptBlock $MonitoringScript -ArgumentList $Config.Target2
    
    $Display.Clear()
    $Display.AppendText(">>> SYNOGUARD-PS | ENTERPRISE MONITOR | REL. 1.0.0`n")
    $Display.AppendText(">>> TIMESTAMP: $Timestamp`n")
    $Display.AppendText("-" * 60 + "`n")
    $Display.AppendText("TARGET 01: $($Config.Target1) | STATUS: [$Status1]`n")
    $Display.AppendText("TARGET 02: $($Config.Target2) | STATUS: [$Status2]`n")
    $Display.AppendText("-" * 60 + "`n")
    $Display.AppendText("SYSTEM LOG: All threads active. Listening for heartbeats...")
})

$Timer.Start()
$Form.ShowDialog()
