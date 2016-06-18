#include <Misc.au3>
#Include <WinAPIEx.au3>

;Dim $hshop = 8 , $vshop = 18
;AutoItSetOption("MouseCoordMode", 2)
;WinWaitActive("Rappelz")
;$size = WinGetClientSize("")
$sProcName = "rzdrop.exe"
$sProcName2 = "AutoIt3.exe"

If Not ProcessExists($sProcName) Then Run($sProcName)

HotKeySet("{F2}", "rkill")



While 1
    Sleep(2500)
;#cs
$GetLang = Hex(BitAND(_WinAPI_GetKeyboardLayout(WinGetHandle('[ACTIVE]')), 0xFFFF), 4)
If $GetLang <> 0419 Then
Sleep(3000)
;Send('{RCTRL}',0)
EndIf
;#ce

WEnd

Func rkill()
   HotKeySet("{F2}")
   Do

   Do
ProcessClose($sProcName)
   Until Not ProcessExists($sProcName)

      Do
ProcessClose($sProcName2)
   Until Not ProcessExists($sProcName2)


;Sleep(100)
Run($sProcName)

    Until Not _IsPressed('71')
    HotKeySet("{F2}", "rkill")
 EndFunc