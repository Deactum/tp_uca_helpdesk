$PBExportHeader$uo_desplazador_rpt.sru
forward
global type uo_desplazador_rpt from userobject
end type
type p_2 from picture within uo_desplazador_rpt
end type
type p_1 from picture within uo_desplazador_rpt
end type
type p_siguiente from picture within uo_desplazador_rpt
end type
type p_anterior from picture within uo_desplazador_rpt
end type
type rr_1 from roundrectangle within uo_desplazador_rpt
end type
end forward

global type uo_desplazador_rpt from userobject
integer width = 722
integer height = 196
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_anterior ( )
event ue_siguiente ( )
event ue_ir_clicked ( )
event ue_final ( )
event ue_inicio ( )
p_2 p_2
p_1 p_1
p_siguiente p_siguiente
p_anterior p_anterior
rr_1 rr_1
end type
global uo_desplazador_rpt uo_desplazador_rpt

on uo_desplazador_rpt.create
this.p_2=create p_2
this.p_1=create p_1
this.p_siguiente=create p_siguiente
this.p_anterior=create p_anterior
this.rr_1=create rr_1
this.Control[]={this.p_2,&
this.p_1,&
this.p_siguiente,&
this.p_anterior,&
this.rr_1}
end on

on uo_desplazador_rpt.destroy
destroy(this.p_2)
destroy(this.p_1)
destroy(this.p_siguiente)
destroy(this.p_anterior)
destroy(this.rr_1)
end on

type p_2 from picture within uo_desplazador_rpt
integer x = 366
integer y = 32
integer width = 155
integer height = 132
integer transparency = 40
string picturename = ".\iconos\1x\baseline_navigate_next_black_48dp.png"
borderstyle borderstyle = styleraised!
end type

event clicked;parent.event ue_siguiente()
end event

type p_1 from picture within uo_desplazador_rpt
integer x = 206
integer y = 32
integer width = 155
integer height = 132
integer transparency = 40
string picturename = ".\iconos\1x\baseline_navigate_before_black_48dp.png"
borderstyle borderstyle = styleraised!
end type

event clicked;parent.event ue_anterior()
end event

type p_siguiente from picture within uo_desplazador_rpt
integer x = 544
integer y = 32
integer width = 155
integer height = 132
integer transparency = 40
string picturename = ".\iconos\1x\baseline_last_page_black_48dp.png"
borderstyle borderstyle = styleraised!
end type

event clicked;parent.event ue_final( )
end event

type p_anterior from picture within uo_desplazador_rpt
integer x = 27
integer y = 32
integer width = 155
integer height = 132
integer transparency = 40
string picturename = ".\iconos\1x\baseline_first_page_black_48dp.png"
borderstyle borderstyle = styleraised!
end type

event clicked;parent.event ue_inicio()
end event

type rr_1 from roundrectangle within uo_desplazador_rpt
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

