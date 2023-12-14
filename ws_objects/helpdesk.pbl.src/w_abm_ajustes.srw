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
	dw_datos.setitem( 1,'usuarios_codigo',gs_usu_codigo)
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

event cb_aceptar::clicked;// ancestro anulado
string ls_obs
long ll_cantidad, ll_comp
boolean lbool_grabar = true

f_cantidad_componetes ()

ls_obs = dw_datos.getitemstring(1, 'ajustes_observacion')
ll_cantidad = dw_datos.getitemNumber(1, 'ajustes_cantidad')
ll_comp = dw_datos.getitemNumber(1, 'componentes_codigo')

if trim(ls_obs, true) = '' or isNull(ls_obs) then
	dw_datos.Modify("ajustes_observacion.Background.Mode='0~tIf(getrow()=currentrow(),0,1)'")
	dw_datos.Modify("ajustes_observacion.Background.Color='0~tIf(isnull(ajustes_observacion),RGB(255, 179, 179),rgb(255,255,255))'")
	lbool_grabar = false
end if  

if ll_cantidad = 0 or isNull(ll_cantidad) then
	dw_datos.Modify("ajustes_cantidad.Background.Mode='0~tIf(getrow()=currentrow(),0,1)'")
	dw_datos.Modify("ajustes_cantidad.Background.Color='0~tIf(isnull(ajustes_cantidad),RGB(255, 179, 179),rgb(255,255,255))'")
	lbool_grabar = false
end if  

if ll_comp = 0 or isNull(ll_comp) then
	dw_datos.Modify("componentes_codigo.Background.Mode='0~tIf(getrow()=currentrow(),0,1)'")
	dw_datos.Modify("componentes_codigo.Background.Color='0~tIf(isnull(componentes_codigo),RGB(255, 179, 179),rgb(255,255,255))'")
	lbool_grabar = false
end if 

if lbool_grabar then
	if f_grabar(dw_datos) >0 then cb_cancelar.event clicked( )
	
end if

end event

type dw_datos from w_abm_base`dw_datos within w_abm_ajustes
integer width = 2094
string dataobject = "dw_abm_ajustes"
end type

event dw_datos::constructor;call super::constructor;DatawindowChild ldwC_componentes
long ll_inserted

this.GetChild('componentes_codigo', ldwC_componentes)
ldwC_componentes.SetTransObject(SQLCA)

if ldwC_componentes.Retrieve() < 0 then
	ROLLBACK USING SQLCA;
	return
end if
COMMIT USING SQLCA;

ldwC_componentes.SetFilter('componentes_codigo<>17 and componentes_codigo<>18')
ldwC_componentes.AcceptText()
ldwC_componentes.Filter()
end event

