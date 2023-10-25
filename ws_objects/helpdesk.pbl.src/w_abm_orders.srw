$PBExportHeader$w_abm_orders.srw
forward
global type w_abm_orders from w_abm_base
end type
end forward

global type w_abm_orders from w_abm_base
string title = "ABM Orders"
end type
global w_abm_orders w_abm_orders

on w_abm_orders.create
call super::create
end on

on w_abm_orders.destroy
call super::destroy
end on

type cb_2 from w_abm_base`cb_2 within w_abm_orders
end type

type cb_1 from w_abm_base`cb_1 within w_abm_orders
end type

type dw_1 from w_abm_base`dw_datos within w_abm_orders
end type

