@echo off

rem 環境変数
SET BIN_PATH=bin\
SET INPUT_FILE_PATH=input\
SET OUTPUT_FILE_PATH=output\
SET OUTPUT_FILE=01_header.csv
SET OUTPUT_FILE_TMP=01_header.csv.tmp

rem tmpファイル作成
copy /Y %INPUT_FILE_PATH%%OUTPUT_FILE% %INPUT_FILE_PATH%%OUTPUT_FILE_TMP%

rem inputフォルダにあるcsvファイル一覧を取得し、件数分ループ(ソート：名前昇順)
for /F %%a in ('dir /B /ON %INPUT_FILE_PATH%*.csv') do (  
  rem tmpファイルへbodyデータだけ追記
  cscript %BIN_PATH%file_to_merge.vbs %INPUT_FILE_PATH%%OUTPUT_FILE_TMP% %INPUT_FILE_PATH%%%a
)

rem tmpファイルをoutputフォルダへ移動し、csvファイルへリネーム
move %INPUT_FILE_PATH%%OUTPUT_FILE_TMP% %OUTPUT_FILE_PATH%%OUTPUT_FILE% 

pause