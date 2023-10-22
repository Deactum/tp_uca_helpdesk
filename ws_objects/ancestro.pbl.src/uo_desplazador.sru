$PBExportHeader$uo_desplazador.sru
forward
global type uo_desplazador from userobject
end type
type st_1 from statictext within uo_desplazador
end type
type p_siguiente from picture within uo_desplazador
end type
type p_anterior from picture within uo_desplazador
end type
type rr_1 from roundrectangle within uo_desplazador
end type
end forward

global type uo_desplazador from userobject
integer width = 722
integer height = 196
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_anterior ( )
event ue_siguiente ( )
event ue_ir_clicked ( )
st_1 st_1
p_siguiente p_siguiente
p_anterior p_anterior
rr_1 rr_1
end type
global uo_desplazador uo_desplazador

on uo_desplazador.create
this.st_1=create st_1
this.p_siguiente=create p_siguiente
this.p_anterior=create p_anterior
this.rr_1=create rr_1
this.Control[]={this.st_1,&
this.p_siguiente,&
this.p_anterior,&
this.rr_1}
end on

on uo_desplazador.destroy
destroy(this.st_1)
destroy(this.p_siguiente)
destroy(this.p_anterior)
destroy(this.rr_1)
end on

type st_1 from statictext within uo_desplazador
integer x = 192
integer y = 64
integer width = 343
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "1"
alignment alignment = center!
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;parent.event ue_ir_clicked()
end event

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

