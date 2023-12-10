$PBExportHeader$w_abm_componentes.srw
forward
global type w_abm_componentes from w_abm_base
end type
end forward

global type w_abm_componentes from w_abm_base
integer width = 2171
integer height = 876
string title = "Componentes"
end type
global w_abm_componentes w_abm_componentes

on w_abm_componentes.create
call super::create
end on

on w_abm_componentes.destroy
call super::destroy
end on

event open;// Ancestro anulado
long ll_codigo
string ls_codigo, ls_cargo

ls_codigo = message.stringparm
ll_codigo = long(ls_codigo)

if gb_gerente then ls_cargo = 'GG'

if ll_codigo >0 then 
	dw_datos.retrieve( ll_codigo, ls_cargo)
	
elseif len(ls_codigo) > 0 then 
	dw_datos.retrieve(ls_codigo, ls_cargo)
	
end if

end event

type cb_cancelar from w_abm_base`cb_cancelar within w_abm_componentes
integer x = 1289
integer y = 640
end type

type cb_aceptar from w_abm_base`cb_aceptar within w_abm_componentes
integer x = 1687
integer y = 640
end type

type dw_datos from w_abm_base`dw_datos within w_abm_componentes
integer x = 37
integer y = 28
integer width = 2057
integer height = 592
string dataobject = "dw_abm_componentes"
end type

