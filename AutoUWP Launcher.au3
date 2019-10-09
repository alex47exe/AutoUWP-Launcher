#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=icon.ico
#AutoIt3Wrapper_Outfile=AutoUWP Launcher.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_UPX_Parameters=-9 --strip-relocs=0 --compress-exports=0 --compress-icons=0
#AutoIt3Wrapper_Res_Description=AutoUWP Launcher
#AutoIt3Wrapper_Res_Fileversion=1.1.0.47
#AutoIt3Wrapper_Res_ProductVersion=1.1.0.47
#AutoIt3Wrapper_Res_LegalCopyright=2018-2019, SalFisher47
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#NoTrayIcon
;#RequireAdmin

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=icon.ico
#AutoIt3Wrapper_Outfile=AutoUWP Launcher.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_UPX_Parameters=-9 --strip-relocs=0 --compress-exports=0 --compress-icons=0
#AutoIt3Wrapper_Res_Description=AutoUWP Launcher
#AutoIt3Wrapper_Res_Fileversion=1.1.0.47
#AutoIt3Wrapper_Res_ProductVersion=1.1.0.47
#AutoIt3Wrapper_Res_LegalCopyright=2018-2019, SalFisher47
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#AutoIt3Wrapper_Res_SaveSource=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#Region ;**** Pragma Compile ****
#pragma compile(AutoItExecuteAllowed, true)
#pragma compile(Compression, 9)
#pragma compile(Compatibility, vista, win7, win8, win81)
#pragma compile(InputBoxRes, true)
#pragma compile(CompanyName, 'SalFisher47')
#pragma compile(FileDescription, 'AutoUWP Launcher')
#pragma compile(FileVersion, 1.1.0.47)
#pragma compile(InternalName, 'AutoUWP Launcher')
#pragma compile(LegalCopyright, '2018-2019, SalFisher47')
#pragma compile(OriginalFilename, AutoUWP Launcher.exe)
#pragma compile(ProductName, 'AutoUWP Launcher')
#pragma compile(ProductVersion, 1.1.0.47)
#EndRegion ;**** Pragma Compile ****

; === AutoUWP Launcher.au3 ========================================================================================================
; Title .........: AutoUWP Launcher
; Version .......: 1.1.0.47
; AutoIt Version : 3.3.14.2
; Language ......: English
; Description ...: AutoUWP Launcher
; Author(s) .....: SalFisher47
; Last Modified .: August 21, 2019 - last compiled on August 21, 2019
; ==================================================================================================================================

#include <File.au3>
#include <Array.au3>

Global $Env_RoamingAppData = @AppDataDir, _
		$Env_LocalAppData = @LocalAppDataDir, _
		$Env_ProgramData = @AppDataCommonDir, _
		$Env_UserProfile = @UserProfileDir, _
		$Env_SavedGames = RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders", "{4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}")
		If @error Then $Env_SavedGames = $Env_UserProfile & "\Saved Games"
$launcherIni = @ScriptDir & "\" & StringTrimRight(@ScriptName, 4) & ".ini"
$Ini_AppFiles_Name = IniRead($launcherIni, "Launcher", "appfiles_path", "")
$Ini_Developer_Features = IniRead($launcherIni, "Launcher", "developer_features", "3")
$New_Developer_Features = ""
$dev_feat_1 = RegRead('HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock', 'AllowDevelopmentWithoutDevLicense')
If @error Then $dev_feat_1 = 0
$dev_feat_2 = RegRead('HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock', 'AllowAllTrustedApps')
If @error Then $dev_feat_2 = 0
$Reg_Developer_Features = ""
Switch $dev_feat_1
	Case 0
		If $dev_feat_2 == 0 Then
			$Reg_Developer_Features = "microsoft_store_apps.exe"
		EndIf
	Case 1
		If $dev_feat_2 == 0 Then
			$Reg_Developer_Features = "sideload_apps.exe"
		Else
			$Reg_Developer_Features = "developer_mode.exe"
		EndIf
