$PBExportHeader$uo_tarjet_base.sru
forward
global type uo_tarjet_base from userobject
end type
type st_2 from statictext within uo_tarjet_base
end type
type st_1 from statictext within uo_tarjet_base
end type
type p_1 from picture within uo_tarjet_base
end type
end forward

global type uo_tarjet_base from userobject
integer width = 1367
integer height = 380
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_init ( )
st_2 st_2
st_1 st_1
p_1 p_1
end type
global uo_tarjet_base uo_tarjet_base

forward prototypes
public subroutine of_refresh ()
end prototypes

event ue_init();of_refresh()
end event

public subroutine of_refresh ();
end subroutine

on uo_tarjet_base.create
this.st_2=create st_2
this.st_1=create st_1
this.p_1=create p_1
this.Control[]={this.st_2,&
this.st_1,&
this.p_1}
end on

on uo_tarjet_base.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.p_1)
end on

event constructor;post event ue_init()
end event

type st_2 from statictext within uo_tarjet_base
integer x = 663
integer y = 156
integer width = 457
integer height = 112
integer textsize = -15
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "20"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within uo_tarjet_base
integer x = 416
integer width = 955
integer height = 100
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Titulo"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_1 from picture within uo_tarjet_base
integer width = 439
integer height = 384
string picturename = ".\iconos\2x\baseline_person_white_48dp.png"
boolean focusrectangle = false
end type

