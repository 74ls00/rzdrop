#include <Misc.au3>

;Dim $hpos=MouseGetPos(0)
;Dim $vpos=MouseGetPos(1)
;Dim $drkey="{PGDN}" , $drkeyp=22
;Dim $FDKey=uShopO0
Dim $version=0.8 ;������ �������
;? e8 c= 69 666 e9 c= 90 664
Dim $hshop = 8 , $vshop = 18 ;������������� w7
Dim $vDres=1	;������ ��� ���� =1 . ��������� +20	(������ �������)
Dim $itmSz=35	;������ �����
Dim $itmArrV[81] = [$itmSz*1, $itmSz*1, $itmSz*1, $itmSz*1, $itmSz*1, $itmSz*1, $itmSz*1, $itmSz*1, $itmSz*1, $itmSz*2, $itmSz*2, $itmSz*2, $itmSz*2, $itmSz*2, $itmSz*2, $itmSz*2, $itmSz*2, $itmSz*2, $itmSz*3, $itmSz*3, $itmSz*3, $itmSz*3, $itmSz*3, $itmSz*3, $itmSz*3, $itmSz*3, $itmSz*3, $itmSz*4, $itmSz*4, $itmSz*4, $itmSz*4, $itmSz*4, $itmSz*4, $itmSz*4, $itmSz*4, $itmSz*4, $itmSz*5, $itmSz*5, $itmSz*5, $itmSz*5, $itmSz*5, $itmSz*5, $itmSz*5, $itmSz*5, $itmSz*5, $itmSz*6, $itmSz*6, $itmSz*6, $itmSz*6, $itmSz*6, $itmSz*6, $itmSz*6, $itmSz*6, $itmSz*6, $itmSz*7, $itmSz*7, $itmSz*7, $itmSz*7, $itmSz*7, $itmSz*7, $itmSz*7, $itmSz*7, $itmSz*7, $itmSz*8, $itmSz*8, $itmSz*8, $itmSz*8, $itmSz*8, $itmSz*8, $itmSz*8, $itmSz*8, $itmSz*8, $itmSz*9, $itmSz*9, $itmSz*9, $itmSz*9, $itmSz*9, $itmSz*9, $itmSz*9, $itmSz*9, $itmSz*9]
Dim $itmArrH[81] = [$itmSz*1, $itmSz*2, $itmSz*3, $itmSz*4, $itmSz*5, $itmSz*6, $itmSz*7, $itmSz*8, $itmSz*9, $itmSz*1, $itmSz*2, $itmSz*3, $itmSz*4, $itmSz*5, $itmSz*6, $itmSz*7, $itmSz*8, $itmSz*9, $itmSz*1, $itmSz*2, $itmSz*3, $itmSz*4, $itmSz*5, $itmSz*6, $itmSz*7, $itmSz*8, $itmSz*9, $itmSz*1, $itmSz*2, $itmSz*3, $itmSz*4, $itmSz*5, $itmSz*6, $itmSz*7, $itmSz*8, $itmSz*9, $itmSz*1, $itmSz*2, $itmSz*3, $itmSz*4, $itmSz*5, $itmSz*6, $itmSz*7, $itmSz*8, $itmSz*9, $itmSz*1, $itmSz*2, $itmSz*3, $itmSz*4, $itmSz*5, $itmSz*6, $itmSz*7, $itmSz*8, $itmSz*9, $itmSz*1, $itmSz*2, $itmSz*3, $itmSz*4, $itmSz*5, $itmSz*6, $itmSz*7, $itmSz*8, $itmSz*9, $itmSz*1, $itmSz*2, $itmSz*3, $itmSz*4, $itmSz*5, $itmSz*6, $itmSz*7, $itmSz*8, $itmSz*9, $itmSz*1, $itmSz*2, $itmSz*3, $itmSz*4, $itmSz*5, $itmSz*6, $itmSz*7, $itmSz*8, $itmSz*9]
Dim $crStCoor[4] = [470,618,650,700]	;Dim $crStCoor[4] = [558,618,658,631]

