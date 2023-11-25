$PBExportHeader$uo_barra_superior.sru
forward
global type uo_barra_superior from userobject
end type
type p_2 from picture within uo_barra_superior
end type
type st_1 from statictext within uo_barra_superior
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
event ue_size pbm_size
event ue_reciente ( )
p_2 p_2
st_1 st_1
p_1 p_1
end type
global uo_barra_superior uo_barra_superior

event ue_size;p_2.x = this.width - p_2.width -100
end event

on uo_barra_superior.create
this.p_2=create p_2
this.st_1=create st_1
this.p_1=create p_1
this.Control[]={this.p_2,&
this.st_1,&
this.p_1}
end on

on uo_barra_superior.destroy
destroy(this.p_2)
destroy(this.st_1)
destroy(this.p_1)
end on

type p_2 from picture within uo_barra_superior
integer x = 3570
integer y = 80
integer width = 155
integer height = 128
string picturename = ".\iconos\1x\baseline_schedule_white_48dp.png"
boolean focusrectangle = false
string powertiptext = "Recientes"
end type

event clicked;event ue_reciente()
end event

type st_1 from statictext within uo_barra_superior
integer y = 24
integer width = 901
integer height = 164
integer textsize = -22
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Bahnschrift Condensed"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nippon America"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_1 from picture within uo_barra_superior
integer x = 887
integer y = 4
integer width = 219
integer height = 192
boolean originalsize = true
string picturename = ".\iconos\1x\baseline_menu_white_48dp.png"
boolean focusrectangle = false
end type

event clicked;parent.event ue_clicked()
end event

