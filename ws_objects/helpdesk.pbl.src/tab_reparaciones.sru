$PBExportHeader$tab_reparaciones.sru
forward
global type tab_reparaciones from uo_grilla_base
end type
end forward

global type tab_reparaciones from uo_grilla_base
string is_titulo = "Reparaciones"
string is_abm = "w_abm_reparaciones"
end type
global tab_reparaciones tab_reparaciones

on tab_reparaciones.create
int iCurrent
call super::create
end on

on tab_reparaciones.destroy
call super::destroy
end on

type uo_desp from uo_grilla_base`uo_desp within tab_reparaciones
end type

type uo_control from uo_grilla_base`uo_control within tab_reparaciones
end type

type st_pagina from uo_grilla_base`st_pagina within tab_reparaciones
end type

type uo_1 from uo_grilla_base`uo_1 within tab_reparaciones
end type

type dw_datos from uo_grilla_base`dw_datos within tab_reparaciones
string title = "Reparaciones"
string dataobject = "dw_list_reparaciones"
end type

type st_titulo from uo_grilla_base`st_titulo within tab_reparaciones
end type