Dim $ntime=0;200	;�������� ����� (200) ������ �����
Dim $lagpause=1500

$sProcName1 = "rzrun.exe"
If Not ProcessExists($sProcName1) Then Run($sProcName1)	;���������� ��������

AutoItSetOption("MouseCoordMode", 2) 	;������� ������ ����� 2 (0)
AutoItSetOption("PixelCoordMode", 2)	;������� ������ ���� 2

$hwnd = WinGetHandle("Rappelz")
WinWaitActive("Rappelz")

$hwnd = WinGetHandle("[ACTIVE]")
$size = WinGetClientSize("")		;�������� ������ ���� ;1264 964

HotKeySet("{PGDN}", "uShopO0")	;����� ���� �� PGDN
HotKeySet("{NUMPADDIV}", "uShopO1")	;����� ����� �� num /


;HotKeySet("{F8}", "uShopO1")	;����� ���� �� F8
HotKeySet("\", "fRes1")			;������� ���


HotKeySet("{F3}", "testc")

;HotKeySet("{SPACE}", "uDrop")	;������� ���� ����� SPACE

HotKeySet("{HOME}", "iCraft11")	;����� 1+1 ��������������� 8,3
HotKeySet("{PGUP}", "cCraft1")	;����� ���� 1+1+2
;HotKeySet("{NUMPAD1}", "petRes1") ; ������� ��� ����
HotKeySet("{F7}", "petCraft1")	;������ �����
HotKeySet("{F9}", "iIn0")		;��������� 1 2 3 ���
HotKeySet("{F10}", "petUp3")	;������ �����

HotKeySet("{F11}", "drbaf")	;��� ����� (����
;F12 bandicam record

HotKeySet("{INS}", "opnItmpnl")	;���������� � ������ 2d

HotKeySet("{NUMPADMULT}", "atkmag2")


;HotKeySet("{SPACE}", "mk")

While 1
    Sleep(2500)
WEnd

;--------------------------------------------------------------------------------------------------
Func atkmag2()
    HotKeySet("{NUMPADMULT}"); ��������� ������� �������
    Do
Send("1")
Send("2")

    Until Not _IsPressed('6A')
    HotKeySet("{NUMPADMULT}", "atkmag2");�������� ��
 EndFunc

;--------------------------------------------------------------------------------------------------
Func uShopO0()
    HotKeySet("{PGDN}"); ��������� ������� �������
    Do
MouseClick("left",23+$hshop,297+$vshop,2,0) ;���.��.��.�����.���� - ����� ������� �����
MouseClick("left",292+$hshop,316+$vshop,1,0) ;���.��.��.�����.���� - ����� ����� (����� ����)
MouseClick("left",556+$hshop,316+$vshop,1,0) ;���.��.��.�����.���� - ����� ����� �������� (����� ����)
    Until Not _IsPressed('22')
    HotKeySet("{PGDN}", "uShopO0");�������� ��
 EndFunc   ;==>uShopO0

;--------------------------------------------------------------------------------------------------
;����� �����
Func uShopO1()
    HotKeySet("{NUMPADDIV}"); ��������� ������� �������
    Do
Send("{LSHIFT down}")
MouseClick("left",31,315,2,0) ;���.��.��.�����.���� - ����� ������� �����
Send("{LSHIFT up}")
Send("{ENTER}")
Send("{ENTER}")
MouseClick("left",292+$hshop,316+$vshop,1,0) ;���.��.��.�����.���� - ����� ����� (����� ����)
MouseClick("left",556+$hshop,316+$vshop,1,0) ;���.��.��.�����.���� - ����� ����� �������� (����� ����)
    Until Not _IsPressed('6F')
    HotKeySet("{NUMPADDIV}", "uShopO1");�������� ��
 EndFunc
;--------------------------------------------------------------------------------------------------
;������� ���
Func fRes1()
   HotKeySet("\"); ��������� ������� �������
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
HotKeySet("\", "fRes1");�������� ��
EndFunc

;--------------------------------------------------------------------------------------------------
Func uDrop()
    HotKeySet("{SPACE}"); ��������� ������� �������
    Do
Send("{F9}")
Send("{SPACE}")
    Until Not _IsPressed('20')
    HotKeySet("{SPACE}", "uDrop");�������� ��
 EndFunc   ;==>uShopO

;--------------------------------------------------------------------------------------------------
;����� 1+1 ��������������� 8,3
Func iCraft11() ; ��������������( ���� - ������� ����� ����)
    HotKeySet("{HOME}"); ��������� ������� �������
    Do
	  Sleep(200)

;����� ����
MouseClick("left",500,50,1,1);500*50 ����� ���� ���������
Sleep(200); ������� ����� ���� ����������
MouseClick("left",530,580,1,1);500*50 ����� ���� ����������
Sleep(500); ������� ����� ���� ����������

;�������  �������� 1 1 � ����������
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

MouseClick("left",530,580,1,0);500*50 ����� ���� ����������
Sleep(500); ������� ����� ���� ����������

;�������  �������� 1 2 � ����������
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

MouseClick("left",530,580,1,1);500*50 ����� ���� ����������
Sleep(500); ������� ����� ���� ����������

MouseClick("left",60+$hshop,642+$vshop,1,1); ���������� 69 666

Sleep(100) ; ����� ����� ��������

    Until Not _IsPressed('24')
    HotKeySet("{HOME}", "iCraft11");�������� ��
 EndFunc   ;==>uShopO

;--------------------------------------------------------------------------------------------------
Func retMouse()
   MouseMove($size[0]/2,$size[1]/2, 0)
EndFunc
;--------------------------------------------------------------------------------------------------
Func petRes1()
    HotKeySet("{NUMPAD1}"); ��������� ������� �������
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
    HotKeySet("{NUMPAD1}", "petRes1");�������� ��
 EndFunc

;--------------------------------------------------------------------------------------------------
; ��������� 123
#cs
��������
�������
���� ���� ��������� ������������ ������ ��������� � ������ �� �������, �� �� ������.
��� ������� ���� � ���. ����� �����.
���� ���� ��� ������������ ������ �������� ����, �� �� ������.
��� ������������ ����� � ����� ����.

#ce

Func iIn0()
    HotKeySet("{F9}"); ��������� ������� �������
    Do

For $pup3=0 To 600

Send("3")	;������
Sleep(50)

For $pup31 = 1 To 3

Send("{TAB}");�����
Sleep(100)
Send("`")	;����
Sleep(50) ;
Send("2")	;����
Sleep(50)

Next

Next

    Until Not _IsPressed('78')
    HotKeySet("{F9}", "iIn0");�������� ��
 EndFunc
;--------------------------------------------------------------------------------------------------
;����� ���� 1+1+2
Func cCraft1 ()
   HotKeySet("{PGUP}"); ��������� ������� �������
   Do

For $cc1=1 To 1500

MouseClick("left",500,40,1,1);500*50 ����� ���� ���������
Sleep(200); ������� ����� ���� ����������
MouseClick("left",530,590,1,1);500*50 ����� ���� ����������
Sleep(100); ������� ����� ���� ���������� 200

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

MouseClick("left",81+$hshop,638+$vshop,1,1); ���������� 90 664 e=9.1
Sleep(1300) ; ����� ����� ��������

;MouseClick("left",$size[0]/2,32+$size[1]/2,1,1)

Next


    Until Not _IsPressed('21')
    HotKeySet("{PGUP}", "cCraft1");�������� ��

 EndFunc
;--------------------------------------------------------------------------------------------------
;������ ����� � ����� 3�����
Func petUp3 ()
   HotKeySet("{F10}"); ��������� ������� �������
   Do

For $scr81 = 1 To 20	;��������� ���������

For $vItm = 1 To 315 Step 35	;9 �����
For $hMov = 1 To 315 Step 105	;������ ���
For $hItm = $hMov To $hMov+104 Step 35 ;������� 3 �����
   MouseClick("left",351+$hshop+$hItm,44+$vshop+$vItm,5,0)
   Sleep(50)
Next ;����� ��������� ������ 3

;$rstatus = PixelSearch (196,29,261,36,0XFF8200,0,1,$hwnd) ;��� ���

MouseClick("left",324,425,2,0)	;������� ���
Sleep(200+$ntime)

$rstatus = PixelSearch (196,29,261,36,0XFF8200,0,1,$hwnd) ;��� ���
If @error Then
#cs
Send("{ENTER}")
Send("{ASC 035}")
Send("001")
Send("{ENTER}")
#ce
Sleep($lagpause-500)
EndIf
MouseClick("left",758,282+$vDres,1,0)	;������� ���������� ;760 294 9 13

Sleep(150+$ntime)

For $uSlots = 242 To 282 Step 20	;������ 1 2 3

$rstatus = PixelSearch (196,29,261,36,0XFF8200,0,1,$hwnd) ;��� ���
;$rstatus = PixelSearch (647,246,678,276,0X3B3B3B,0,1,$hwnd) ;���������� ���� ������� ;����� ������
If @error Then
#cs
Send("{ENTER}")
Send("{ASC 035}")
Send("002")
Send("{ENTER}")
#ce
Sleep($lagpause+200)
EndIf
MouseClick("left",758,$uSlots+$vDres,1,0)	;������
Sleep(600)

$rstatus = PixelSearch (196,29,261,36,0XFF8200,0,1,$hwnd) ;��� ���
;$rstatus = PixelSearch (647,246,678,276,0X3B3B3B,0,1,$hwnd) ;���������� ���� ������� ;����� ������
If @error Then
#cs
Send("{ENTER}")
Send("{ASC 035}")
Send("003")
Send("{ENTER}")
#ce
Sleep($lagpause)
EndIf
MouseClick("left",758,242+$vDres,1,0)	;�����
Sleep(150+$ntime)

Next

Send("y")	;������� �����
Sleep(100)	;������� ����� ����

$rstatus = PixelSearch (28,71,34,78,0XB99505,0,1,$hwnd) ;����� 1


If @error Then

#cs
Send("{ENTER}")
Send("{ASC 035}")
Send("004")
Send("{ENTER}")
#ce

Sleep($lagpause)
EndIf

For $formej = 98 To 350 Step 126	;������
MouseClick("left",33,$formej,4,0)
Next

Sleep(300)

Next	;����� 1 ����
Next	;����� �����

Sleep(5000)

For $scr1 = 0 To 8	;���������� ��
MouseClick("left",661,367,2,0)
Sleep(10)
Next

Next ; �����. ��������� ���������

    Until Not _IsPressed('79')
    HotKeySet("{F10}", "petUp3");�������� ��

 EndFunc
;--------------------------------------------------------------------------------------------------
;������ �����
Func petCraft1 ()
   HotKeySet("{F7}"); ��������� ������� �������
   Do

Dim $wstatus=0
Dim $rstatus=0

For $it=1 To 10

Dim $cfix=0
Dim $pItm=1		; �������
;Dim $craft=1	; 1 ������ , 0 ��������
;Dim $cend=1		;

Dim $cStep = 90	; ���������� ���������� 90=5

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
MouseClick("left",286+$itmArrH[1],27+$itmArrV[1],2,0); �������� ����������
Send("1")
Send("{ENTER}")
Sleep(100)

#cs
If $cfix=1 Then
$pItm=$pItm+1
$cfix=0
EndIf
#ce

If $pItm < 1 Then $pItm=1	;�������
If $pItm > 80 Then $pItm=1	;�������

MouseClick("left",321+$itmArrH[$pItm],27+$itmArrV[$pItm],2,0);�������� 1
$cStep -= 1 ;=$cStep-1	;��������� ���������� ���� . ���������� N
$pItm += 1 ;=$pItm+1	;��������� ��������� ����
Sleep(100)

MouseClick("left",321+$itmArrH[$pItm],27+$itmArrV[$pItm],2,0);�������� 1
$cStep -= 1 ;=$cStep-1	;��������� ���������� ����
Sleep(100)

MouseClick("left",89,656,1,1); ���������� 90 664 e=9.1

;Sleep(2300)

MouseMove(321+$itmArrH[$pItm],27+$itmArrV[$pItm],0)

MouseClick("left",$size[0]/2,32+$size[1]/2,1,1)
Sleep(1300) ; ����� ����� ��������

; �������� ������
MouseClick("left",$size[0]/2,32+$size[1]/2,1,1)

Sleep(300)
$coord1 = PixelSearch ($crStCoor[0],$crStCoor[1],$crStCoor[2],$crStCoor[3],0XB62C36,3,1,$hwnd) ;�������
If Not @error Then
$rstatus=1
;MouseMove($coord1[0],$coord1[1],0)
$wstatus=0

;Sleep(1500)
EndIf

$coord2 = PixelSearch ($crStCoor[0],$crStCoor[1],$crStCoor[2],$crStCoor[3],0XFAFBFB,10,1,$hwnd) ;�����
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



MouseClickDrag("left",321+$itmArrH[0],27+$itmArrV[0],321+$itmArrH[45],27+$itmArrV[45],6)	;����������� ����������
For $scr1 = 0 To 4	;���������� ��
MouseClick("left",661,367,2,0)
Sleep(100)
Next

Sleep(5000)
Next

    Until Not _IsPressed('76')
    HotKeySet("{F7}", "petCraft1");�������� ��
EndFunc




;--------------------------------------------------------------------------------------------------
; ���������� ������� � ������
Func opnItmpnl ()
   HotKeySet("{INS}"); ��������� ������� �������
   Do

Send("{,}")	;��2 9
Sleep(5)

    Until Not _IsPressed('2D')
    HotKeySet("{INS}", "opnItmpnl");�������� ��
EndFunc

;--------------------------------------------------------------------------------------------------
;��� �����
Func drbaf() ;���� ��
    HotKeySet("{F11}"); ��������� ������� �������
    Do
Dim $dbs=100
Dim $drum1[13] = [250,273,273,293,314,334,419,273,273,250,355,377,439]
;������������� 250 ;��������� 273 Sleep(500);�� 273 ;�3	293 ;��	314 ;��	334 ;����� 419 ;����� 272 Sleep(500) ;���������	273 ;�� 250 ;��� 315 ;�� 362 ;������� 442
For $dr2 = 0 To 12
;$dstatus = PixelSearch (196,29,261,36,0XFF8200,0,1,$hwnd) ;��� ���
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

;��	�
;��	�
;��	�
;��	�
;��	�
;��	�
;��	�
    Until Not _IsPressed('7A')
    HotKeySet("{F11}", "drbaf");�������� ��
 EndFunc
;--------------------------------------------------------------------------------------------------
Func mk()
    HotKeySet("{SPACE}"); ��������� ������� �������
    Do

MouseClick("left",$size[0]/2,$size[1]/2+40,3,0)

    Until Not _IsPressed('20')
    HotKeySet("{SPACE}", "mk");�������� ��
 EndFunc
;--------------------------------------------------------------------------------------------------
Func testc()	;���� �����
    HotKeySet("{F3}")
    Do


;MouseMove(758,242,0)
;Sleep(100)


;$rstatus = PixelSearch (196,29,261,36,0XFF8200,0,1,$hwnd) ;��� ���
;$rstatus = PixelSearch (647,246,678,276,0X3B3B3B,0,1,$hwnd) ;���������� ���� ������� ;����� ������
;$rstatus = PixelSearch (1,1,300,100,0XB99505,0,1,$hwnd)
;$rstatus = PixelSearch (28,71,34,78,0XB99505,0,1,$hwnd) ;����� 1

#cs
If Not @error Then
Else
Sleep(500)
ElseIf
#ce


;$rstatus = PixelSearch ($crStCoor[0],$crStCoor[1],$crStCoor[2],$crStCoor[3],0XFAFBFB,10,1,$hwnd) ;�����
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
;$rstatus = PixelSearch ($crStCoor[0],$crStCoor[1],$crStCoor[2],$crStCoor[3],0XB62C36,10,1,$hwnd) ;�������
$rstatus = PixelSearch (196,29,261,36,0XFF8200,0,1,$hwnd) ;��� ���

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










