Set objFSO = WScript.CreateObject("Scripting.FileSystemObject")
Const ForReading = 1, ForWriting = 2, ForAppending = 8

dim arg1, arg2
'�������݃t�@�C���p�X��
arg1 = WScript.Arguments(0)
'�ǂݍ��݃t�@�C���p�X��
arg2 = WScript.Arguments(1)

'�������݃t�@�C�����I�[�v��
Set objOutput = objFSO.OpenTextFile(arg1, ForAppending, True)
'�ǂݎ��t�@�C�����I�[�v��
Set objInput = objFSO.OpenTextFile(arg2, ForReading)

' �ǂݎ��t�@�C�������[�v
Do Until objInput.AtEndOfStream
	' ���R�[�h�擾
	strLine = objInput.ReadLine
	
	' 1�s�ڈȊO�͏������݃t�@�C���֒ǋL
	If StrComp(objInput.line-1, 1 ) <> 0 Then
		' ���R�[�h�ǉ�
		objOutput.Write strLine & vbCrLf '���s�R�[�hCRLF�w��
	End If
Loop
objInput.Close
objOutput.Close