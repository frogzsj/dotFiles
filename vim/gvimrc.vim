set guioptions-=m
set guioptions-=T

if has('gui_running')
    macm File.Print key=<nop>
    macm File.Close key=<nop>
    macm File.New\ Window key=<nop>
    macm File.New\ Tab key=<nop>
    macm File.Open\.\.\. key=<nop>
    macm Edit.Find.Find\.\.\. key=<nop>
    macm Edit.Find.Find\ Next key=<nop>
    macm Tools.Make key=<nop>
    macm Edit.Find.Use\ Selection\ for\ Find key=<nop>
    macm Tools.Spelling.To\ Next\ Error	key=<nop>
    macm Tools.List\ Errors key=<nop>
    macm Window.Minimize key=<nop>
    macm Window.Select\ Next\ Tab	key=<nop>
    macm Window.Select\ Previous\ Tab	key=<nop>
endif
