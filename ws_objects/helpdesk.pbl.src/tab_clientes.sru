$PBExportHeader$tab_clientes.sru
forward
global type tab_clientes from uo_grilla_base
end type
end forward

global type tab_clientes from uo_grilla_base
string is_titulo = "Clientes"
string is_abm = "w_abm_clientes"
end type
global tab_clientes tab_clientes

on tab_clientes.create
int iCurrent
call super::create
end on

on tab_clientes.destroy
call super::destroy
end on

type uo_desp from uo_grilla_base`uo_desp within tab_clientes
end type

type uo_control from uo_grilla_base`uo_control within tab_clientes
end type

type st_pagina from uo_grilla_base`st_pagina within tab_clientes
end type

type uo_1 from uo_grilla_base`uo_1 within tab_clientes
end type

type dw_datos from uo_grilla_base`dw_datos within tab_clientes
string dataobject = "dw_list_clientes"
end type

type st_titulo from uo_grilla_base`st_titulo within tab_clientes
end type

