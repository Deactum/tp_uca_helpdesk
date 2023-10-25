$PBExportHeader$tab_orders.sru
forward
global type tab_orders from uo_grilla_base
end type
end forward

global type tab_orders from uo_grilla_base
string is_titulo = "Orders"
string is_abm = "w_abm_orders"
end type
global tab_orders tab_orders

on tab_orders.create
int iCurrent
call super::create
end on

on tab_orders.destroy
call super::destroy
end on

type uo_desp from uo_grilla_base`uo_desp within tab_orders
end type

type uo_control from uo_grilla_base`uo_control within tab_orders
end type

type st_pagina from uo_grilla_base`st_pagina within tab_orders
end type

type uo_1 from uo_grilla_base`uo_1 within tab_orders
end type

type dw_datos from uo_grilla_base`dw_datos within tab_orders
string dataobject = "dw_orders"
end type

type st_titulo from uo_grilla_base`st_titulo within tab_orders
end type

