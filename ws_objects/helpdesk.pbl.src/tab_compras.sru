$PBExportHeader$tab_compras.sru
forward
global type tab_compras from uo_grilla_base
end type
end forward

global type tab_compras from uo_grilla_base
string is_titulo = "Compras"
string is_abm = "w_abm_compras"
end type
global tab_compras tab_compras

on tab_compras.create
int iCurrent
call super::create
end on

on tab_compras.destroy
call super::destroy
end on

type uo_desp from uo_grilla_base`uo_desp within tab_compras
end type

type uo_control from uo_grilla_base`uo_control within tab_compras
end type

type st_pagina from uo_grilla_base`st_pagina within tab_compras
end type

type uo_1 from uo_grilla_base`uo_1 within tab_compras
end type

type dw_datos from uo_grilla_base`dw_datos within tab_compras
string dataobject = "dw_list_compras"
end type

type st_titulo from uo_grilla_base`st_titulo within tab_compras
end type

