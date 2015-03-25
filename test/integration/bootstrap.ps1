Function Get-ChefMetadata($url) {
  Try { $response = ($c = Make-WebClient).DownloadString($url) }
  Finally { if ($c -ne $null) { $c.Dispose() } }

  $md = ConvertFrom-StringData $response.Replace("`t", "=")
  return @($md.url, $md.md5)
}

Function Get-MD5Sum($src) {
  Try {
    $c = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
    $bytes = $c.ComputeHash(($in = (Get-Item $src).OpenRead()))
    return ([System.BitConverter]::ToString($bytes)).Replace("-", "").ToLower()
  } Finally { if (($c -ne $null) -and ($c.GetType().GetMethod("Dispose") -ne $null)) { $c.Dispose() }; if ($in -ne $null) { $in.Dispose() } }
}

Function Download-Chef($md_url, $dst) {
  $url, $md5 = Get-ChefMetadata $md_url

  Try {
    Log "Downloading package from $url"
    ($c = Make-WebClient).DownloadFile($url, $dst)
    Log "Download complete."
  } Finally { if ($c -ne $null) { $c.Dispose() } }

  if (($dmd5 = Get-MD5Sum $dst) -eq $md5) { Log "Successfully verified $dst" }
  else { throw "MD5 for $dst $dmd5 does not match $md5" }
}

Function Install-Chef($msi) {
  Log "Installing ChefDK package $msi"
  $p = Start-Process -FilePath "msiexec.exe" -ArgumentList "/qn /i $msi" -Passthru -Wait

  if ($p.ExitCode -ne 0) { throw "msiexec was not successful. Received exit code $($p.ExitCode)" }

  Remove-Item $msi -Force
  Log "Installation complete"
}

Function Install-Git {
  iex ((Make-WebClient).DownloadString("https://chocolatey.org/install.ps1"))
  choco install git
}

Function Log($m) { Write-Host "       $m`n" }

Function Banner ($m) { Write-Host "-----> $m`n" }

Function Make-WebClient {
  $proxy = New-Object -TypeName System.Net.WebProxy
  $proxy.Address = $env:http_proxy
  $client = New-Object -TypeName System.Net.WebClient
  $client.Proxy = $proxy
  return $client
}

Function Unresolve-Path($p) {
  if ($p -eq $null) { return $null }
  else { return $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($p) }
}

$chef_metadata_url = "http://www.chef.io/chef/metadata-chefdk?p=windows&m=x86_64&pv=2008r2&v=latest"
$chefdk_root = Unresolve-Path "$env:systemdrive\opscode\chefdk"
$msi = Unresolve-Path "$env:TEMP\chefdk-latest.msi"
$git_path = (Get-Item "ENV:ProgramFiles(x86)").Value + "\Git\bin"

if (-Not (Test-Path "$env:ALLUSERSPROFILE\chocolatey")) { Install-Git }

if (-Not (($env:PATH).split(";") -contains "$git_path")) { $env:PATH += ";" + "$git_path" }

if (-Not (Test-Path $chefdk_root)) {
  Banner "Installing ChefDK"
  Download-Chef "$chef_metadata_url" $msi
  Install-Chef $msi
} else {
  Banner "ChefDK installation detected"
}

Banner "Running ChefDK app update"
& "$env:TEMP\kitchen\data\chefdk-update-app.bat" test-kitchen -r v1.4.0.beta.1

exit $LASTEXITCODE
