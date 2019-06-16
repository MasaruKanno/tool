Set objFSO = WScript.CreateObject("Scripting.FileSystemObject")
Const ForReading = 1, ForWriting = 2, ForAppending = 8

dim arg1, arg2
'書き込みファイルパス先
arg1 = WScript.Arguments(0)
'読み込みファイルパス先
arg2 = WScript.Arguments(1)

'書き込みファイルをオープン
Set objOutput = objFSO.OpenTextFile(arg1, ForAppending, True)
'読み取りファイルをオープン
Set objInput = objFSO.OpenTextFile(arg2, ForReading)

' 読み取りファイルをループ
Do Until objInput.AtEndOfStream
	' レコード取得
	strLine = objInput.ReadLine
	
	' 1行目以外は書き込みファイルへ追記
	If StrComp(objInput.line-1, 1 ) <> 0 Then
		' レコード追加
		objOutput.Write strLine & vbCrLf '改行コードCRLF指定
	End If
Loop
objInput.Close
objOutput.Close