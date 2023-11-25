$PBExportHeader$w_abm_cyd_base.srw
forward
global type w_abm_cyd_base from w_base
end type
type cb_2 from btn_cancelar within w_abm_cyd_base
end type
type cb_1 from btn_aceptar within w_abm_cyd_base
end type
type dw_detalle from dw_list within w_abm_cyd_base
end type
type dw_cabecera from dw_abm within w_abm_cyd_base
end type
end forward

global type w_abm_cyd_base from w_base
integer width = 2222
integer height = 2456
cb_2 cb_2
cb_1 cb_1
dw_detalle dw_detalle
dw_cabecera dw_cabecera
end type
global w_abm_cyd_base w_abm_cyd_base

on w_abm_cyd_base.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_detalle=create dw_detalle
this.dw_cabecera=create dw_cabecera
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_detalle
this.Control[iCurrent+4]=this.dw_cabecera
end on

on w_abm_cyd_base.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_detalle)
destroy(this.dw_cabecera)
end on

type cb_2 from btn_cancelar within w_abm_cyd_base
integer x = 1376
integer y = 2208
integer taborder = 30
end type

type cb_1 from btn_aceptar within w_abm_cyd_base
integer x = 1774
integer y = 2208
integer taborder = 30
end type

event clicked;call super::clicked;f_grabar_cabecera_detalle(dw_cabecera,dw_detalle)
end event

type dw_detalle from dw_list within w_abm_cyd_base
integer y = 592
integer width = 2181
integer taborder = 20
end type

event constructor;call super::constructor;this.insertrow(0)
end event

type dw_cabecera from dw_abm within w_abm_cyd_base
integer taborder = 10
end type

