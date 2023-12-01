$PBExportHeader$tab_componentes.sru
forward
global type tab_componentes from uo_grilla_base
end type
end forward

global type tab_componentes from uo_grilla_base
integer width = 4174
string is_titulo = "Componentes"
string is_abm = "w_abm_componentes"
end type
global tab_componentes tab_componentes

on tab_componentes.create
int iCurrent
call super::create
end on

on tab_componentes.destroy
call super::destroy
end on

type uo_desp from uo_grilla_base`uo_desp within tab_componentes
end type

type uo_control from uo_grilla_base`uo_control within tab_componentes
end type

type st_pagina from uo_grilla_base`st_pagina within tab_componentes
end type

type uo_1 from uo_grilla_base`uo_1 within tab_componentes
end type

type dw_datos from uo_grilla_base`dw_datos within tab_componentes
integer width = 4137
string dataobject = "dw_list_componentes"
end type

type st_titulo from uo_grilla_base`st_titulo within tab_componentes
end type

