$PBExportHeader$w_abm_ajustes.srw
forward
global type w_abm_ajustes from w_abm_base
end type
end forward

global type w_abm_ajustes from w_abm_base
integer width = 2158
string title = "Ajustes"
end type
global w_abm_ajustes w_abm_ajustes

on w_abm_ajustes.create
call super::create
end on

on w_abm_ajustes.destroy
call super::destroy
end on

event open;//ancestro anulado
long ll_componente
string ls_usuario
datetime ld_fecha
long ll_cantidad
st_ajustes st_datos
st_datos =  message.powerobjectparm


if st_datos.b_editar  then
	ll_componente = st_datos.l_componente
 	ls_usuario= st_datos.s_usuario
 	ld_fecha = st_datos.d_fecha
 	ll_cantidad =  st_datos.l_cantidad
	dw_datos.retrieve(ll_componente,ls_usuario,ld_fecha,ll_cantidad)
else 
	dw_datos.setitem( 1,'usuarios_codigo',gs_usuario)
end if

end event

type cb_cancelar from w_abm_base`cb_cancelar within w_abm_ajustes
integer x = 1298
integer y = 748
end type

type cb_aceptar from w_abm_base`cb_aceptar within w_abm_ajustes
integer x = 1696
integer y = 748
end type

type dw_datos from w_abm_base`dw_datos within w_abm_ajustes
integer width = 2094
string dataobject = "dw_abm_ajustes"
end type

