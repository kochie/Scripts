$erroractionpreference='Continue' # quit if anything goes wrong

# get core functions
$core_url = 'https://raw.github.com/lukesampson/scoop/master/lib/core.ps1'
echo 'initializing...'
iex (new-object net.webclient).downloadstring($core_url)

# prep
if(installed 'scoop'){
    Write-Host("Scoop already installed")
}
else{
  (new-object Net.WebClient).DownloadString("https://get.scoop.sh") | iex
}

if(installed 'sudo'){
  Write-Host("sudo already installed")
}
else{
  scoop install sudo
}
#install psget
if (Get-Module -Name 'PsGet'){
  Write-Host("PsGet already Installled")
}
else{
  (new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex
}

#install posh-git
if (Get-Module -Name 'posh-git'){
  Write-Host("Posh-Git already installed")
}
else{
  Install-Module posh-git
}


#copy cofig
Write-Host("Copying Profile")
Copy-Item "./Microsoft.PowerShell_profile.ps1" -Destination ($env:userprofile + "/Documents/WindowsPowerShell") -errorAction $erroractionpreference -errorVariable errors
if ($errors -ne $null){
  foreach($error in $errors)
      {
          if ($error.Exception -ne $null)
          {
              write-host -foregroundColor Red "Exception: $($error.Exception)"
          }
          write-host -foregroundColor Red "Error: An error occured during copy operation."
      }
}
else{
  Write-Host("Copying Success")
}


#run config
Invoke-Expression "./Microsoft.PowerShell_profile.ps1"
