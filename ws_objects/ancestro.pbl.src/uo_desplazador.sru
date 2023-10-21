$PBExportHeader$uo_desplazador.sru
forward
global type uo_desplazador from userobject
end type
type em_1 from editmask within uo_desplazador
end type
type p_siguiente from picture within uo_desplazador
end type
type p_anterior from picture within uo_desplazador
end type
type rr_1 from roundrectangle within uo_desplazador
end type
end forward

global type uo_desplazador from userobject
integer width = 731
integer height = 212
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_anterior ( )
event ue_siguiente ( )
em_1 em_1
p_siguiente p_siguiente
p_anterior p_anterior
rr_1 rr_1
end type
global uo_desplazador uo_desplazador

on uo_desplazador.create
this.em_1=create em_1
this.p_siguiente=create p_siguiente
this.p_anterior=create p_anterior
this.rr_1=create rr_1
this.Control[]={this.em_1,&
this.p_siguiente,&
this.p_anterior,&
this.rr_1}
end on

on uo_desplazador.destroy
destroy(this.em_1)
destroy(this.p_siguiente)
destroy(this.p_anterior)
destroy(this.rr_1)
end on

type em_1 from editmask within uo_desplazador
integer x = 206
integer y = 40
integer width = 311
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#"
boolean spin = true
double increment = 1
end type

type p_siguiente from picture within uo_desplazador
integer x = 544
integer y = 32
integer width = 155
integer height = 132
string picturename = "D:\Archivos\trabajo practico\dev\iconos\1x\baseline_last_page_black_48dp.png"
borderstyle borderstyle = styleraised!
end type

event clicked;parent.event ue_siguiente()
end event

type p_anterior from picture within uo_desplazador
integer x = 27
integer y = 32
integer width = 155
integer height = 132
string picturename = "D:\Archivos\trabajo practico\dev\iconos\1x\baseline_first_page_black_48dp.png"
borderstyle borderstyle = styleraised!
end type

event clicked;parent.event ue_anterior()
end event

type rr_1 from roundrectangle within uo_desplazador
long linecolor = 268435456
integer linethickness = 4
long fillcolor = 1073741824
integer x = 9
integer y = 4
integer width = 709
integer height = 188
integer cornerheight = 40
integer cornerwidth = 46
end type

