$PBExportHeader$tab_inicio.sru
forward
global type tab_inicio from uo_tab
end type
type dw_3 from datawindow within tab_inicio
end type
type dw_2 from datawindow within tab_inicio
end type
type wb_2 from n_webbrowser within tab_inicio
end type
type wb_1 from n_webbrowser within tab_inicio
end type
type dw_1 from datawindow within tab_inicio
end type
end forward

global type tab_inicio from uo_tab
integer width = 4096
integer height = 2120
string text = "Inicio"
string picturename = ".\iconos\1x\baseline_home_black_18dp.png"
dw_3 dw_3
dw_2 dw_2
wb_2 wb_2
wb_1 wb_1
dw_1 dw_1
end type
global tab_inicio tab_inicio

on tab_inicio.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_2=create dw_2
this.wb_2=create wb_2
this.wb_1=create wb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_2
this.Control[iCurrent+3]=this.wb_2
this.Control[iCurrent+4]=this.wb_1
this.Control[iCurrent+5]=this.dw_1
end on

on tab_inicio.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.wb_2)
destroy(this.wb_1)
destroy(this.dw_1)
end on

type dw_3 from datawindow within tab_inicio
integer x = 1723
integer y = 120
integer width = 846
integer height = 384
integer taborder = 10
string title = "none"
string dataobject = "dw_tarjeta_ejemplo"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.insertrow(0)
end event

type dw_2 from datawindow within tab_inicio
integer x = 859
integer y = 120
integer width = 846
integer height = 384
integer taborder = 10
string title = "none"
string dataobject = "dw_tarjeta_ejemplo"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.insertrow( 0)
end event

type wb_2 from n_webbrowser within tab_inicio
integer x = 2039
integer y = 580
integer width = 2034
integer height = 1176
string is_style = "gauge"
string is_title = ""
boolean ib_toolbox = false
long il_width = 200
long il_height = 200
end type

type wb_1 from n_webbrowser within tab_inicio
integer y = 580
integer width = 2034
integer height = 1176
string is_title = ""
boolean ib_toolbox = false
long il_width = 200
long il_height = 200
end type

type dw_1 from datawindow within tab_inicio
integer y = 120
integer width = 846
integer height = 384
integer taborder = 10
string title = "none"
string dataobject = "dw_tarjeta_ejemplo"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.insertrow( 0)
end event

