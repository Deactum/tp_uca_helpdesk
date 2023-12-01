$PBExportHeader$w_abm_parametros.srw
forward
global type w_abm_parametros from w_abm_base
end type
end forward

global type w_abm_parametros from w_abm_base
integer width = 2130
integer height = 632
end type
global w_abm_parametros w_abm_parametros

on w_abm_parametros.create
call super::create
end on

on w_abm_parametros.destroy
call super::destroy
end on

type cb_cancelar from w_abm_base`cb_cancelar within w_abm_parametros
integer x = 1266
integer y = 388
end type

type cb_aceptar from w_abm_base`cb_aceptar within w_abm_parametros
integer x = 1664
integer y = 388
end type

type dw_datos from w_abm_base`dw_datos within w_abm_parametros
integer x = 37
integer y = 20
integer width = 2030
integer height = 348
string dataobject = "dw_abm_parametros"
end type

