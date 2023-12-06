$PBExportHeader$tab_ajustes.sru
forward
global type tab_ajustes from uo_grilla_base
end type
end forward

global type tab_ajustes from uo_grilla_base
string is_titulo = "Ajustes"
string is_abm = "w_abm_ajustes"
end type
global tab_ajustes tab_ajustes

on tab_ajustes.create
int iCurrent
call super::create
end on

on tab_ajustes.destroy
call super::destroy
end on

type uo_desp from uo_grilla_base`uo_desp within tab_ajustes
end type

type uo_control from uo_grilla_base`uo_control within tab_ajustes
end type

event uo_control::ue_editar;//ancestro anulado
st_ajustes st_datos
long ll_row
any la_codigo
window w_to_open
try 
	ll_row =  dw_datos.getrow( )
	if ll_row <= 0 then return
	st_datos.l_componente =  dw_datos.getitemnumber(ll_row,1)
	st_datos.s_usuario  =  dw_datos.getitemstring(ll_row,2)
	st_datos.d_fecha =  dw_datos.getitemdatetime(ll_row,3)
	st_datos.l_cantidad =  dw_datos.getitemnumber(ll_row,4)
	st_datos.b_editar = true
	openwithparm(w_to_open,st_datos,is_abm)
	this.event ue_actualizar( )
catch (runtimeerror e)
	messagebox('Error',e.getmessage())
end try

end event

event uo_control::ue_nuevo;//ancestro anulado 
st_ajustes st_datos
st_datos.b_editar = false
window w_to_open
try 
	openwithparm(w_to_open,st_datos,is_abm)
	this.event ue_actualizar( )
catch (runtimeerror e)
	messagebox('Error',e.getmessage() )
end try
end event

type st_pagina from uo_grilla_base`st_pagina within tab_ajustes
end type

type uo_1 from uo_grilla_base`uo_1 within tab_ajustes
end type

type dw_datos from uo_grilla_base`dw_datos within tab_ajustes
string dataobject = "dw_list_ajustes"
end type

type st_titulo from uo_grilla_base`st_titulo within tab_ajustes
end type

