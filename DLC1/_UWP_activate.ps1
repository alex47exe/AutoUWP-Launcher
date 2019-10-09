
# ---> '.\AppxManifest.xml'
Write-Host "   "
Write-Host -ForegroundColor Cyan "   *** AutoUWP Launcher ... installing UWP dlc ***"
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
    if(!$FamName){
        Write-Host -ForegroundColor Green "   installing dlc ---> "
        Write-Host -ForegroundColor Green "      $GameName ($AppName) ... "
        Add-AppxPackage -Path $xmlPath -Register
        Write-Host -ForegroundColor Green "         $GameName IS INSTALLED"
        Write-Host "   "
        #Pause
        #Exit
        }
    else{
        $FamName = $FamName.PackageFamilyName
        $param = $FamName + '!' + $AppId
        Write-Host -ForegroundColor Green "   installing dlc ---> "
        Write-Host -ForegroundColor Green "      $GameName ($AppName) ... "
        Write-Host -ForegroundColor Green "         $GameName IS INSTALLED"
        Write-Host "   "
        #Pause
        #Exit
        }
    }
 else{
    Write-Host -ForegroundColor Red '   .\AppxManifest.xml not found!'
    Write-Host -ForegroundColor Red '   Make sure autoUWP launcher is next to .\AppFiles folder!'
    #Pause
    #Exit
    }
# <--- '.\AppxManifest.xml'
