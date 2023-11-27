$PBExportHeader$w_abm_reparaciones.srw
forward
global type w_abm_reparaciones from w_abm_base
end type
end forward

global type w_abm_reparaciones from w_abm_base
integer width = 3049
integer height = 1316
end type
global w_abm_reparaciones w_abm_reparaciones

on w_abm_reparaciones.create
call super::create
end on

on w_abm_reparaciones.destroy
call super::destroy
end on

type cb_cancelar from w_abm_base`cb_cancelar within w_abm_reparaciones
integer x = 2203
integer y = 1064
end type

type cb_aceptar  from w_abm_base`cb_aceptar  within w_abm_reparaciones
integer x = 2601
integer y = 1064
end type

type dw_datos from w_abm_base`dw_datos within w_abm_reparaciones
integer width = 2999
integer height = 1012
string dataobject = "dw_abm_reparaciones"
end type

