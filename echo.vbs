Set objArgs = WScript.Arguments
message = Replace(objArgs(0), "\n", vbCrLf)
buttons = objArgs(1)
title = objArgs(2)

buttonsValue = Eval(buttons)

x = MsgBox(message, buttonsValue, title)

WScript.Quit(x)
