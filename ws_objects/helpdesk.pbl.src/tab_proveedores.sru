$PBExportHeader$tab_proveedores.sru
forward
global type tab_proveedores from uo_grilla_base
end type
end forward

global type tab_proveedores from uo_grilla_base
string is_titulo = "Proveedores"
string is_abm = "w_abm_proveedores"
end type
global tab_proveedores tab_proveedores

on tab_proveedores.create
int iCurrent
call super::create
end on

on tab_proveedores.destroy
call super::destroy
end on

type uo_desp from uo_grilla_base`uo_desp within tab_proveedores
end type

type uo_control from uo_grilla_base`uo_control within tab_proveedores
end type

type st_pagina from uo_grilla_base`st_pagina within tab_proveedores
end type

type uo_1 from uo_grilla_base`uo_1 within tab_proveedores
end type

type dw_datos from uo_grilla_base`dw_datos within tab_proveedores
string dataobject = "dw_list_proveedores"
end type

type st_titulo from uo_grilla_base`st_titulo within tab_proveedores
end type

