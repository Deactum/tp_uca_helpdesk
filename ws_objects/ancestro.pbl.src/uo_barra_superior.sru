$PBExportHeader$uo_barra_superior.sru
forward
global type uo_barra_superior from userobject
end type
type p_1 from picture within uo_barra_superior
end type
end forward

global type uo_barra_superior from userobject
integer width = 3726
integer height = 208
long backcolor = 134217730
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_clicked ( )
p_1 p_1
end type
global uo_barra_superior uo_barra_superior

on uo_barra_superior.create
this.p_1=create p_1
this.Control[]={this.p_1}
end on

on uo_barra_superior.destroy
destroy(this.p_1)
end on

type p_1 from picture within uo_barra_superior
integer y = 4
integer width = 219
integer height = 192
boolean originalsize = true
string picturename = ".\iconos\1x\baseline_menu_white_48dp.png"
boolean focusrectangle = false
end type

event clicked;parent.event ue_clicked()
end event

