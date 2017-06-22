Function Here($file) {
  $PSDefaultParameterValues['*:Encoding'] = "utf8"
  
  if ($file -ne $null -and (test-path $file)) {
    Get-Content $file | Set-Clipboard
  } else {
    Set-Clipboard $file
  }
  
  [System.Windows.Forms.SendKeys]::SendWait("@'")
  [System.Windows.Forms.SendKeys]::SendWait("~")
  [System.Windows.Forms.SendKeys]::SendWait("^{v}")
}
