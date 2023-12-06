$PBExportHeader$dw_abm_proveedores.srw
forward
global type dw_abm_proveedores from w_abm_base
end type
end forward

global type dw_abm_proveedores from w_abm_base
integer width = 1600
integer height = 704
end type
global dw_abm_proveedores dw_abm_proveedores

on dw_abm_proveedores.create
call super::create
end on

on dw_abm_proveedores.destroy
call super::destroy
end on

event open;//Ancestro anulado
long ll_codigo
string ls_codigo

ls_codigo = message.stringparm
ll_codigo = long(ls_codigo)

if ll_codigo >0 then 
	dw_datos.retrieve( ll_codigo)
elseif len(ls_codigo) > 0 then 
	dw_datos.retrieve(ls_codigo)
end if
end event

type cb_cancelar from w_abm_base`cb_cancelar within dw_abm_proveedores
integer x = 745
integer y = 472
end type

event cb_cancelar::clicked;// Ancestro anulado
CloseWithReturn(parent, -1)
end event

type cb_aceptar from w_abm_base`cb_aceptar within dw_abm_proveedores
integer x = 1143
integer y = 472
end type

event cb_aceptar::clicked;// Ancestro anulado
if f_validacion(dw_datos) = 1 then return 
if f_grabar(dw_datos) >0 then CloseWithReturn(parent, 0)

end event

type dw_datos from w_abm_base`dw_datos within dw_abm_proveedores
integer y = 0
integer width = 1545
integer height = 452
string dataobject = "dw_abm_proveedores"
end type

