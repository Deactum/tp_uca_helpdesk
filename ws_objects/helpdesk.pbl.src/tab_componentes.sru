$PBExportHeader$tab_componentes.sru
forward
global type tab_componentes from uo_grilla_base
end type
type p_imprimir from picture within tab_componentes
end type
end forward

global type tab_componentes from uo_grilla_base
integer width = 4174
string is_titulo = "Componentes"
string is_abm = "w_abm_componentes"
p_imprimir p_imprimir
end type
global tab_componentes tab_componentes

on tab_componentes.create
int iCurrent
call super::create
this.p_imprimir=create p_imprimir
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_imprimir
end on

on tab_componentes.destroy
call super::destroy
destroy(this.p_imprimir)
end on

event ue_size;call super::ue_size;p_imprimir.x =  uo_control.x - p_imprimir.width
end event

type uo_desp from uo_grilla_base`uo_desp within tab_componentes
end type

type uo_control from uo_grilla_base`uo_control within tab_componentes
end type

type st_pagina from uo_grilla_base`st_pagina within tab_componentes
end type

type uo_1 from uo_grilla_base`uo_1 within tab_componentes
end type

type dw_datos from uo_grilla_base`dw_datos within tab_componentes
integer width = 4137
string dataobject = "dw_list_componentes"
end type

type st_titulo from uo_grilla_base`st_titulo within tab_componentes
end type

type p_imprimir from picture within tab_componentes
integer x = 2523
integer y = 4
integer width = 219
integer height = 192
boolean bringtotop = true
integer transparency = 40
string picturename = "C:\Users\PC\Documents\GitHub\tp_uca_helpdesk\iconos\1x\baseline_print_black_48dp.png"
string powertiptext = "Imprimir"
end type

event clicked;openwithparm(w_imprimir, dw_datos)
If Message.DoubleParm = -1 Then Return
dw_datos.Print(True)
end event

