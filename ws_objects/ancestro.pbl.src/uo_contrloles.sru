$PBExportHeader$uo_contrloles.sru
forward
global type uo_contrloles from userobject
end type
type p_4 from picture within uo_contrloles
end type
type p_3 from picture within uo_contrloles
end type
type p_2 from picture within uo_contrloles
end type
type p_1 from picture within uo_contrloles
end type
end forward

global type uo_contrloles from userobject
integer width = 896
integer height = 192
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_actualizar ( )
event ue_nuevo ( )
event ue_salir ( )
event ue_editar ( )
p_4 p_4
p_3 p_3
p_2 p_2
p_1 p_1
end type
global uo_contrloles uo_contrloles

on uo_contrloles.create
this.p_4=create p_4
this.p_3=create p_3
this.p_2=create p_2
this.p_1=create p_1
this.Control[]={this.p_4,&
this.p_3,&
this.p_2,&
this.p_1}
end on

on uo_contrloles.destroy
destroy(this.p_4)
destroy(this.p_3)
destroy(this.p_2)
destroy(this.p_1)
end on

type p_4 from picture within uo_contrloles
integer x = 667
integer width = 219
integer height = 192
integer transparency = 40
string picturename = ".\iconos\1x\baseline_logout_black_48dp.png"
string powertiptext = "Salir"
end type

event clicked;event ue_salir()
end event

type p_3 from picture within uo_contrloles
integer x = 448
integer width = 219
integer height = 192
integer transparency = 40
string picturename = ".\iconos\1x\baseline_edit_black_48dp.png"
string powertiptext = "Editar"
end type

event clicked;event ue_editar()
end event

type p_2 from picture within uo_contrloles
integer x = 224
integer width = 219
integer height = 192
string picturename = ".\iconos\png\plus.png"
string powertiptext = "Nuevo"
end type

event clicked;event ue_nuevo()
end event

type p_1 from picture within uo_contrloles
integer width = 219
integer height = 192
string picturename = ".\iconos\png\actualizar.png"
string powertiptext = "Actualizar"
end type

event clicked;event ue_actualizar()
end event
