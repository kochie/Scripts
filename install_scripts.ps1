#setup sudo command in PowerShell
iex (new-object net.webclient).downloadstring("https://get.scoop.sh")
set-executionpolicy unrestricted -s cu -f
scoop install sudo

#install psget
(new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex

#install posh-gti
Install-Module posh-git

#copy cofig
Copy-Item -Source "./Microsoft.PowerShell_profile.ps1" -Destination $env:userprofile + "/Documents/WindowsPowerShell"
