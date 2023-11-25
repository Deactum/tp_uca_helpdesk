$PBExportHeader$w_abm_base.srw
forward
global type w_abm_base from w_base
end type
type cb_cancelar from btn_cancelar within w_abm_base
end type
type cb_aceptar from btn_aceptar within w_abm_base
end type
type dw_datos from dw_abm within w_abm_base
end type
end forward

global type w_abm_base from w_base
integer width = 2263
integer height = 972
boolean minbox = false
boolean maxbox = false
windowtype windowtype = response!
windowstate windowstate = normal!
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_datos dw_datos
end type
global w_abm_base w_abm_base

on w_abm_base.create
int iCurrent
call super::create
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_datos=create dw_datos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancelar
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.dw_datos
end on

on w_abm_base.destroy
call super::destroy
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_datos)
end on

event open;call super::open;long ll_codigo
string ls_codigo
ls_codigo = message.stringparm
ll_codigo = long(ls_codigo)
if ll_codigo >0 then 
	dw_datos.retrieve( ll_codigo)
elseif len(ls_codigo) > 0 then 
	dw_datos.retrieve(ls_codigo)
end if
end event

type cb_cancelar from btn_cancelar within w_abm_base
integer x = 1426
integer y = 756
integer taborder = 1
end type

type cb_aceptar from btn_aceptar within w_abm_base
integer x = 1824
integer y = 756
integer taborder = 3
end type

event clicked;call super::clicked;if f_validacion(dw_datos) = 1 then return 
if f_grabar(dw_datos) >0 then cb_cancelar.event clicked( )
end event

type dw_datos from dw_abm within w_abm_base
integer y = 44
integer width = 2203
integer height = 688
integer taborder = 2
boolean border = false
end type

