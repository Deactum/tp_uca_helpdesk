$PBExportHeader$w_abm_employees.srw
forward
global type w_abm_employees from w_abm_base
end type
end forward

global type w_abm_employees from w_abm_base
integer width = 4073
integer height = 1700
end type
global w_abm_employees w_abm_employees

on w_abm_employees.create
call super::create
end on

on w_abm_employees.destroy
call super::destroy
end on

type cb_2 from w_abm_base`cb_2 within w_abm_employees
integer x = 3616
integer y = 1476
end type

type cb_1 from w_abm_base`cb_1 within w_abm_employees
integer x = 3209
integer y = 1476
end type

type dw_datos from w_abm_base`dw_datos within w_abm_employees
integer y = 48
integer width = 4018
integer height = 1420
string dataobject = "dw_abm_employeew"
end type

