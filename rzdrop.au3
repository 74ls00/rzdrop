#include <Misc.au3>

;Dim $hpos=MouseGetPos(0)
;Dim $vpos=MouseGetPos(1)
;Dim $drkey="{PGDN}" , $drkeyp=22
;Dim $FDKey=uShopO0
Dim $version=0.8 ;версия скрипта
;? e8 c= 69 666 e9 c= 90 664
Dim $hshop = 8 , $vshop = 18 ;полноэкранный w7
Dim $vDres=1	;строка нпц дрес =1 . следующая +20	(фильтр квестов)
Dim $itmSz=35	;размер слота
Dim $itmArrV[81] = [$itmSz*1, $itmSz*1, $itmSz*1, $itmSz*1, $itmSz*1, $itmSz*1, $itmSz*1, $itmSz*1, $itmSz*1, $itmSz*2, $itmSz*2, $itmSz*2, $itmSz*2, $itmSz*2, $itmSz*2, $itmSz*2, $itmSz*2, $itmSz*2, $itmSz*3, $itmSz*3, $itmSz*3, $itmSz*3, $itmSz*3, $itmSz*3, $itmSz*3, $itmSz*3, $itmSz*3, $itmSz*4, $itmSz*4, $itmSz*4, $itmSz*4, $itmSz*4, $itmSz*4, $itmSz*4, $itmSz*4, $itmSz*4, $itmSz*5, $itmSz*5, $itmSz*5, $itmSz*5, $itmSz*5, $itmSz*5, $itmSz*5, $itmSz*5, $itmSz*5, $itmSz*6, $itmSz*6, $itmSz*6, $itmSz*6, $itmSz*6, $itmSz*6, $itmSz*6, $itmSz*6, $itmSz*6, $itmSz*7, $itmSz*7, $itmSz*7, $itmSz*7, $itmSz*7, $itmSz*7, $itmSz*7, $itmSz*7, $itmSz*7, $itmSz*8, $itmSz*8, $itmSz*8, $itmSz*8, $itmSz*8, $itmSz*8, $itmSz*8, $itmSz*8, $itmSz*8, $itmSz*9, $itmSz*9, $itmSz*9, $itmSz*9, $itmSz*9, $itmSz*9, $itmSz*9, $itmSz*9, $itmSz*9]
Dim $itmArrH[81] = [$itmSz*1, $itmSz*2, $itmSz*3, $itmSz*4, $itmSz*5, $itmSz*6, $itmSz*7, $itmSz*8, $itmSz*9, $itmSz*1, $itmSz*2, $itmSz*3, $itmSz*4, $itmSz*5, $itmSz*6, $itmSz*7, $itmSz*8, $itmSz*9, $itmSz*1, $itmSz*2, $itmSz*3, $itmSz*4, $itmSz*5, $itmSz*6, $itmSz*7, $itmSz*8, $itmSz*9, $itmSz*1, $itmSz*2, $itmSz*3, $itmSz*4, $itmSz*5, $itmSz*6, $itmSz*7, $itmSz*8, $itmSz*9, $itmSz*1, $itmSz*2, $itmSz*3, $itmSz*4, $itmSz*5, $itmSz*6, $itmSz*7, $itmSz*8, $itmSz*9, $itmSz*1, $itmSz*2, $itmSz*3, $itmSz*4, $itmSz*5, $itmSz*6, $itmSz*7, $itmSz*8, $itmSz*9, $itmSz*1, $itmSz*2, $itmSz*3, $itmSz*4, $itmSz*5, $itmSz*6, $itmSz*7, $itmSz*8, $itmSz*9, $itmSz*1, $itmSz*2, $itmSz*3, $itmSz*4, $itmSz*5, $itmSz*6, $itmSz*7, $itmSz*8, $itmSz*9, $itmSz*1, $itmSz*2, $itmSz*3, $itmSz*4, $itmSz*5, $itmSz*6, $itmSz*7, $itmSz*8, $itmSz*9]
Dim $crStCoor[4] = [470,618,650,700]	;Dim $crStCoor[4] = [558,618,658,631]

Dim $ntime=0;200	;задержка лагов (200) апалка петов
Dim $lagpause=1500

