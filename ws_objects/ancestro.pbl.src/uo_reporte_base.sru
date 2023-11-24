$PBExportHeader$uo_reporte_base.sru
forward
global type uo_reporte_base from uo_tab
end type
type uo_2 from uo_desplazador within uo_reporte_base
end type
type uo_1 from uo_contrloles_rpt within uo_reporte_base
end type
type dw_datos from datawindow within uo_reporte_base
end type
type em_2 from editmask within uo_reporte_base
end type
type em_1 from editmask within uo_reporte_base
end type
type st_2 from statictext within uo_reporte_base
end type
type st_1 from statictext within uo_reporte_base
end type
type st_titulo from statictext within uo_reporte_base
end type
end forward

global type uo_reporte_base from uo_tab
integer width = 2670
integer height = 2620
uo_2 uo_2
uo_1 uo_1
dw_datos dw_datos
em_2 em_2
em_1 em_1
st_2 st_2
st_1 st_1
st_titulo st_titulo
end type
global uo_reporte_base uo_reporte_base

type variables
string is_titulo = 'Título Del Reporte'
end variables
on uo_reporte_base.create
int iCurrent
call super::create
this.uo_2=create uo_2
this.uo_1=create uo_1
this.dw_datos=create dw_datos
this.em_2=create em_2
this.em_1=create em_1
this.st_2=create st_2
this.st_1=create st_1
this.st_titulo=create st_titulo
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_2
this.Control[iCurrent+2]=this.uo_1
this.Control[iCurrent+3]=this.dw_datos
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.em_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.st_titulo
end on

on uo_reporte_base.destroy
call super::destroy
destroy(this.uo_2)
destroy(this.uo_1)
destroy(this.dw_datos)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_titulo)
end on

event ue_init;call super::ue_init;st_titulo.text = is_titulo
end event

event ue_resize;call super::ue_resize;uo_1.x =  this.width  - uo_1.width
uo_2.x =  this.width  - uo_2.width
uo_2.y = this.height - uo_2.height -200
dw_datos.width = this.width - 10
dw_datos.height = this.height - uo_2.height - dw_datos.y -200
end event

type uo_2 from uo_desplazador within uo_reporte_base
integer x = 1943
integer y = 2420
integer taborder = 40
end type

on uo_2.destroy
call uo_desplazador::destroy
end on

event ue_siguiente;call super::ue_siguiente;dw_datos.scrollnextpage( )
end event

event ue_anterior;call super::ue_anterior;dw_datos.scrollpriorpage( )
end event

event constructor;call super::constructor;this.st_1.visible =  false
end event

type uo_1 from uo_contrloles_rpt within uo_reporte_base
integer x = 1765
integer taborder = 10
end type

on uo_1.destroy
call uo_contrloles_rpt::destroy
end on

event ue_click_imprimir;call super::ue_click_imprimir;messagebox('','imprimir')
end event

type dw_datos from datawindow within uo_reporte_base
integer y = 392
integer width = 2638
integer height = 2016
integer taborder = 30
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type em_2 from editmask within uo_reporte_base
integer x = 389
integer y = 276
integer width = 581
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean dropdowncalendar = true
end type

type em_1 from editmask within uo_reporte_base
integer x = 389
integer y = 168
integer width = 581
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean dropdowncalendar = true
end type

type st_2 from statictext within uo_reporte_base
integer x = 73
integer y = 272
integer width = 283
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha fin:"
boolean focusrectangle = false
end type

type st_1 from statictext within uo_reporte_base
integer y = 180
integer width = 357
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha inicio:"
boolean focusrectangle = false
end type

type st_titulo from statictext within uo_reporte_base
integer x = 9
integer y = 24
integer width = 1047
integer height = 132
integer textsize = -20
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Título"
boolean focusrectangle = false
end type

