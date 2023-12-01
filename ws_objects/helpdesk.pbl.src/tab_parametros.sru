$PBExportHeader$tab_parametros.sru
forward
global type tab_parametros from uo_grilla_base
end type
end forward

global type tab_parametros from uo_grilla_base
integer width = 3712
string is_titulo = "Parámetros"
string is_abm = "w_abm_parametros"
end type
global tab_parametros tab_parametros

on tab_parametros.create
int iCurrent
call super::create
end on

on tab_parametros.destroy
call super::destroy
end on

type uo_desp from uo_grilla_base`uo_desp within tab_parametros
end type

type uo_control from uo_grilla_base`uo_control within tab_parametros
end type

type st_pagina from uo_grilla_base`st_pagina within tab_parametros
end type

type uo_1 from uo_grilla_base`uo_1 within tab_parametros
end type

type dw_datos from uo_grilla_base`dw_datos within tab_parametros
integer width = 3685
string dataobject = "dw_list_parametros"
end type

type st_titulo from uo_grilla_base`st_titulo within tab_parametros
end type

