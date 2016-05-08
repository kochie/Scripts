$env:path += ";C:\Program Files\git\cmd"

[Environment]::SetEnvironmentVariable
  ( "Path", $env:Path, [System.EnvironmentVariableTarget]::Machine )
