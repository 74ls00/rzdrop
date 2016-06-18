set prodir=G:\home\Documents\Projects\autoit\rz_lex\src
set outdir=G:\home\Documents\Projects\autoit\rz_lex\src\build
set autoitdir="T:\Program Files (x86)\AutoIt3"
set prun=rzrun
set pavt=rzdrop

tskill %prun%
tskill %pavt%

del %outdir%\%prun%.exe
del %outdir%\%pavt%.exe

start /d %autoitdir%\Aut2Exe Aut2exe.exe /in %prodir%\%prun%.au3 /out %outdir%\%prun%.exe /icon %prodir%\%prun%.ico
start /d %autoitdir%\Aut2Exe Aut2exe.exe /in %prodir%\%pavt%.au3 /out %outdir%\%pavt%.exe /icon %prodir%\%pavt%.ico


