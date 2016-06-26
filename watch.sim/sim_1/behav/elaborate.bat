@echo off
set xv_path=E:\\Programy\\Vivado\\2014.3.1\\bin
call %xv_path%/xelab  -wto 6ab6ebe421c6441380c1e69b722975c2 -m64 --debug typical --relax -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot test_behav xil_defaultlib.test xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
