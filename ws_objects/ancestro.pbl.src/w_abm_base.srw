$PBExportHeader$w_abm_base.srw
forward
global type w_abm_base from w_base
end type
type cb_2 from btn_cancelar within w_abm_base
end type
type cb_1 from btn_aceptar within w_abm_base
end type
type dw_1 from dw_abm within w_abm_base
end type
end forward

global type w_abm_base from w_base
integer width = 2263
integer height = 972
boolean minbox = false
boolean maxbox = false
windowtype windowtype = response!
windowstate windowstate = normal!
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_abm_base w_abm_base

on w_abm_base.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_1
end on

on w_abm_base.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_2 from btn_cancelar within w_abm_base
integer x = 1367
integer y = 636
integer taborder = 30
end type

type cb_1 from btn_aceptar within w_abm_base
integer x = 1765
integer y = 636
integer taborder = 20
end type

type dw_1 from dw_abm within w_abm_base
integer y = 44
integer taborder = 10
boolean border = false
end type

