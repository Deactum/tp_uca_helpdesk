$PBExportHeader$w_abm_proveedores.srw
forward
global type w_abm_proveedores from w_abm_base
end type
end forward

global type w_abm_proveedores from w_abm_base
integer width = 1742
integer height = 788
end type
global w_abm_proveedores w_abm_proveedores

on w_abm_proveedores.create
call super::create
end on

on w_abm_proveedores.destroy
call super::destroy
end on

type cb_cancelar from w_abm_base`cb_cancelar within w_abm_proveedores
integer x = 823
integer y = 520
end type

type cb_aceptar from w_abm_base`cb_aceptar within w_abm_proveedores
integer x = 1221
integer y = 520
end type

type dw_datos from w_abm_base`dw_datos within w_abm_proveedores
integer width = 1623
integer height = 468
string dataobject = "dw_abm_proveedores"
end type

