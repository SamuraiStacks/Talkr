IniRead, name, data.ini, Data, Name

If (name = 0) {
    InputBox, fName, Talkr - v%version%, Looks like it is your first time running Talkr! What is your name?
    If (ErrorLevel) {
        MsgBox, , Talkr - v%version%, Well you pressed the cancel button, so bye!
    }
    Else if (fName = "") {
        Gui, Add, Text, , You did not tell me your name! Exit Talkr or Restart?
        Gui, Add, Button, , &Exit
        Gui, Add, Button, , &Restart
        Gui, Show
        Return

        ButtonRestart:
        Reload
        
        ButtonExit:
        GuiClose:
        ExitApp
    } 
    Else {
        #Persistent
        SetTimer, restart, -4000
        IniWrite, "%fName%", data.ini, Data, Name
        MsgBox, , Talkr - v%version%, Reloading...
        return

        restart:
            Reload
        return
    }
}
Else {
    InputBox, text, Talkr, Tell me what you want me to say!
    If (ErrorLevel) {
        MsgBox, , Talkr - v%version%, Well you pressed the cancel button, so bye!
    }
    Else If (text = "")  {
        Gui, Add, Text, , You did not tell me what to say! Close Talkr or Reload?
        Gui, Add, Button, , &Close
        Gui, Add, Button, , &Reload
        Gui, Show
        Return

        ButtonReload:
        Reload
        
        ButtonClose:
        ExitApp
    }
    Else
        MsgBox, , Talkr - v%version%, %name% said %text%
}