EndSwitch
Switch $Ini_Developer_Features
	Case 1
		$New_Developer_Features = "microsoft_store_apps.exe"
	Case 2
		$New_Developer_Features = "sideload_apps.exe"
	Case 3
		$New_Developer_Features = "developer_mode.exe"
EndSwitch

If Not FileExists(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher") Then DirCreate(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher")
If Not FileExists(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & StringTrimRight(@ScriptName, 4) & ".ini") Then
	FileInstall("ProgramData.ini", @AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & StringTrimRight(@ScriptName, 4) & ".ini", 0)
EndIf

If Not FileExists(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features") Then DirCreate(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features")
If Not FileExists(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features\developer_mode.exe") Then
	FileInstall("Use developer features\developer_mode.exe", @AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features\developer_mode.exe", 1)
	FileInstall("Use developer features\developer_mode.reg", @AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features\developer_mode.reg", 1)
EndIf
If Not FileExists(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features\sideload_apps.exe") Then
	FileInstall("Use developer features\sideload_apps.exe", @AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features\sideload_apps.exe", 1)
	FileInstall("Use developer features\sideload_apps.reg", @AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features\sideload_apps.reg", 1)
EndIf
If Not FileExists(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features\microsoft_store_apps.exe") Then
	FileInstall("Use developer features\microsoft_store_apps.exe", @AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features\microsoft_store_apps.exe", 1)
	FileInstall("Use developer features\microsoft_store_apps.reg", @AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features\microsoft_store_apps.reg", 1)
EndIf

If IsAdmin() Then
	If $New_Developer_Features <> $Reg_Developer_Features Then
		ShellExecuteWait($New_Developer_Features, "", @AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features")
	EndIf
	If IniRead(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & StringTrimRight(@ScriptName, 4) & ".ini", "launcher", "appfiles_path", "") <> @ScriptDir & "\" & $Ini_AppFiles_Name  Then
		IniWrite(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & StringTrimRight(@ScriptName, 4) & ".ini", "launcher", "appfiles_path", " " & @ScriptDir & "\" & $Ini_AppFiles_Name)
		If Not FileExists(StringTrimRight($launcherIni, 4) & ".txt") Then
			FileInstall("AutoUWP Launcher.txt", StringTrimRight($launcherIni, 4) & ".txt", 1)
			;_RunAdmin()
			;Exit
		EndIf
		;_RunAdmin()
		;Exit
	Else
		If Not FileExists(StringTrimRight($launcherIni, 4) & ".txt") Then
			FileInstall("AutoUWP Launcher.txt", StringTrimRight($launcherIni, 4) & ".txt", 1)
			;_RunAdmin()
			;Exit
		EndIf
	EndIf
Else
	If $New_Developer_Features <> $Reg_Developer_Features Then
		If Not FileExists(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & $New_Developer_Features) Then
			FileCopy(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features\" & $New_Developer_Features, @AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & $New_Developer_Features, 1)
			FileCopy(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features\" & StringTrimRight($New_Developer_Features, 3) & "reg", @AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & StringTrimRight($New_Developer_Features, 3) & "reg", 1)
			_RunAdmin()
			Exit
		Else
			If IniRead(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & StringTrimRight(@ScriptName, 4) & ".ini", "launcher", "appfiles_path", "") <> @ScriptDir & "\" & $Ini_AppFiles_Name  Then
				IniWrite(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & StringTrimRight(@ScriptName, 4) & ".ini", "launcher", "appfiles_path", " " & @ScriptDir & "\" & $Ini_AppFiles_Name)
				FileInstall("AutoUWP Launcher.txt", StringTrimRight($launcherIni, 4) & ".txt", 1)
				FileCopy(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features\" & $New_Developer_Features, @AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & $New_Developer_Features, 1)
				FileCopy(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features\" & StringTrimRight($New_Developer_Features, 3) & "reg", @AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & StringTrimRight($New_Developer_Features, 3) & "reg", 1)
				_RunAdmin()
				Exit
			Else
				If Not FileExists(StringTrimRight($launcherIni, 4) & ".txt") Then
					FileInstall("AutoUWP Launcher.txt", StringTrimRight($launcherIni, 4) & ".txt", 1)
					FileCopy(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features\" & $New_Developer_Features, @AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & $New_Developer_Features, 1)
					FileCopy(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features\" & StringTrimRight($New_Developer_Features, 3) & "reg", @AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & StringTrimRight($New_Developer_Features, 3) & "reg", 1)
					_RunAdmin()
					Exit
				EndIf
			EndIf
		EndIf
	Else
		If IniRead(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & StringTrimRight(@ScriptName, 4) & ".ini", "launcher", "appfiles_path", "") <> @ScriptDir & "\" & $Ini_AppFiles_Name  Then
			IniWrite(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & StringTrimRight(@ScriptName, 4) & ".ini", "launcher", "appfiles_path", " " & @ScriptDir & "\" & $Ini_AppFiles_Name)
			FileInstall("AutoUWP Launcher.txt", StringTrimRight($launcherIni, 4) & ".txt", 1)
			FileCopy(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features\" & $New_Developer_Features, @AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & $New_Developer_Features, 1)
			FileCopy(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features\" & StringTrimRight($New_Developer_Features, 3) & "reg", @AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & StringTrimRight($New_Developer_Features, 3) & "reg", 1)
			_RunAdmin()
			Exit
		Else
			If Not FileExists(StringTrimRight($launcherIni, 4) & ".txt") Then
				FileInstall("AutoUWP Launcher.txt", StringTrimRight($launcherIni, 4) & ".txt", 1)
				FileCopy(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features\" & $New_Developer_Features, @AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & $New_Developer_Features, 1)
				FileCopy(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\Use developer features\" & StringTrimRight($New_Developer_Features, 3) & "reg", @AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & StringTrimRight($New_Developer_Features, 3) & "reg", 1)
				_RunAdmin()
				Exit
			EndIf
		EndIf
	EndIf
EndIf

FileDelete(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & $New_Developer_Features)
FileDelete(@AppDataCommonDir & "\SalFisher47\AutoUWP Launcher\" & StringTrimRight($New_Developer_Features, 3) & "reg")

Local $xml99[1]
$xml99 = _FileListToArrayrec(@ScriptDir, "AppxManifest.xml", 1, -1, 1, 1)
$hFile = FileOpen(StringTrimRight($launcherIni, 4) & ".txt", 0)
For $i=1 to $xml99[0]
	If FileReadLine($hFile, $i) <> $xml99[$i] Then
		FileDelete(StringTrimRight($launcherIni, 4) & ".txt")
		ExitLoop
	EndIf
Next
FileClose($hFile)
;$main_xml_found = 0
;$dlc_xml_found = 0
$Ini_AppFiles_Name_slash1 = ""
$Ini_AppFiles_Name_slash2 = ""
If $Ini_AppFiles_Name <> "" Then
	$Ini_AppFiles_Name_slash1 = "\" & $Ini_AppFiles_Name
	$Ini_AppFiles_Name_slash2 = $Ini_AppFiles_Name & "\"
EndIf

If Not FileExists(StringTrimRight($launcherIni, 4) & ".txt") Then
	$hFile = FileOpen(StringTrimRight($launcherIni, 4) & ".txt", 1)
	For $i=1 to $xml99[0]
		FileWriteLine($hFile, $xml99[$i])
		If $xml99[$i] == $Ini_AppFiles_Name_slash2 & "AppxManifest.xml" Then
		;If StringInStr($xml99[$i], $Ini_AppFiles_Name & "\AppxManifest.xml") Then ; --- old method of checking for main 'AppxManifest.xml'
			FileInstall("AppFiles\_UWP_launch.bat", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_launch.bat", 1)
			FileInstall("AppFiles\_UWP_launch.exe", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_launch.exe", 1)
			FileInstall("AppFiles\_UWP_launch.ps1", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_launch.ps1", 1)
			FileCopy(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_launch.ps1", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_launch1.ps1", 1)
			FileCopy(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_launch.bat", @ScriptDir & "\UWP_launch.bat", 1)
			FileCopy(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_launch.exe", @ScriptDir & "\UWP_launch.exe", 1)
			_ReplaceStringInFile(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_launch1.ps1", "AppxManifest.xml", $xml99[$i])
			_ReplaceStringInFile(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_launch1.ps1", "AppFiles", $Ini_AppFiles_Name)
			FileInstall("AppFiles\_UWP_activate.bat", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate.bat", 1)
			FileInstall("AppFiles\_UWP_activate.exe", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate.exe", 1)
			FileInstall("AppFiles\_UWP_activate.ps1", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate.ps1", 1)
			FileCopy(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate.ps1", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate1.ps1", 1)
			FileCopy(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate.bat", @ScriptDir & "\UWP_activate.bat", 1)
			FileCopy(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate.exe", @ScriptDir & "\UWP_activate.exe", 1)
			_ReplaceStringInFile(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate1.ps1", "AppxManifest.xml", $xml99[$i])
			_ReplaceStringInFile(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate1.ps1", "AppFiles", $Ini_AppFiles_Name)
			FileInstall("AppFiles\_UWP_remove.bat", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove.bat", 1)
			FileInstall("AppFiles\_UWP_remove.exe", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove.exe", 1)
			FileInstall("AppFiles\_UWP_remove.ps1", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove.ps1", 1)
			FileCopy(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove.ps1", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove1.ps1", 1)
			FileCopy(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove.bat", @ScriptDir & "\UWP_remove.bat", 1)
			FileCopy(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove.exe", @ScriptDir & "\UWP_remove.exe", 1)
			_ReplaceStringInFile(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove1.ps1", "AppxManifest.xml", $xml99[$i])
			_ReplaceStringInFile(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove1.ps1", "AppFiles", $Ini_AppFiles_Name)
			;$main_xml_found = 1
		Else
			FileInstall("DLC1\_UWP_activate.bat", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate.bat", 1)
			FileInstall("DLC1\_UWP_activate.exe", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate.exe", 1)
			FileInstall("DLC1\_UWP_activate.ps1", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate.ps1", 1)
			FileCopy(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate.ps1", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate1.ps1", 1)
			_ReplaceStringInFile(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate1.ps1", "AppxManifest.xml", $xml99[$i])
			_ReplaceStringInFile(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate1.ps1", "AppFiles", $Ini_AppFiles_Name)
			FileInstall("DLC1\_UWP_remove.bat", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove.bat", 1)
			FileInstall("DLC1\_UWP_remove.exe", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove.exe", 1)
			FileInstall("DLC1\_UWP_remove.ps1", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove.ps1", 1)
			FileCopy(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove.ps1", @ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove1.ps1", 1)
			_ReplaceStringInFile(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove1.ps1", "AppxManifest.xml", $xml99[$i])
			_ReplaceStringInFile(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove1.ps1", "AppFiles", $Ini_AppFiles_Name)
			;$dlc_xml_found = 1
		EndIf
	Next
	;---
	FileWriteLine($hFile, " ")
	FileWriteLine($hFile, "Generated by AutoUWP Launcher v1.1.0 (c) 2018-2019, SalFisher47")
	FileClose($hFile)
	;---
	FileCopy(@ScriptDir & $Ini_AppFiles_Name_slash1 & "\_UWP_activate1.ps1", @ScriptDir & "\UWP_activate.ps1", 1)
	FileDelete(@ScriptDir & $Ini_AppFiles_Name_slash1 & "\_UWP_activate.exe")
	FileDelete(@ScriptDir & $Ini_AppFiles_Name_slash1 & "\_UWP_activate.bat")
	FileDelete(@ScriptDir & $Ini_AppFiles_Name_slash1 & "\_UWP_activate.ps1")
	FileDelete(@ScriptDir & $Ini_AppFiles_Name_slash1 & "\_UWP_activate1.ps1")
	;---
	FileCopy(@ScriptDir & $Ini_AppFiles_Name_slash1 & "\_UWP_remove1.ps1", @ScriptDir & "\UWP_remove.ps1", 1)
	FileDelete(@ScriptDir & $Ini_AppFiles_Name_slash1 & "\_UWP_remove.exe")
	FileDelete(@ScriptDir & $Ini_AppFiles_Name_slash1 & "\_UWP_remove.bat")
	FileDelete(@ScriptDir & $Ini_AppFiles_Name_slash1 & "\_UWP_remove.ps1")
	FileDelete(@ScriptDir & $Ini_AppFiles_Name_slash1 & "\_UWP_remove1.ps1")
	;---
	FileCopy(@ScriptDir & $Ini_AppFiles_Name_slash1 & "\_UWP_launch1.ps1", @ScriptDir & "\UWP_launch.ps1", 1)
	FileDelete(@ScriptDir & $Ini_AppFiles_Name_slash1 & "\_UWP_launch.exe")
	FileDelete(@ScriptDir & $Ini_AppFiles_Name_slash1 & "\_UWP_launch.bat")
	FileDelete(@ScriptDir & $Ini_AppFiles_Name_slash1 & "\_UWP_launch.ps1")
	FileDelete(@ScriptDir & $Ini_AppFiles_Name_slash1 & "\_UWP_launch1.ps1")
	;---
	For $i=1 to $xml99[0]
		If $xml99[$i] <> $Ini_AppFiles_Name_slash2 & "AppxManifest.xml" Then
		;If Not StringInStr($xml99[$i], $Ini_AppFiles_Name & "\AppxManifest.xml") Then ; --- old method of checking for main 'AppxManifest.xml'
			FileCopy(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate1.ps1", @ScriptDir & "\_UWP_activate1.ps1", 1)
			FileDelete(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate1.ps1")
			FileDelete(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate.bat")
			FileDelete(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate.exe")
			FileDelete(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_activate.ps1")
			_Appendfile(@ScriptDir & "\_UWP_activate1.ps1", @ScriptDir & "\UWP_activate.ps1")
			FileDelete(@ScriptDir & "\_UWP_activate1.ps1")
			FileCopy(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove1.ps1", @ScriptDir & "\_UWP_remove1.ps1", 1)
			FileDelete(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove1.ps1")
			FileDelete(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove.bat")
			FileDelete(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove.exe")
			FileDelete(@ScriptDir & "\" & StringTrimRight($xml99[$i], 16) & "_UWP_remove.ps1")
			_Appendfile(@ScriptDir & "\_UWP_remove1.ps1", @ScriptDir & "\UWP_remove.ps1")
			FileDelete(@ScriptDir & "\_UWP_remove1.ps1")
		EndIf
	Next
	;---
	ShellExecuteWait(@ScriptDir & "\UWP_launch.bat", "", @ScriptDir)
Else
	ShellExecuteWait(@ScriptDir & "\UWP_launch.exe", "", @ScriptDir)
EndIf

Func _AppendFile($Source, $Target)
    FileWriteLine($Target, FileRead($Source, FileGetSize($Source)))
EndFunc

Func _RunAdmin() ; run main script as admin on first launch
	If RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers", @ScriptDir & "\" & StringTrimRight(@ScriptName, 4) & ".exe") <> "RUNASADMIN" Then
		RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers", @ScriptDir & "\" & StringTrimRight(@ScriptName, 4) & ".exe", "REG_SZ", "RUNASADMIN")
	EndIf
	;---
	ShellExecute(StringTrimRight(@ScriptName, 4) & ".exe", $CmdLineRaw, @ScriptDir)
	;---
	If RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers", @ScriptDir & "\" & StringTrimRight(@ScriptName, 4) & ".exe") == "RUNASADMIN" Then
		RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers", @ScriptDir & "\" & StringTrimRight(@ScriptName, 4) & ".exe", "REG_SZ", "")
	EndIf
EndFunc
