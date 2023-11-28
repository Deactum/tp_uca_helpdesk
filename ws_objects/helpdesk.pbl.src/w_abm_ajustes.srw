$PBExportHeader$w_abm_ajustes.srw
forward
global type w_abm_ajustes from w_abm_base
end type
end forward

global type w_abm_ajustes from w_abm_base
integer width = 2167
end type
global w_abm_ajustes w_abm_ajustes

on w_abm_ajustes.create
call super::create
end on

on w_abm_ajustes.destroy
call super::destroy
end on

type cb_cancelar from w_abm_base`cb_cancelar within w_abm_ajustes
integer x = 1298
integer y = 748
end type

type cb_aceptar from w_abm_base`cb_aceptar within w_abm_ajustes
integer x = 1696
integer y = 748
end type

type dw_datos from w_abm_base`dw_datos within w_abm_ajustes
integer width = 2094
string dataobject = "dw_abm_ajustes"
end type

