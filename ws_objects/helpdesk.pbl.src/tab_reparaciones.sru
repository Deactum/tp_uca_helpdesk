$PBExportHeader$tab_reparaciones.sru
forward
global type tab_reparaciones from uo_grilla_base
end type
end forward

global type tab_reparaciones from uo_grilla_base
string is_titulo = "Reparaciones"
string is_abm = "w_abm_reparaciones_v2"
end type
global tab_reparaciones tab_reparaciones

on tab_reparaciones.create
int iCurrent
call super::create
end on

on tab_reparaciones.destroy
call super::destroy
end on

type uo_desp from uo_grilla_base`uo_desp within tab_reparaciones
end type

type uo_control from uo_grilla_base`uo_control within tab_reparaciones
end type

event uo_control::ue_actualizar;// Ancestro anulado

string ls_busquda, ls_has_arg

ls_has_arg = 'yes'

if gb_tecnico_supervisor then ls_has_arg = 'no'

dw_datos.retrieve(get_pagina(), get_registros(), get_busqueda(), gs_usu_codigo, ls_has_arg)
of_mensaje_paginacion()

end event

event uo_control::ue_editar;// Ancestro anulado
string ls_parm
window w_to_open

ls_parm = string(f_datatype(dw_datos,1)) +','+ 'yes'

try 
	openwithparm(w_to_open, ls_parm,is_abm)
	this.event ue_actualizar( )
catch (runtimeerror e)
	messagebox('Error',e.getmessage() )
end try

end event

type st_pagina from uo_grilla_base`st_pagina within tab_reparaciones
end type

type uo_1 from uo_grilla_base`uo_1 within tab_reparaciones
end type

type dw_datos from uo_grilla_base`dw_datos within tab_reparaciones
string title = "Reparaciones"
string dataobject = "dw_list_reparaciones"
end type

event dw_datos::constructor;call super::constructor;This.SetFilter("estado<>'Finalizado'")
THis.Filter()
end event

type st_titulo from uo_grilla_base`st_titulo within tab_reparaciones
end type

