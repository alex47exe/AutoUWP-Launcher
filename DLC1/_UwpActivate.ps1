
# ---> '.\AppxManifest.xml'
Write-Host "   "
Write-Host -ForegroundColor Cyan "   *** AutoUWP Launcher ... adding UWP dlc ***"
Write-Host "   "
$xmlPath = [String]$pwd +  '\AppxManifest.xml'
$xml = [xml](Get-Content $xmlPath -ErrorAction SilentlyContinue) 
if(Test-Path $xmlPath){
    Write-Host -ForegroundColor Green "   .\AppxManifest.xml found!"
    Write-Host -ForegroundColor Green "      $xmlPath"
    Write-Host "   "
    $AppId = $xml.Package.Applications.Application.ID
    $AppName =  $xml.Package.Identity.Name
    $FamName = get-appxpackage $AppName | Select PackageFamilyName
    $GameName = $xml.Package.Properties.DisplayName
    if(!$FamName){
        Write-Host -ForegroundColor Green "   $AppName --->"
        Write-Host -ForegroundColor Green "      adding $GameName ..."
        Add-AppxPackage -Path $xmlPath -Register
        Write-Host -ForegroundColor Green "         DONE "
        Write-Host "   "
        $FamName = get-appxpackage $AppName | Select PackageFamilyName
        }
    else{
        $FamName = $FamName.PackageFamilyName
        $param = $FamName + '!' + $AppId
        Write-Host -ForegroundColor Green "   $AppName --->"
        Write-Host -ForegroundColor Green "      adding $GameName ..."
        Write-Host -ForegroundColor Red "         DLC IS ALREADY INSTALLED"
        Write-Host "   "
        #Pause
        #Start-Process  explorer.exe shell:AppsFolder\$param
        #Exit
        }
    }
 else{
    Write-Host -ForegroundColor Red '   .\AppxManifest.xml not found!'
    Write-Host -ForegroundColor Red '   Copy UwpActivate.bat, UwpActivate.exe and UwpActivate.ps1 next to .\AppFiles folder!'
    #Pause
    #Exit
    }
# <--- '.\AppxManifest.xml'
