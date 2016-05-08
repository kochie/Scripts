
# Load posh-git example profile
#. 'C:\Program Files\WindowsPowerShell\Modules\posh-git\profile.example.ps1'

function Set-Path {
    param([string]$x)
    $Env:Path+= ";" +  $x
    Write-Output $Env:Path
    $write = Read-Host 'Set PATH permanently ? (yes|no)'
    if ($write -eq "yes")
    {
        [Environment]::SetEnvironmentVariable("Path",$env:Path, [System.EnvironmentVariableTarget]::User)
        Write-Output 'PATH updated'
    }

}

Import-Module posh-git
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    Write-Host($pwd.ProviderPath) -nonewline

    Write-VcsStatus

    $global:LASTEXITCODE = $realLASTEXITCODE
    return "> "
}

Pop-Location

Start-SshAgent -Quiet