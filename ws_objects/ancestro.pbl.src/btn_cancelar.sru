$PBExportHeader$btn_cancelar.sru
forward
global type btn_cancelar from commandbutton
end type
end forward

global type btn_cancelar from commandbutton
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancelar"
end type
global btn_cancelar btn_cancelar

event clicked;close(parent)
end event

on btn_cancelar.create
end on

on btn_cancelar.destroy
end on

