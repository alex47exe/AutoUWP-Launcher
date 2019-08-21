### AutoUWP Launcher v1.0.5

Universal *installer, launcher & uninstaller for UWP games* - will automatically install UWP games & DLC on first launch. Rename it to *Game Name_autoUWP.exe* and place it in game folder like this, making sure DLC folders are accessible next to launcher, not above one or more folder levels:

​ **D:\Games\Game Name** 
- folder where *Game Name_autoUWP.exe* should be placed

​                 **.\Game Name** 
- folder where main *AppxManifest.xml* is located (`appfiles_path =` ) ... **or**

​                 **.\Game Name\AppFiles**
- folder where main *AppxManifest.xml* is located (`appfiles_path = AppFiles`) ... **or**

​                 **.\Game Name\Folder Name**
- folder where main *AppxManifest.xml* is located (`appfiles_path = Folder Name`)

​                 **.\Game Name\DLC1 Name**
- folder where *AppxManifest.xml* for *DLC1 Name* is located
* if no *AppxManifest.xml* is found in *DLC1 Name*, subfolders will be searched

------

Same as **[UniGame Launcher](https://github.com/alex47exe/UniGame-Launcher/releases)**, *AutoUWP* will run as admin at first launch, and also in the following scenarios: 
- *C:\Program Data\SalFisher47\AutoUWP Launcher\Game Name_autoUWP.exe* is deleted
- *Game Name_autoUWP.exe* is deleted
- Whenever you change `developer_features` in *ini* file, so it can force desired option in  *Settings -> For developers -> Use developer features* 

------