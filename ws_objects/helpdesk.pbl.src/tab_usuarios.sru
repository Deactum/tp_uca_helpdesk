$PBExportHeader$tab_usuarios.sru
forward
global type tab_usuarios from uo_grilla_base
end type
end forward

global type tab_usuarios from uo_grilla_base
string is_titulo = "Usuarios"
string is_abm = "w_abm_usuarios"
end type
global tab_usuarios tab_usuarios

on tab_usuarios.create
int iCurrent
call super::create
end on

on tab_usuarios.destroy
call super::destroy
end on

type uo_desp from uo_grilla_base`uo_desp within tab_usuarios
end type

type uo_control from uo_grilla_base`uo_control within tab_usuarios
end type

type st_pagina from uo_grilla_base`st_pagina within tab_usuarios
end type

type uo_1 from uo_grilla_base`uo_1 within tab_usuarios
end type

type dw_datos from uo_grilla_base`dw_datos within tab_usuarios
string dataobject = "dw_list_usuarios"
end type

type st_titulo from uo_grilla_base`st_titulo within tab_usuarios
end type

