Write-Host "PC Optimization for Windows `nIMPORTANT - PC - Recommended plug in the main power`n`nMenu: `n1-> Verify the state of Hard Drive, repair automatic (CheckDisk) `n2-> Repair protect files on Windows (Sfc) `n3-> Repair corrupted files or missing files, from Windows Online (DISM) `n`nR-> Reboot PC `n`nEXIT... --> Q ou q + Enter"

    do {$x = Read-Host "Select a number + Enter"
        switch ($x) {
        1 {Start-Process powershell -Verb runas 'Chkdsk /R' | pause
        continue}
        2 {Start-Process powershell -Verb runas 'sfc /scannow ; pause' | pause
        continue}
        3 {Start-Process powershell -Verb runas 'Dism /Online /Cleanup-image /Restorehealth ; pause' | pause
        continue}
        R {shutdown /r /t 0}
        }
  } until($x -eq 'q')
Write-Host "EXIT..."
