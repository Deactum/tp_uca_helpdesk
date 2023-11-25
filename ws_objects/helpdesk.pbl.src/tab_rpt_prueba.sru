$PBExportHeader$tab_rpt_prueba.sru
forward
global type tab_rpt_prueba from uo_reporte_base
end type
end forward

global type tab_rpt_prueba from uo_reporte_base
string is_titulo = "Reporte de Prueba"
end type
global tab_rpt_prueba tab_rpt_prueba

on tab_rpt_prueba.create
int iCurrent
call super::create
end on

on tab_rpt_prueba.destroy
call super::destroy
end on

type uo_2 from uo_reporte_base`uo_2 within tab_rpt_prueba
end type

type uo_1 from uo_reporte_base`uo_1 within tab_rpt_prueba
end type

type dw_datos from uo_reporte_base`dw_datos within tab_rpt_prueba
string dataobject = "dw_rpt_prueba"
end type

type em_2 from uo_reporte_base`em_2 within tab_rpt_prueba
end type

type em_1 from uo_reporte_base`em_1 within tab_rpt_prueba
end type

type st_2 from uo_reporte_base`st_2 within tab_rpt_prueba
end type

type st_1 from uo_reporte_base`st_1 within tab_rpt_prueba
end type

type st_titulo from uo_reporte_base`st_titulo within tab_rpt_prueba
end type

