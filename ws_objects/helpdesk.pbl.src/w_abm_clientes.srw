$PBExportHeader$w_abm_clientes.srw
forward
global type w_abm_clientes from w_abm_base
end type
end forward

global type w_abm_clientes from w_abm_base
integer width = 2030
integer height = 864
string title = "Clientes"
end type
global w_abm_clientes w_abm_clientes

on w_abm_clientes.create
call super::create
end on

on w_abm_clientes.destroy
call super::destroy
end on

type cb_cancelar from w_abm_base`cb_cancelar within w_abm_clientes
integer x = 1170
integer y = 632
end type

type cb_aceptar from w_abm_base`cb_aceptar within w_abm_clientes
integer x = 1568
integer y = 632
end type

type dw_datos from w_abm_base`dw_datos within w_abm_clientes
integer width = 1966
integer height = 580
string dataobject = "dw_abm_clientes"
end type

