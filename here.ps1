Function Here($emptyBodyOrFile, $emptyFileOrBody, $newFile) {
  $PSDefaultParameterValues["*:Encoding"] = "utf8"

  if ($emptyBodyOrFile -eq $null) {
    Set-Clipboard $null
    [System.Windows.Forms.SendKeys]::SendWait("here @'")
  } elseif (Test-Path $emptyBodyOrFile) {
    if ($emptyFileOrBody -eq $null) {
      Get-Content $emptyBodyOrFile | Set-Clipboard
      [System.Windows.Forms.SendKeys]::SendWait("here $emptyBodyOrFile @'")
    } else {
      if ($newFile -eq $null) {
        Write-Output $emptyFileOrBody
        return
      } else {
        $emptyFileOrBody | Out-FileUtf8NoBom $newFile
        return
      }
    }
  } else {
    if ($emptyFileOrBody -eq $null) {
      Write-Output $emptyBodyOrFile
      return
    } else {
      $emptyBodyOrFile | Out-FileUtf8NoBom $emptyFileOrBody
      return
    }
  }

  [System.Windows.Forms.SendKeys]::SendWait("~")
  [System.Windows.Forms.SendKeys]::SendWait("^{v}")
}
