$PBExportHeader$tab_rpt_problemas.sru
forward
global type tab_rpt_problemas from uo_reporte_base
end type
end forward

global type tab_rpt_problemas from uo_reporte_base
integer width = 3474
string is_titulo = "Problemas más comunes"
end type
global tab_rpt_problemas tab_rpt_problemas

on tab_rpt_problemas.create
int iCurrent
call super::create
end on

on tab_rpt_problemas.destroy
call super::destroy
end on

type uo_2 from uo_reporte_base`uo_2 within tab_rpt_problemas
end type

type uo_1 from uo_reporte_base`uo_1 within tab_rpt_problemas
end type

event uo_1::ue_click_actualizar;// Ancestro anuldo
date ld_fecha_ini ,ld_fecha_fin
em_1.getdata(ld_fecha_ini)
em_2.getdata(ld_fecha_fin)
dw_datos.retrieve( datetime(ld_fecha_ini), datetime(ld_fecha_fin))
end event

type dw_datos from uo_reporte_base`dw_datos within tab_rpt_problemas
integer width = 3447
string dataobject = "dw_rpt_problemas"
end type

type em_2 from uo_reporte_base`em_2 within tab_rpt_problemas
end type

type em_1 from uo_reporte_base`em_1 within tab_rpt_problemas
end type

type st_2 from uo_reporte_base`st_2 within tab_rpt_problemas
end type

type st_1 from uo_reporte_base`st_1 within tab_rpt_problemas
end type

type st_titulo from uo_reporte_base`st_titulo within tab_rpt_problemas
integer width = 2688
end type