$sProcName1 = "rzrun.exe"
If Not ProcessExists($sProcName1) Then Run($sProcName1)	;перезапуск стартера

AutoItSetOption("MouseCoordMode", 2) 	;позиция внутри окнна 2 (0)
AutoItSetOption("PixelCoordMode", 2)	;пиксели внутри окна 2

$hwnd = WinGetHandle("Rappelz")
WinWaitActive("Rappelz")

$hwnd = WinGetHandle("[ACTIVE]")
$size = WinGetClientSize("")		;получить размер окна ;1264 964

HotKeySet("{PGDN}", "uShopO0")	;сдать дроп на PGDN
HotKeySet("{NUMPADDIV}", "uShopO1")	;сдать карты на num /


;HotKeySet("{F8}", "uShopO1")	;сдать дроп на F8
HotKeySet("\", "fRes1")			;быстрый ББФ


HotKeySet("{F3}", "testc")

;HotKeySet("{SPACE}", "uDrop")	;быстрый сбор дропа SPACE

HotKeySet("{HOME}", "iCraft11")	;крафт 1+1 перетаскиванием 8,3
HotKeySet("{PGUP}", "cCraft1")	;крафт карт 1+1+2
;HotKeySet("{NUMPAD1}", "petRes1") ; быстрый рес пета
HotKeySet("{F7}", "petCraft1")	;клейка петов
HotKeySet("{F9}", "iIn0")		;приручить 1 2 3 таб
HotKeySet("{F10}", "petUp3")	;апалка петов

HotKeySet("{F11}", "drbaf")	;баф друля (охот
;F12 bandicam record

HotKeySet("{INS}", "opnItmpnl")	;открывалка с панели 2d

HotKeySet("{NUMPADMULT}", "atkmag2")


;HotKeySet("{SPACE}", "mk")

While 1
    Sleep(2500)
WEnd

;--------------------------------------------------------------------------------------------------
Func atkmag2()
    HotKeySet("{NUMPADMULT}"); отключаем горячую клавишу
    Do
Send("1")
Send("2")

    Until Not _IsPressed('6A')
    HotKeySet("{NUMPADMULT}", "atkmag2");включаем ее
 EndFunc

;--------------------------------------------------------------------------------------------------
Func uShopO0()
    HotKeySet("{PGDN}"); отключаем горячую клавишу
    Do
MouseClick("left",23+$hshop,297+$vshop,2,0) ;лкм.гк.вк.выбор.скор - выбор нижнего итема
MouseClick("left",292+$hshop,316+$vshop,1,0) ;лкм.гк.вк.выбор.скор - сдвиг вверх (выбор ниже)
MouseClick("left",556+$hshop,316+$vshop,1,0) ;лкм.гк.вк.выбор.скор - сдвиг вверх выбраных (выбор ниже)
    Until Not _IsPressed('22')
    HotKeySet("{PGDN}", "uShopO0");включаем ее
 EndFunc   ;==>uShopO0

;--------------------------------------------------------------------------------------------------
;сдать карты
Func uShopO1()
    HotKeySet("{NUMPADDIV}"); отключаем горячую клавишу
    Do
Send("{LSHIFT down}")
MouseClick("left",31,315,2,0) ;лкм.гк.вк.выбор.скор - выбор нижнего итема
Send("{LSHIFT up}")
Send("{ENTER}")
Send("{ENTER}")
MouseClick("left",292+$hshop,316+$vshop,1,0) ;лкм.гк.вк.выбор.скор - сдвиг вверх (выбор ниже)
MouseClick("left",556+$hshop,316+$vshop,1,0) ;лкм.гк.вк.выбор.скор - сдвиг вверх выбраных (выбор ниже)
    Until Not _IsPressed('6F')
    HotKeySet("{NUMPADDIV}", "uShopO1");включаем ее
 EndFunc
;--------------------------------------------------------------------------------------------------
;быстрый ББФ
Func fRes1()
   HotKeySet("\"); отключаем горячую клавишу
    Do
Send("h")
Sleep(50)
Send("h")
Sleep(50)
MouseClick("left",$size[0]/2+(425+$hshop),$size[1]/2-((594+$vshop)/2),1,0) ; h= 1/2h + 450-17 ; v= v/2-660-13 900x660
Sleep(150)
MouseClick("left",$size[0]/2,$size[1]/2+ $vshop+11,1,0) ; h=1/2 h size ;frame= 300x178

Send("s")
Sleep(500)
Until Not _IsPressed('6F')
HotKeySet("\", "fRes1");включаем ее
EndFunc

;--------------------------------------------------------------------------------------------------
Func uDrop()
    HotKeySet("{SPACE}"); отключаем горячую клавишу
    Do
Send("{F9}")
Send("{SPACE}")
    Until Not _IsPressed('20')
    HotKeySet("{SPACE}", "uDrop");включаем ее
 EndFunc   ;==>uShopO

;--------------------------------------------------------------------------------------------------
;крафт 1+1 перетаскиванием 8,3
Func iCraft11() ; комбинирование( окно - верхний левый угол)
    HotKeySet("{HOME}"); отключаем горячую клавишу
    Do
	  Sleep(200)

;выбор окон
MouseClick("left",500,50,1,1);500*50 выбор окна инвентаря
Sleep(200); ожидать выбор окна иинвентаря
MouseClick("left",530,580,1,1);500*50 выбор окна комбинации
Sleep(500); ожидать выбор окна комбинации

;перенос  элемента 1 1 в комбинацию
MouseMove(364+$hshop, 75+$vshop, 5)
Sleep(100)
MouseDown("left")
Sleep(650)
MouseUp("left")
MouseDown("left")
;Sleep(10)
MouseMove(181+$hshop, 572+$vshop, 7) ;190*619
MouseUp("left")
Sleep(200)
Send("{1}")
Sleep(200)
Send("{ENTER}")
Sleep(10)

MouseClick("left",530,580,1,0);500*50 выбор окна комбинации
Sleep(500); ожидать выбор окна комбинации

;перенос  элемента 1 2 в комбинацию
MouseMove(398+$hshop, 75+$vshop, 5)
MouseDown("left")
Sleep(600)
MouseUp("left")
MouseDown("left")
;Sleep(10)
MouseMove(181+$hshop, 572+$vshop, 7) ;190*619
MouseUp("left")
Sleep(200)
Send("{1}")
Sleep(200)
Send("{ENTER}")
Sleep(100)

MouseClick("left",530,580,1,1);500*50 выбор окна комбинации
Sleep(500); ожидать выбор окна комбинации

MouseClick("left",60+$hshop,642+$vshop,1,1); комбинация 69 666

Sleep(100) ; пауза перед повтором

    Until Not _IsPressed('24')
    HotKeySet("{HOME}", "iCraft11");включаем ее
 EndFunc   ;==>uShopO

;--------------------------------------------------------------------------------------------------
Func retMouse()
   MouseMove($size[0]/2,$size[1]/2, 0)
EndFunc
;--------------------------------------------------------------------------------------------------
Func petRes1()
    HotKeySet("{NUMPAD1}"); отключаем горячую клавишу
    Do

MouseMove(96+$hshop, 100+$vshop,0) ;94 133(9 47
MouseDown("left")
Sleep(300)
MouseUp("left")
Sleep(200)
Send("{F3},1")
Sleep(50)

Send("{ESC}")
 MouseMove($size[0]/2,$size[1]/2, 0)
    Until Not _IsPressed('61')
    HotKeySet("{NUMPAD1}", "petRes1");включаем ее
 EndFunc

;--------------------------------------------------------------------------------------------------
; приручить 123
#cs
алгоритм
сделать
если скил приручить относительно нижних координар и центра не активен, то не ручать.
или выбрать цель и баф. пауза каста.
если маны нет относительно левого верхнего края, то не ручать.
или использовать банку и ждать ману.

#ce

Func iIn0()
    HotKeySet("{F9}"); отключаем горячую клавишу
    Do

For $pup3=0 To 600

Send("3")	;призыв
Sleep(50)

For $pup31 = 1 To 3

Send("{TAB}");выбор
Sleep(100)
Send("`")	;каст
Sleep(50) ;
Send("2")	;убой
Sleep(50)

Next

Next

    Until Not _IsPressed('78')
    HotKeySet("{F9}", "iIn0");включаем ее
 EndFunc
;--------------------------------------------------------------------------------------------------
;крафт карт 1+1+2
Func cCraft1 ()
   HotKeySet("{PGUP}"); отключаем горячую клавишу
   Do

For $cc1=1 To 1500

MouseClick("left",500,40,1,1);500*50 выбор окна инвентаря
Sleep(200); ожидать выбор окна иинвентаря
MouseClick("left",530,590,1,1);500*50 выбор окна комбинации
Sleep(100); ожидать выбор окна комбинации 200

MouseClick("left",358,348,2,0)
Send("1")
Send("{ENTER}")
Sleep(50)

MouseClick("left",392,348,2,0) ;34
Send("1")
Send("{ENTER}")
Sleep(50)

MouseClick("left",426,348,4,0) ;34
Send("1")
Send("{ENTER}")
Sleep(50)

MouseClick("left",$size[0]/2,32+$size[1]/2,1,1)

MouseClick("left",81+$hshop,638+$vshop,1,1); комбинация 90 664 e=9.1
Sleep(1300) ; пауза перед повтором

;MouseClick("left",$size[0]/2,32+$size[1]/2,1,1)

Next


    Until Not _IsPressed('21')
    HotKeySet("{PGUP}", "cCraft1");включаем ее

 EndFunc
;--------------------------------------------------------------------------------------------------
;апалка петов у дреса 3дырки
Func petUp3 ()
   HotKeySet("{F10}"); отключаем горячую клавишу
   Do

For $scr81 = 1 To 20	;следующий инвентарь

For $vItm = 1 To 315 Step 35	;9 рядов
For $hMov = 1 To 315 Step 105	;первый ряд
For $hItm = $hMov To $hMov+104 Step 35 ;уложить 3 карты
   MouseClick("left",351+$hshop+$hItm,44+$vshop+$vItm,5,0)
   Sleep(50)
Next ;конец установки первых 3

;$rstatus = PixelSearch (196,29,261,36,0XFF8200,0,1,$hwnd) ;имя нпц

MouseClick("left",324,425,2,0)	;открыть нпц
Sleep(200+$ntime)

$rstatus = PixelSearch (196,29,261,36,0XFF8200,0,1,$hwnd) ;имя нпц
If @error Then
#cs
Send("{ENTER}")
Send("{ASC 035}")
Send("001")
Send("{ENTER}")
#ce
Sleep($lagpause-500)
EndIf
MouseClick("left",758,282+$vDres,1,0)	;открыть тренировку ;760 294 9 13

Sleep(150+$ntime)

For $uSlots = 242 To 282 Step 20	;апалка 1 2 3

$rstatus = PixelSearch (196,29,261,36,0XFF8200,0,1,$hwnd) ;имя нпц
;$rstatus = PixelSearch (647,246,678,276,0X3B3B3B,0,1,$hwnd) ;готовность окна диалога ;серый диалог
If @error Then
#cs
Send("{ENTER}")
Send("{ASC 035}")
Send("002")
Send("{ENTER}")
#ce
Sleep($lagpause+200)
EndIf
MouseClick("left",758,$uSlots+$vDres,1,0)	;апнуть
Sleep(600)

$rstatus = PixelSearch (196,29,261,36,0XFF8200,0,1,$hwnd) ;имя нпц
;$rstatus = PixelSearch (647,246,678,276,0X3B3B3B,0,1,$hwnd) ;готовность окна диалога ;серый диалог
If @error Then
#cs
Send("{ENTER}")
Send("{ASC 035}")
Send("003")
Send("{ENTER}")
#ce
Sleep($lagpause)
EndIf
MouseClick("left",758,242+$vDres,1,0)	;назад
Sleep(150+$ntime)

Next

Send("y")	;открыть форму
Sleep(100)	;убирает выбор себя

$rstatus = PixelSearch (28,71,34,78,0XB99505,0,1,$hwnd) ;форма 1


If @error Then

#cs
Send("{ENTER}")
Send("{ASC 035}")
Send("004")
Send("{ENTER}")
#ce

Sleep($lagpause)
EndIf

For $formej = 98 To 350 Step 126	;вынуть
MouseClick("left",33,$formej,4,0)
Next

Sleep(300)

Next	;конец 1 ряда
Next	;конец рядов

Sleep(5000)

For $scr1 = 0 To 8	;прокрутить всё
MouseClick("left",661,367,2,0)
Sleep(10)
Next

Next ; конец. следующий инвентарь

    Until Not _IsPressed('79')
    HotKeySet("{F10}", "petUp3");включаем ее

 EndFunc
;--------------------------------------------------------------------------------------------------
;клейка петов
Func petCraft1 ()
   HotKeySet("{F7}"); отключаем горячую клавишу
   Do

Dim $wstatus=0
Dim $rstatus=0

For $it=1 To 10

Dim $cfix=0
Dim $pItm=1		; позиция
;Dim $craft=1	; 1 удачно , 0 неудачно
;Dim $cend=1		;

Dim $cStep = 90	; количество комбинаций 90=5

;Sleep(3000)

;Do
While $cStep

#cs
Send("{ENTER}")
Send("{ASC 035}")
Send($pItm)
Send("{ASC 044}")
Send($rstatus)
Send("{ASC 044}")
Send($wstatus)
;Send("9")
Send("{ENTER}")
#ce

;Sleep(300)
MouseClick("left",286+$itmArrH[1],27+$itmArrV[1],2,0); положить комбинатор
Send("1")
Send("{ENTER}")
Sleep(100)

#cs
If $cfix=1 Then
$pItm=$pItm+1
$cfix=0
EndIf
#ce

If $pItm < 1 Then $pItm=1	;костыль
If $pItm > 80 Then $pItm=1	;костыль

MouseClick("left",321+$itmArrH[$pItm],27+$itmArrV[$pItm],2,0);положить 1
$cStep -= 1 ;=$cStep-1	;уменьшаем оставшиеся шаги . изначально N
$pItm += 1 ;=$pItm+1	;указываем следующий итем
Sleep(100)

MouseClick("left",321+$itmArrH[$pItm],27+$itmArrV[$pItm],2,0);положить 1
$cStep -= 1 ;=$cStep-1	;уменьшаем оставшиеся шаги
Sleep(100)

MouseClick("left",89,656,1,1); комбинация 90 664 e=9.1

;Sleep(2300)

MouseMove(321+$itmArrH[$pItm],27+$itmArrV[$pItm],0)

MouseClick("left",$size[0]/2,32+$size[1]/2,1,1)
Sleep(1300) ; пауза перед повтором

; сбросить ошибку
MouseClick("left",$size[0]/2,32+$size[1]/2,1,1)

Sleep(300)
$coord1 = PixelSearch ($crStCoor[0],$crStCoor[1],$crStCoor[2],$crStCoor[3],0XB62C36,3,1,$hwnd) ;красный
If Not @error Then
$rstatus=1
;MouseMove($coord1[0],$coord1[1],0)
$wstatus=0

;Sleep(1500)
EndIf

$coord2 = PixelSearch ($crStCoor[0],$crStCoor[1],$crStCoor[2],$crStCoor[3],0XFAFBFB,10,1,$hwnd) ;белый
If Not @error Then $wstatus=1
Sleep(300)

If $rstatus > $wstatus Then
$pItm -= 1;$pItm=$pItm-1
$rstatus=0
$wstatus=0
$cfix=1
$cStep += 1;=$cStep+1
EndIf





;If $cStep=0 Then $cend=0
;Until $cend=1
WEnd



MouseClickDrag("left",321+$itmArrH[0],27+$itmArrV[0],321+$itmArrH[45],27+$itmArrV[45],6)	;переместить комбинатор
For $scr1 = 0 To 4	;прокрутить всё
MouseClick("left",661,367,2,0)
Sleep(100)
Next

Sleep(5000)
Next

    Until Not _IsPressed('76')
    HotKeySet("{F7}", "petCraft1");включаем ее
EndFunc




;--------------------------------------------------------------------------------------------------
; открывалка коробок с панели
Func opnItmpnl ()
   HotKeySet("{INS}"); отключаем горячую клавишу
   Do

Send("{,}")	;бк2 9
Sleep(5)

    Until Not _IsPressed('2D')
    HotKeySet("{INS}", "opnItmpnl");включаем ее
EndFunc

;--------------------------------------------------------------------------------------------------
;баф друля
Func drbaf() ;охот са
    HotKeySet("{F11}"); отключаем горячую клавишу
    Do
Dim $dbs=100
Dim $drum1[13] = [250,273,273,293,314,334,419,273,273,250,355,377,439]
;перекрывающая 250 ;усиленная 273 Sleep(500);фа 273 ;ф3	293 ;ма	314 ;мз	334 ;назад 419 ;общая 272 Sleep(500) ;усиленная	273 ;са 250 ;бег 315 ;ск 362 ;закрыть 442
For $dr2 = 0 To 12
;$dstatus = PixelSearch (196,29,261,36,0XFF8200,0,1,$hwnd) ;имя нпц
Sleep(50)
If $dr2 = 2 Or $dr2 = 8 Then Sleep(500)
Sleep($dbs)
#cs
If Not @error Then
Sleep($dbs)
Else
Sleep(500)
EndIf
#ce
;MouseMove(758,$drum1[$dr2],0)
;Sleep(50)
MouseClick("left",758,$drum1[$dr2],1,0)
Next

;са	о
;фа	п
;фз	п
;ма	п
;мз	п
;бе	о
;ск	о
    Until Not _IsPressed('7A')
    HotKeySet("{F11}", "drbaf");включаем ее
 EndFunc
;--------------------------------------------------------------------------------------------------
Func mk()
    HotKeySet("{SPACE}"); отключаем горячую клавишу
    Do

MouseClick("left",$size[0]/2,$size[1]/2+40,3,0)

    Until Not _IsPressed('20')
    HotKeySet("{SPACE}", "mk");включаем ее
 EndFunc
;--------------------------------------------------------------------------------------------------
Func testc()	;тест цвета
    HotKeySet("{F3}")
    Do


;MouseMove(758,242,0)
;Sleep(100)


;$rstatus = PixelSearch (196,29,261,36,0XFF8200,0,1,$hwnd) ;имя нпц
;$rstatus = PixelSearch (647,246,678,276,0X3B3B3B,0,1,$hwnd) ;готовность окна диалога ;серый диалог
;$rstatus = PixelSearch (1,1,300,100,0XB99505,0,1,$hwnd)
;$rstatus = PixelSearch (28,71,34,78,0XB99505,0,1,$hwnd) ;форма 1

#cs
If Not @error Then
Else
Sleep(500)
ElseIf
#ce


;$rstatus = PixelSearch ($crStCoor[0],$crStCoor[1],$crStCoor[2],$crStCoor[3],0XFAFBFB,10,1,$hwnd) ;белый
#cs
If Not @error Then

MouseMove($rstatus[0],$rstatus[1],0)
Send("{ENTER}")
Send("{ASC 035}")
Send($rstatus[0])
Send("{ASC 044}")
Send($rstatus[1])
Send("{ASC 044}")
Send("00")
Send("{ENTER}")
Sleep(100)
Else


EndIf
#ce

;#cs
;$rstatus = PixelSearch ($crStCoor[0],$crStCoor[1],$crStCoor[2],$crStCoor[3],0XB62C36,10,1,$hwnd) ;красный
$rstatus = PixelSearch (196,29,261,36,0XFF8200,0,1,$hwnd) ;имя нпц

If @error Then
Send("{ENTER}")
Send("{ASC 035}")
Send("1")
Send("{ENTER}")
Sleep(100)
Else
   MouseMove($rstatus[0],$rstatus[1],0)
Send("{ENTER}")
Send("{ASC 035}")
Send($rstatus[0])
Send("{ASC 044}")
Send($rstatus[1])
Send("{ASC 044}")
Send("0")
Send("{ENTER}")
Sleep(100)
EndIf
;#ce

    Until Not _IsPressed('72')
    HotKeySet("{F3}", "testc")
 EndFunc

;--------------------------------------------------------------------------------------------------










