InputBox, text, Talkr
If ErrorLevel
    MsgBox, , Talkr, Well you pressed the cancel button, so bye!
Else
    If (text = "") {
        Gui, Add, Text, , You did not tell me what to say! Close Talkr or Reload?
        Gui, Add, Button, , &Close
        Gui, Add, Button, , &Reload
        Gui, Show
        Return

        ButtonReload:
        Reload
        
        ButtonClose:
        GuiClose:
        ExitApp
    }
    Else
        MsgBox, , Talkr, "%text%"