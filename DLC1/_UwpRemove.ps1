
# ---> '.\AppxManifest.xml'
Write-Host "   "
Write-Host -ForegroundColor Cyan "   *** AutoUWP Launcher ... removing UWP dlc ***"
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
    $FullName = get-appxpackage $AppName | Select PackageFullName
    $GameName = $xml.Package.Properties.DisplayName
    if($FamName){
        Write-Host -ForegroundColor Green "   $AppName --->"
        Write-Host -ForegroundColor Green "      removing $GameName ..."
        Get-AppxPackage $AppName | Remove-AppxPackage
        Write-Host -ForegroundColor Green "         DONE"
        Write-Host "   "
        }
    else{
        $FamName = $FamName.PackageFamilyName
        $param = $FamName + '!' + $AppId
        Write-Host -ForegroundColor Green "   $AppName --->"
        Write-Host -ForegroundColor Green "      removing $GameName ..."
        Write-Host -ForegroundColor Red "         DLC IS NOT INSTALLED"
        Write-Host "   "
        #Pause
        #Start-Process  explorer.exe shell:AppsFolder\$param
        #Exit
        }
    }
 else{
    Write-Host -ForegroundColor Red '   .\AppxManifest.xml not found!'
    Write-Host -ForegroundColor Red '   Copy UwpRemove.bat, UwpRemove.exe and UwpRemove.ps1 next to .\AppFiles folder!'
    #Pause
    #Exit
    }
# <--- '.\AppxManifest.xml'
