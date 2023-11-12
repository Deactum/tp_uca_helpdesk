$PBExportHeader$tab_inicio.sru
forward
global type tab_inicio from uo_tab
end type
type uo_1 from tarjet_concretados within tab_inicio
end type
type dw_1 from dw_list within tab_inicio
end type
type wb_1 from n_webbrowser within tab_inicio
end type
type uo_pendientes from tarjet_pendientes within tab_inicio
end type
end forward

global type tab_inicio from uo_tab
integer width = 4096
integer height = 2324
string text = "Inicio"
string picturename = ".\iconos\1x\baseline_home_black_18dp.png"
uo_1 uo_1
dw_1 dw_1
wb_1 wb_1
uo_pendientes uo_pendientes
end type
global tab_inicio tab_inicio

on tab_inicio.create
int iCurrent
call super::create
this.uo_1=create uo_1
this.dw_1=create dw_1
this.wb_1=create wb_1
this.uo_pendientes=create uo_pendientes
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_1
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.wb_1
this.Control[iCurrent+4]=this.uo_pendientes
end on

on tab_inicio.destroy
call super::destroy
destroy(this.uo_1)
destroy(this.dw_1)
destroy(this.wb_1)
destroy(this.uo_pendientes)
end on

event ue_resize;call super::ue_resize;dw_1.width =  this.width
dw_1.height =  this.height - dw_1.y 
end event

type uo_1 from tarjet_concretados within tab_inicio
integer x = 1399
integer taborder = 30
end type

on uo_1.destroy
call tarjet_concretados::destroy
end on

type dw_1 from dw_list within tab_inicio
integer y = 1348
integer width = 1806
integer height = 856
integer taborder = 20
string dataobject = "dw_dsb_estados_rep"
end type

type wb_1 from n_webbrowser within tab_inicio
integer y = 392
integer width = 2784
string is_style = "area"
long il_width = 200
long il_height = 200
end type

type uo_pendientes from tarjet_pendientes within tab_inicio
integer taborder = 20
end type

on uo_pendientes.destroy
call tarjet_pendientes::destroy
end on

