function Get-MetaData($path)
{

  $shell = New-Object -COMObject Shell.Application
  $folder = (Resolve-Path (Split-Path $path)).path
  $file = Split-Path $path -Leaf
  $shellfolder = $shell.Namespace($folder)
  $shellfile = $shellfolder.ParseName($file)

  Write-Host($folder)

  0..287 | Foreach-Object {
    Write-Host('{0} = {1}' -f $_, $shellfolder.GetDetailsOf($null, $_))
    if ($shellfolder.GetDetailsOf($null, $_) -eq "Album Artist"){
      Write-Host("########################################")
    }
  }
}
