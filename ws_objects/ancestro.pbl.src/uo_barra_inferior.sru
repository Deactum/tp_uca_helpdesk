$PBExportHeader$uo_barra_inferior.sru
forward
global type uo_barra_inferior from userobject
end type
type st_2 from statictext within uo_barra_inferior
end type
type st_1 from statictext within uo_barra_inferior
end type
type r_1 from rectangle within uo_barra_inferior
end type
end forward

global type uo_barra_inferior from userobject
integer width = 3570
integer height = 96
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_resize ( )
st_2 st_2
st_1 st_1
r_1 r_1
end type
global uo_barra_inferior uo_barra_inferior

event ue_resize();r_1.width = this.width
st_2.x = this.width -500
st_1.x = st_2.x - st_1.width
end event

on uo_barra_inferior.create
this.st_2=create st_2
this.st_1=create st_1
this.r_1=create r_1
this.Control[]={this.st_2,&
this.st_1,&
this.r_1}
end on

on uo_barra_inferior.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.r_1)
end on

type st_2 from statictext within uo_barra_inferior
integer x = 2181
integer y = 8
integer width = 818
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Object"
boolean focusrectangle = false
end type

type st_1 from statictext within uo_barra_inferior
integer x = 1952
integer y = 8
integer width = 256
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "| Objeto:"
boolean focusrectangle = false
end type

type r_1 from rectangle within uo_barra_inferior
long linecolor = 268435456
integer linethickness = 4
long fillcolor = 1073741824
integer width = 3013
integer height = 84
end type

