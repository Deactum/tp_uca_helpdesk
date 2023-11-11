$PBExportHeader$dw_abm_clientes.srw
forward
global type dw_abm_clientes from w_abm_base
end type
end forward

global type dw_abm_clientes from w_abm_base
integer width = 2030
integer height = 864
string title = "Clientes"
end type
global dw_abm_clientes dw_abm_clientes

on dw_abm_clientes.create
call super::create
end on

on dw_abm_clientes.destroy
call super::destroy
end on

type cb_2 from w_abm_base`cb_2 within dw_abm_clientes
integer x = 1170
integer y = 632
end type

type cb_1 from w_abm_base`cb_1 within dw_abm_clientes
integer x = 1568
integer y = 632
end type

type dw_datos from w_abm_base`dw_datos within dw_abm_clientes
integer width = 1966
integer height = 580
string dataobject = "dw_abm_clientes"
end type

