$PBExportHeader$tab_employees.sru
forward
global type tab_employees from uo_grilla_base
end type
end forward

global type tab_employees from uo_grilla_base
string is_titulo = "Employees"
string is_abm = "w_abm_employees"
end type
global tab_employees tab_employees

on tab_employees.create
int iCurrent
call super::create
end on

on tab_employees.destroy
call super::destroy
end on

type uo_desp from uo_grilla_base`uo_desp within tab_employees
end type

type uo_control from uo_grilla_base`uo_control within tab_employees
end type

type st_pagina from uo_grilla_base`st_pagina within tab_employees
end type

type uo_1 from uo_grilla_base`uo_1 within tab_employees
end type

type dw_datos from uo_grilla_base`dw_datos within tab_employees
string dataobject = "dw_list_employees"
end type

type st_titulo from uo_grilla_base`st_titulo within tab_employees
end type

