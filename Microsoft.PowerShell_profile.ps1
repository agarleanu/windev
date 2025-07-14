$env:PROTO_HOME = Join-Path $HOME ".proto";
$env:PATH = @(
  (Join-Path $env:PROTO_HOME "shims")
  (Join-Path $env:PROTO_HOME "bin")
  "D:\.pnpm"
  "C:\msys64\ucrt64\bin"
  $env:PATH
) -join [IO.PATH]::PathSeparator;

Invoke-Expression (&starship init powershell)
proto activate pwsh | Out-String | Invoke-Expression