@echo off

cd %~dp0
:start
chcp 65001
powershell "%~dp0\builders\v7290\FXServer +set citizen_dir %~dp0\builders\v7290\citizen\ %* +exec ./runner/configs/server.cfg +set onesync on +set onesync_forceMigration true +set onesync_population false +set sv_enforceGameBuild 3095"
goto start