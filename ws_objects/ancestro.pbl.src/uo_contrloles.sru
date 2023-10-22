$PBExportHeader$uo_contrloles.sru
forward
global type uo_contrloles from userobject
end type
type pb_4 from picturebutton within uo_contrloles
end type
type pb_3 from picturebutton within uo_contrloles
end type
type pb_2 from picturebutton within uo_contrloles
end type
type pb_1 from picturebutton within uo_contrloles
end type
end forward

global type uo_contrloles from userobject
integer width = 763
integer height = 176
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_actualizar ( )
event ue_nuevo ( )
event ue_salir ( )
event ue_editar ( )
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
end type
global uo_contrloles uo_contrloles

on uo_contrloles.create
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.Control[]={this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1}
end on

on uo_contrloles.destroy
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
end on

type pb_4 from picturebutton within uo_contrloles
integer x = 375
integer width = 197
integer height = 176
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = ".\iconos\1x\baseline_edit_black_48dp.png"
alignment htextalign = left!
end type

event clicked;parent.event ue_editar()
end event

type pb_3 from picturebutton within uo_contrloles
integer x = 562
integer width = 197
integer height = 176
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = ".\iconos\1x\baseline_logout_black_48dp.png"
alignment htextalign = left!
end type

event clicked;parent.event ue_salir( )
end event

type pb_2 from picturebutton within uo_contrloles
integer x = 187
integer width = 197
integer height = 176
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "D:\Archivos\trabajo practico\dev\iconos\png\plus.png"
alignment htextalign = left!
end type

event clicked;parent.event ue_nuevo( )
end event

type pb_1 from picturebutton within uo_contrloles
integer width = 197
integer height = 176
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = ".\iconos\png\actualizar.png"
alignment htextalign = left!
end type

event clicked;parent.event ue_actualizar( )
end event

