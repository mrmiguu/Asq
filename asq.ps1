function awe($file) {
  if (test-path $file) {
    gc $file | scb
  } else {
    scb ''
  }
  [System.Windows.Forms.SendKeys]::SendWait('@"')
  [System.Windows.Forms.SendKeys]::SendWait('~')
  [System.Windows.Forms.SendKeys]::SendWait('^{v}')
}
