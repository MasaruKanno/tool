@echo off

rem ���ϐ�
SET BIN_PATH=bin\
SET INPUT_FILE_PATH=input\
SET OUTPUT_FILE_PATH=output\
SET OUTPUT_FILE=01_header.csv
SET OUTPUT_FILE_TMP=01_header.csv.tmp

rem tmp�t�@�C���쐬
copy /Y %INPUT_FILE_PATH%%OUTPUT_FILE% %INPUT_FILE_PATH%%OUTPUT_FILE_TMP%

rem input�t�H���_�ɂ���csv�t�@�C���ꗗ���擾���A���������[�v(�\�[�g�F���O����)
for /F %%a in ('dir /B /ON %INPUT_FILE_PATH%*.csv') do (  
  rem tmp�t�@�C����body�f�[�^�����ǋL
  cscript %BIN_PATH%file_to_merge.vbs %INPUT_FILE_PATH%%OUTPUT_FILE_TMP% %INPUT_FILE_PATH%%%a
)

rem tmp�t�@�C����output�t�H���_�ֈړ����Acsv�t�@�C���փ��l�[��
move %INPUT_FILE_PATH%%OUTPUT_FILE_TMP% %OUTPUT_FILE_PATH%%OUTPUT_FILE% 

pause