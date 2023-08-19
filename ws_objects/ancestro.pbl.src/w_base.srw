$PBExportHeader$w_base.srw
$PBExportComments$ancestro de ventana
forward
global type w_base from window
end type
type cb_1 from commandbutton within w_base
end type
type st_1 from statictext within w_base
end type
type rbb_1 from ribbonbar within w_base
end type
end forward

global type w_base from window
integer width = 4745
integer height = 1900
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean clientedge = true
boolean center = true
cb_1 cb_1
st_1 st_1
rbb_1 rbb_1
end type
global w_base w_base

on w_base.create
this.cb_1=create cb_1
this.st_1=create st_1
this.rbb_1=create rbb_1
this.Control[]={this.cb_1,&
this.st_1,&
this.rbb_1}
end on

on w_base.destroy
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.rbb_1)
end on

type cb_1 from commandbutton within w_base
integer x = 439
integer y = 616
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "close"
end type

event clicked;close(parent)
end event

type st_1 from statictext within w_base
integer x = 1413
integer y = 660
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ventana"
boolean focusrectangle = false
end type

type rbb_1 from ribbonbar within w_base
integer width = 4718
integer height = 492
long backcolor = 15132390
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
end type

