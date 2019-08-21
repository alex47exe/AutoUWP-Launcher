#RequireAdmin
RegWrite('HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock', 'AllowDevelopmentWithoutDevLicense','REG_DWORD',Number('0'))
RegWrite('HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock', 'AllowAllTrustedApps','REG_DWORD',Number('0'))


