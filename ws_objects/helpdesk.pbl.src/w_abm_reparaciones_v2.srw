$PBExportHeader$w_abm_reparaciones_v2.srw
forward
global type w_abm_reparaciones_v2 from w_abm_cyd_base
end type
type gb_repa from groupbox within w_abm_reparaciones_v2
end type
type gb_comp from groupbox within w_abm_reparaciones_v2
end type
type tab_detalles from tab within w_abm_reparaciones_v2
end type
type tabpage_estados from userobject within tab_detalles
end type
type ln_c_2 from line within tabpage_estados
end type
type ln_c_1 from line within tabpage_estados
end type
type pb_f from picturebutton within tabpage_estados
end type
type pb_e from picturebutton within tabpage_estados
end type
type pb_d from picturebutton within tabpage_estados
end type
type pb_c_2 from picturebutton within tabpage_estados
end type
type pb_c_1 from picturebutton within tabpage_estados
end type
type pb_c from picturebutton within tabpage_estados
end type
type pb_b_2 from picturebutton within tabpage_estados
end type
type pb_b from picturebutton within tabpage_estados
end type
type pb_a_2 from picturebutton within tabpage_estados
end type
type pb_a from picturebutton within tabpage_estados
end type
type ln_a from line within tabpage_estados
end type
type ln_a_2 from line within tabpage_estados
end type
type ln_b_2 from line within tabpage_estados
end type
type ln_b from line within tabpage_estados
end type
type ln_c from line within tabpage_estados
end type
type ln_d from line within tabpage_estados
end type
type ln_a_2_exit from line within tabpage_estados
end type
type ln_b_2_exit from line within tabpage_estados
end type
type ln_e_bot from line within tabpage_estados
end type
type ln_bot_1 from line within tabpage_estados
end type
type ln_e_top from line within tabpage_estados
end type
type ln_c_2_exit from line within tabpage_estados
end type
type ln_d_4 from line within tabpage_estados
end type
type ln_d_2 from line within tabpage_estados
end type
type ln_d_3 from line within tabpage_estados
end type
type ln_c_top from line within tabpage_estados
end type
type ln_top_ok_1 from line within tabpage_estados
end type
type ln_c_2_top from line within tabpage_estados
end type
type ln_c_1_top from line within tabpage_estados
end type
type ln_e from line within tabpage_estados
end type
type r_current from rectangle within tabpage_estados
end type
type ln_bot_2 from line within tabpage_estados
end type
type ln_top_ok_2 from line within tabpage_estados
end type
type dw_estados from datawindow within tabpage_estados
end type
type tabpage_estados from userobject within tab_detalles
ln_c_2 ln_c_2
ln_c_1 ln_c_1
pb_f pb_f
pb_e pb_e
pb_d pb_d
pb_c_2 pb_c_2
pb_c_1 pb_c_1
pb_c pb_c
pb_b_2 pb_b_2
pb_b pb_b
pb_a_2 pb_a_2
pb_a pb_a
ln_a ln_a
ln_a_2 ln_a_2
ln_b_2 ln_b_2
ln_b ln_b
ln_c ln_c
ln_d ln_d
ln_a_2_exit ln_a_2_exit
ln_b_2_exit ln_b_2_exit
ln_e_bot ln_e_bot
ln_bot_1 ln_bot_1
ln_e_top ln_e_top
ln_c_2_exit ln_c_2_exit
ln_d_4 ln_d_4
ln_d_2 ln_d_2
ln_d_3 ln_d_3
ln_c_top ln_c_top
ln_top_ok_1 ln_top_ok_1
ln_c_2_top ln_c_2_top
ln_c_1_top ln_c_1_top
ln_e ln_e
r_current r_current
ln_bot_2 ln_bot_2
ln_top_ok_2 ln_top_ok_2
dw_estados dw_estados
end type
type tabpage_info from userobject within tab_detalles
end type
type dw_cliente from datawindow within tabpage_info
end type
type dw_equipo from datawindow within tabpage_info
end type
type st_hora from statictext within tabpage_info
end type
type st_horas from statictext within tabpage_info
end type
type gb_equipo from groupbox within tabpage_info
end type
type gb_cliente from groupbox within tabpage_info
end type
type gb_hora from groupbox within tabpage_info
end type
type gb_1 from groupbox within tabpage_info
end type
type tabpage_info from userobject within tab_detalles
dw_cliente dw_cliente
dw_equipo dw_equipo
st_hora st_hora
st_horas st_horas
gb_equipo gb_equipo
gb_cliente gb_cliente
gb_hora gb_hora
gb_1 gb_1
end type
type tab_detalles from tab within w_abm_reparaciones_v2
tabpage_estados tabpage_estados
tabpage_info tabpage_info
end type
type mle_descripcion from multilineedit within w_abm_reparaciones_v2
end type
type mle_problema from multilineedit within w_abm_reparaciones_v2
end type
type mle_solucion from multilineedit within w_abm_reparaciones_v2
end type
type uo_email from uo_envio_email within w_abm_reparaciones_v2
end type
end forward

global type w_abm_reparaciones_v2 from w_abm_cyd_base
integer width = 5774
integer height = 2840
string title = "Reparaciones"
gb_repa gb_repa
gb_comp gb_comp
tab_detalles tab_detalles
mle_descripcion mle_descripcion
mle_problema mle_problema
mle_solucion mle_solucion
uo_email uo_email
end type
global w_abm_reparaciones_v2 w_abm_reparaciones_v2

type variables
long il_codigo
string is_codigo
boolean ibool_insert = false

long il_red = 28553471
long il_green = 12639424
long il_yellow = 28573176
long il_gray = 134217728

end variables

forward prototypes
public subroutine wf_get_codigo ()
public function integer wf_cambiar_estado (long al_estado, long al_motivo, string as_estado)
public function integer wf_refresh_dddw (string as_name, integer ai_data)
public function integer wf_grabar (ref datawindow adw_cab, ref datawindow adw_det)
public subroutine wf_timer ()
public subroutine wf_calcular_mano_obra ()
public subroutine wf_insertar_campos ()
public subroutine wf_mandar_monto ()
public subroutine wf_mail (integer ai_estado)
public subroutine wf_enviar_presupuesto ()
public subroutine wf_enviar_encuesta ()
end prototypes

public subroutine wf_get_codigo ();SELECT TOP 1 IsNull(REPARACIONES_CODIGO, 0)
INTO :il_codigo
FROM REPARACIONES
ORDER BY REPARACIONES_CODIGO DESC
COMMIT USING SQLCA;

if isNull(il_codigo) then il_codigo = 0

il_codigo += 1
end subroutine

public function integer wf_cambiar_estado (long al_estado, long al_motivo, string as_estado);string ls_repa_codigo
datastore lds_estados

if al_estado <> 1 then
	if messagebox('Atencion!', 'Esta seguro que desea cambiar el estado a '+as_estado+'?', Question!, YesNo!) <> 1 then return -1
end if

lds_estados = Create datastore
lds_estados.DataObject = 'dw_ds_reparaciones_estados'
lds_estados.SetTransObject(SQLCA)

lds_estados.Reset()
lds_estados.InsertRow(0)
lds_estados.SetItem(1, 'reparaciones_codigo', il_codigo)
lds_estados.SetItem(1, 'estados_codigo', al_estado)
lds_estados.SetItem(1, 'moti_trans_codigo', al_motivo)


lds_estados.AcceptText()

if lds_estados.Update(True, False) = 1 then
	COMMIT USING SQLCA;
	return 0
end if 
ROLLBACK USING SQLCA;
return -1
end function

public function integer wf_refresh_dddw (string as_name, integer ai_data);DatawindowChild ldwC_proveedores

// se refresca la dddw para que aparezca el proveedor
dw_cabecera.GetChild( as_name, ldwC_proveedores)
ldwC_proveedores.SetTransObject(SQLCA)

if ldwC_proveedores.Retrieve() < 0 then
	ROLLBACK USING SQLCA;
	return -1
end if
COMMIT USING SQLCA;

dw_cabecera.SetItem(1, as_name, ai_data)
dw_cabecera.enabled = true

return 0
end function

public function integer wf_grabar (ref datawindow adw_cab, ref datawindow adw_det);long ll_ret, ll_row
adw_cab.accepttext()

ll_row = adw_cab.rowcount()
if ll_row >0 then 
		if adw_cab.update(true,false) = 1 then
			if adw_det.update(true,false) = 1 then
				commit using sqlca;
				adw_cab.resetupdate()
				ll_ret = 1
			else
				rollback using sqlca;
				MessageBox("Error de grabacion - detalle", + &
						"La aplicación a encontrado un error",Stopsign!)
				adw_cab.rowsmove(1,1,delete!,adw_cab,1,primary!)
				adw_cab.setrow(1)
				ll_ret = -1 
			end if
		else
			 rollback using sqlca;
			MessageBox("Error de grabacion - cabecera", + &
						"La aplicación a encontrado un error",Stopsign!)
			adw_cab.rowsmove(1,1,delete!,adw_cab,1,primary!)
			adw_cab.setrow(1)
			ll_ret = -1
		end if
else
	messagebox("Error","No se encontraron datos para grabar",stopsign!)
	ll_ret = -1
end if

return ll_ret
end function

public subroutine wf_timer ();long ll_horas
long ll_horas_display, ll_min_display

tab_detalles.tabpage_info.st_hora.text = string(now(), 'hh:mm')

SELECT DATEDIFF(HOUR, reparaciones_inicio, GETDATE())
INTO :ll_horas
FROM	 REPARACIONES 
WHERE REPARACIONES_CODIGO = :il_codigo
COMMIT USING SQLCA;

ll_min_display = ll_horas - (ll_horas/60)

tab_detalles.tabpage_info.st_horas.text = string(ll_horas) + ' Horas'
end subroutine

public subroutine wf_calcular_mano_obra ();long ll_horas, ll_mano, ll_row

SELECT DATEDIFF(HOUR, reparaciones_inicio, GETDATE())
INTO :ll_horas
FROM	 REPARACIONES 
WHERE REPARACIONES_CODIGO = :il_codigo
COMMIT USING SQLCA;

SELECT CONVERT(INT, PARAMETROS_VALOR)
INTO :ll_mano
FROM PARAMETROS
WHERE PARAMETROS_CODIGO = 'COSTO_HOMBRE'
commit using sqlca;


ll_row = dw_detalle.InsertRow(0)


dw_detalle.SetItem(ll_row, 'reparaciones_componentes_componentes_codigo', 18)
dw_detalle.SetItem(ll_row, 'reparaciones_componentes_repa_compo_cantidad', ll_horas)
dw_detalle.SetItem(ll_row, 'reparaciones_componentes_repa_compo_precio_venta', ll_mano)
dw_detalle.SetItem(ll_row, 'componentes_componentes_sk', '-')
dw_detalle.SetItem(ll_row, 'reparaciones_componentes_repa_compo_precio_compra', 0)
dw_detalle.AcceptText()

end subroutine

public subroutine wf_insertar_campos ();datastore lds_aux
long ll_aux
string ls_aux

lds_aux = Create datastore
 
// se insertan los nuevos problemas-soluciones-decripcion
if dw_cabecera.GetItemString(1, 'desc_prob_descripcion') = '(Nuevo)' then
	lds_aux.DataObject = 'dw_abm_descripciones_problemas'
	lds_aux.SetTransObject(SQLCA)
	lds_aux.Reset()
	lds_aux.InsertRow(0)
	ls_aux = mle_descripcion.text
	lds_aux.SetItem(1, 'desc_prob_descripcion', ls_aux)
			
	lds_aux.AcceptText()
			
	if lds_aux.Update(True, False) = 1 then
		COMMIT USING SQLCA;
		dw_cabecera.SetItem(1, 'desc_prob_descripcion', ls_aux)
	end if 
end if 

// problemas
if dw_cabecera.GetItemNumber(1, 'reparaciones_reparaciones_prolema') = 0 then
	lds_aux.DataObject = 'dw_abm_problemas'
	lds_aux.SetTransObject(SQLCA)
	lds_aux.Reset()
	lds_aux.InsertRow(0)
	lds_aux.SetItem(1, 'problemas_descripcion', mle_problema.text)
			
	lds_aux.AcceptText()
			
	if lds_aux.Update(True, False) = 1 then
		COMMIT USING SQLCA;
				
		SELECT TOP 1 PROBLEMAS_CODIGO
		INTO :ll_aux		
		FROM PROBLEMAS
		ORDER BY PROBLEMAS_CODIGO DESC
		COMMIT USING SQLCA;
				
		dw_cabecera.SetItem(1, 'reparaciones_reparaciones_prolema', ll_aux)
	end if 
end if 

// solucion
if dw_cabecera.GetItemString(1, 'soluciones_descripcion') = '(Nuevo)' then
	lds_aux.DataObject = 'dw_abm_soluciones'
	lds_aux.SetTransObject(SQLCA)
	lds_aux.Reset()
	lds_aux.InsertRow(0)
	ls_aux = mle_solucion.text
	lds_aux.SetItem(1, 'soluciones_descripcion', ls_aux)
		
	lds_aux.AcceptText()
		
	if lds_aux.Update(True, False) = 1 then
		COMMIT USING SQLCA;
				
		dw_cabecera.SetItem(1, 'soluciones_descripcion', ls_aux)
	end if 
end if 
end subroutine

public subroutine wf_mandar_monto ();Integer li_rc
String ls_ReturnJson
long ll_monto
string ls_documento, ls_ip, ls_port

HttpClient lnv_HttpClient
lnv_HttpClient = Create HttpClient

SELECT PARAMETROS_VALOR
INTO :ls_ip
FROM PARAMETROS
WHERE PARAMETROS_CODIGO = 'API_IP'
commit using sqlca;

SELECT PARAMETROS_VALOR
INTO :ls_port
FROM PARAMETROS
WHERE PARAMETROS_CODIGO = 'API_PORT'
commit using sqlca;

if trim(ls_ip, true) = '' or  trim(ls_port, true) = '' then 
	messagebox('Aviso!', 'La dirección ip o el puerto no estan configurados correctamente, debera introducir los datos manualmente.')
	return
end if 

ll_monto = dw_cabecera.GetItemNumber(1, 'reparaciones_costo')
ls_documento = tab_detalles.tabpage_info.dw_cliente.GetItemString(1, 'clientes_documento')

String ls_json = '{"monto":'+string(ll_monto)+', "documento":"'+ls_documento+'"}'


lnv_HttpClient.SetRequestHeader("Content-Type", "application/json")

li_rc = lnv_HttpClient.SendRequest("POST", "https://"+ls_ip+":"+ls_port+"/descuento", ls_json)

if li_rc = 1 and lnv_HttpClient.GetResponseStatusCode() = 200 then
	 lnv_HttpClient.GetResponseBody(ls_ReturnJson)
else 
	messagebox('Aviso!', 'La conexión a la caja a fallado, verifique que la dirección ip y el puerto esten configurados correctamente, debera introducir los datos manualmente.')
 end if

end subroutine

public subroutine wf_mail (integer ai_estado);string ls_nombre, ls_contrasenia, ls_asunto, ls_mensaje, ls_destinatario,ls_destinatario_email, ls_estado
long ll_cliente

ll_cliente = dw_cabecera.GetItemNumber(1, 'CLIENTES_CODIGO')

SELECT CLIENTES_NOMBRE+', '+ CLIENTES_APELLIDO, CLIENTES_CORREO
INTO :ls_destinatario, :ls_destinatario_email
FROM REPARACIONES
JOIN CLIENTES ON REPARACIONES.CLIENTES_CODIGO = CLIENTES.CLIENTES_CODIGO 
WHERE REPARACIONES.REPARACIONES_CODIGO = :il_codigo
commit using sqlca;

SELECT TIPO_CORRE_NOMBRE, TIPO_CORRE_MENSAJE
INTO :ls_asunto, :ls_mensaje
FROM TIPOS_CORREOS
WHERE TIPO_CORRE_CODIGO = 1
COMMIT USING SQLCA;

SELECT ESTADOS_NOMBRE
into :ls_estado
FROM ESTADOS 
WHERE ESTADOS_CODIGO = :ai_estado
COMMIT USING SQLCA;

ls_mensaje+=' '+ls_estado

// para perfil de correo 
ls_nombre = 'Outlook'
ls_contrasenia = 'Nippon2023*'

//se configura el perfil
uo_email.set_perfil_correo(ls_nombre, ls_contrasenia)
// se carga el destinatario 
uo_email.set_destinatario( ls_destinatario,ls_destinatario_email)
//se carga el mensaje
uo_email.set_mensaje(ls_asunto, ls_mensaje)
//se envia
uo_email.of_enviar()
end subroutine

public subroutine wf_enviar_presupuesto ();string ls_nombre, ls_contrasenia, ls_asunto, ls_mensaje, ls_destinatario,ls_destinatario_email, ls_estado
long ll_cliente, ll_monto

ll_cliente = dw_cabecera.GetItemNumber(1, 'CLIENTES_CODIGO')

SELECT CLIENTES_NOMBRE+', '+ CLIENTES_APELLIDO, CLIENTES_CORREO, REPARACIONES_COSTO
INTO :ls_destinatario, :ls_destinatario_email, :ll_monto
FROM REPARACIONES
JOIN CLIENTES ON REPARACIONES.CLIENTES_CODIGO = CLIENTES.CLIENTES_CODIGO 
WHERE REPARACIONES.REPARACIONES_CODIGO = :il_codigo
commit using sqlca;

SELECT TIPO_CORRE_NOMBRE, TIPO_CORRE_MENSAJE
INTO :ls_asunto, :ls_mensaje
FROM TIPOS_CORREOS
WHERE TIPO_CORRE_CODIGO = 5
COMMIT USING SQLCA;


ls_mensaje+=': '+string(ll_monto, '###,###,###,###')

// para perfil de correo 
ls_nombre = 'Outlook'
ls_contrasenia = 'Nippon2023*'

//se configura el perfil
uo_email.set_perfil_correo(ls_nombre, ls_contrasenia)
// se carga el destinatario 
uo_email.set_destinatario( ls_destinatario,ls_destinatario_email)
//se carga el mensaje
uo_email.set_mensaje(ls_asunto, ls_mensaje)
//se envia
uo_email.of_enviar()
end subroutine

public subroutine wf_enviar_encuesta ();string ls_nombre, ls_contrasenia, ls_asunto, ls_mensaje, ls_destinatario,ls_destinatario_email, ls_estado
long ll_cliente
string ls_link

ll_cliente = dw_cabecera.GetItemNumber(1, 'CLIENTES_CODIGO')

SELECT CLIENTES_NOMBRE+', '+ CLIENTES_APELLIDO 
INTO :ls_destinatario, :ls_destinatario_email
FROM REPARACIONES
JOIN CLIENTES ON REPARACIONES.CLIENTES_CODIGO = CLIENTES.CLIENTES_CODIGO 
WHERE REPARACIONES.REPARACIONES_CODIGO = :il_codigo
commit using sqlca;

SELECT TIPO_CORRE_NOMBRE, TIPO_CORRE_MENSAJE
INTO :ls_asunto, :ls_mensaje
FROM TIPOS_CORREOS
WHERE TIPO_CORRE_CODIGO = 6
COMMIT USING SQLCA;

SELECT PARAMETROS_VALOR
INTO :ls_link
FROM PARAMETROS
WHERE PARAMETROS_CODIGO = 'LINK_FORMS'
commit using sqlca;


ls_mensaje+=': '+ls_link

// para perfil de correo 
ls_nombre = 'Outlook'
ls_contrasenia = 'Nippon2023*'

//se configura el perfil
uo_email.set_perfil_correo(ls_nombre, ls_contrasenia)
// se carga el destinatario 
uo_email.set_destinatario( ls_destinatario,ls_destinatario_email)
//se carga el mensaje
uo_email.set_mensaje(ls_asunto, ls_mensaje)
//se envia
uo_email.of_enviar()
end subroutine

on w_abm_reparaciones_v2.create
int iCurrent
call super::create
this.gb_repa=create gb_repa
this.gb_comp=create gb_comp
this.tab_detalles=create tab_detalles
this.mle_descripcion=create mle_descripcion
this.mle_problema=create mle_problema
this.mle_solucion=create mle_solucion
this.uo_email=create uo_email
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_repa
this.Control[iCurrent+2]=this.gb_comp
this.Control[iCurrent+3]=this.tab_detalles
this.Control[iCurrent+4]=this.mle_descripcion
this.Control[iCurrent+5]=this.mle_problema
this.Control[iCurrent+6]=this.mle_solucion
end on

on w_abm_reparaciones_v2.destroy
call super::destroy
destroy(this.gb_repa)
destroy(this.gb_comp)
destroy(this.tab_detalles)
destroy(this.mle_descripcion)
destroy(this.mle_problema)
destroy(this.mle_solucion)
destroy(this.uo_email)
end on

event open;//ancestro anulado
long ll_codigo, ll_row, ll_aux, ll_cliente, ll_equipo, ll_estado
string ls_codigo, ls_aux

ls_aux = message.stringparm

ll_aux = pos(ls_aux, ',') - 1

ls_codigo = mid(ls_aux, 1, ll_aux)

if not gb_tecnico_supervisor then dw_cabecera.modify('usuarios_codigo.protect=true')


if len(ls_codigo)>0 then 
	ll_row = dw_cabecera.retrieve(ls_codigo)
	
	if ll_row>0 then 
		is_codigo = ls_codigo
		il_codigo = long(ls_codigo)
		Timer(60)
		wf_timer()
		if dw_detalle.retrieve(ls_codigo) = 0 then dw_detalle.insertrow(0) 
		ll_cliente = dw_cabecera.GetItemNumber(1, 'clientes_codigo')
		ll_equipo = dw_cabecera.GetItemNumber(1, 'equipos_codigo')
		
		tab_detalles.tabpage_info.dw_cliente.Retrieve(ll_cliente)
		tab_detalles.tabpage_info.dw_equipo.Retrieve(ll_equipo)
	end if
	
else
	ibool_insert = true
	tab_detalles.SelectedTab = 2
	tab_detalles.tabpage_estados.visible = false
	dw_cabecera.modify('soluciones_descripcion.protect=true')
	dw_cabecera.SetItem(1, 'usuarios_codigo', gs_usu_codigo)
end if

if not ibool_insert then 
	dw_cabecera.modify('reparaciones_costo.protect=true')
end if

SELECT TOP 1 ESTADOS_CODIGO
into :ll_estado
FROM REPARACIONES_ESTADOS
WHERE REPARACIONES_CODIGO = :il_codigo
ORDER BY REPA_ESTA_FECHA DESC
COMMIT USING SQLCA;


if ll_estado = 9 then 
	tab_detalles.tabpage_estados.dw_estados.retrieve(il_codigo)
	tab_detalles.tabpage_estados.dw_estados.visible = true
end if 
	

tab_detalles.tabpage_estados.event ue_select_estado(ll_estado)


end event

event timer;call super::timer;wf_timer()

end event

type cb_2 from w_abm_cyd_base`cb_2 within w_abm_reparaciones_v2
integer x = 4891
integer y = 2612
end type

type cb_1 from w_abm_cyd_base`cb_1 within w_abm_reparaciones_v2
integer x = 5289
integer y = 2612
integer taborder = 40
end type

event cb_1::clicked;// ancestro anulado
long ll_counter, ll_aux, ll_costo_total
long ll_inserted
datastore lds_aux
string ls_aux
long ll_aux_2

long ll_codigo
string ls_nombre
long ll_cantidad
long ll_precio

if dw_cabecera.GetItemString(1, 'equipos_codigo') = '' then return
if dw_cabecera.GetItemString(1, 'clientes_codigo') = '' then return

// ################################################
if f_validacion(dw_cabecera) = 1 then return

ls_aux = mle_descripcion.text

SELECT COUNT(*)
INTO :ll_aux_2
FROM DESCRIPCIONES_PROBLEMAS
WHERE DESC_PROB_DESCRIPCION = :ls_aux
COMMIT USING SQLCA;

if ll_aux_2 > 0 then dw_cabecera.SetItem(1, 'desc_prob_descripcion', ls_aux)

ls_aux = mle_solucion.text

SELECT COUNT(*)
INTO :ll_aux_2
FROM SOLUCIONES
WHERE SOLUCIONES_DESCRIPCION = :ls_aux
COMMIT USING SQLCA;

if ll_aux_2 > 0 then dw_cabecera.SetItem(1, 'SOLUCIONES_DESCRIPCION', ls_aux)

// ################################################

il_codigo = dw_cabecera.GetItemNumber(1, 'reparaciones_codigo')



wf_insertar_campos()

dw_cabecera.AcceptText()

f_cantidad_componetes ()

// acciones si se esta insertando por primera vez

if ibool_insert then 
	wf_get_codigo()
	dw_cabecera.SetItem(1, 'reparaciones_codigo', il_codigo)
	
	if dw_cabecera.GetItemNumber(1, 'reparaciones_urgente') = -1 then
		
		SELECT CONVERT(INT, PARAMETROS_VALOR)
		INTO :ll_aux
		FROM PARAMETROS
		WHERE PARAMETROS_CODIGO = 'COSTO_URGENTE'
		commit using sqlca;
		
		ll_costo_total = dw_cabecera.GetItemNumber(1, 'reparaciones_costo')
		dw_cabecera.SetItem(1, 'reparaciones_costo', ll_costo_total+ll_aux)
		
	end if
	
end if 

dw_cabecera.AcceptText()
dw_detalle.AcceptText()

// recorre todas las filas limpiando la basura (campos incompletos) y
// aquellas que tengan 0 como codigo de item, inserta y pone el codigo retornado en el componente codigo
for ll_counter = dw_detalle.RowCount() to 1 step -1
	dw_detalle.SetItem(ll_counter, 'reparaciones_componentes_reparaciones_codigo', il_codigo)
	
	ll_codigo =		dw_detalle.GetItemNumber(ll_counter, 'reparaciones_componentes_componentes_codigo')
	ll_cantidad = 	dw_detalle.GetItemNumber(ll_counter, 'reparaciones_componentes_repa_compo_cantidad')
	ll_precio =		dw_detalle.GetItemNumber(ll_counter, 'reparaciones_componentes_repa_compo_precio_venta')

	if isNull(ll_codigo) or isNull(ll_cantidad) or isNull(ll_precio) then
		dw_detalle.DeleteRow(ll_counter)
	//elseif ll_cantidad = 0 or ll_precio = 0 then
		//dw_detalle.DeleteRow(ll_counter)
	end if 

next


if wf_grabar(dw_cabecera,dw_detalle) <> -1 then 
	
	if ibool_insert then wf_cambiar_estado(1, 1, '')
	
	cb_2.event clicked()
end if
end event

type dw_detalle from w_abm_cyd_base`dw_detalle within w_abm_reparaciones_v2
integer x = 3067
integer y = 144
integer width = 2560
integer height = 1112
string dataobject = "dw_abm_reparaciones_det"
boolean vscrollbar = true
end type

event dw_detalle::constructor;call super::constructor;DatawindowChild ldwC_componentes
long ll_inserted

this.GetChild('reparaciones_componentes_componentes_codigo', ldwC_componentes)
ldwC_componentes.SetTransObject(SQLCA)

if ldwC_componentes.Retrieve() < 0 then
	ROLLBACK USING SQLCA;
	return
end if
COMMIT USING SQLCA;

ldwC_componentes.SetFilter('componentes_precio_venta>0')
ldwC_componentes.Filter()




end event

event dw_detalle::itemchanged;call super::itemchanged;if dwo.name <> 'reparaciones_componentes_componentes_codigo' then return

datastore lds_componentes

lds_componentes = Create datastore
lds_componentes.DataObject = 'dw_ds_componentes'
lds_componentes.SetTransObject(SQLCA)

if lds_componentes.Retrieve(long(data)) > 0 then
	COMMIT USING SQLCA;
	
	dw_detalle.SetItem(row, 'componentes_componentes_sk', lds_componentes.GetItemString(1, 'componentes_sk'))
	dw_detalle.SetItem(row, 'reparaciones_componentes_repa_compo_precio_venta', lds_componentes.GetItemNumber(1, 'componentes_precio_venta'))
	dw_detalle.SetItem(row, 'reparaciones_componentes_repa_compo_precio_compra', lds_componentes.GetItemNumber(1, 'componentes_precio_compra'))
	if data  = '17' then dw_detalle.SetItem(row, 'reparaciones_componentes_repa_compo_cantidad', 1)
	
end if 
ROLLBACK USING SQLCA;
end event

event dw_detalle::clicked;call super::clicked;//colorea la fila selccionada
INTEGER li_row
li_row = row

IF li_row > 0 THEN
	SelectRow(this, 0, FALSE)
	SelectRow(this, li_row, TRUE)
END IF 

end event

type dw_cabecera from w_abm_cyd_base`dw_cabecera within w_abm_reparaciones_v2
integer x = 151
integer y = 128
integer width = 2688
integer height = 1144
string dataobject = "dw_abm_reparaciones_v2"
boolean border = false
end type

event dw_cabecera::constructor;call super::constructor;DatawindowChild ldwC_componentes
long ll_inserted

this.GetChild('desc_prob_descripcion', ldwC_componentes)
ldwC_componentes.SetTransObject(SQLCA)

if ldwC_componentes.Retrieve() < 0 then
	ROLLBACK USING SQLCA;
	return
end if
COMMIT USING SQLCA;

ll_inserted = ldwC_componentes.InsertRow(0)
ldwC_componentes.SetItem(ll_inserted, 'desc_prob_descripcion', '(Nuevo)')
ldwC_componentes.SetSort('desc_prob_descripcion A')
ldwC_componentes.AcceptText()
ldwC_componentes.Sort()

// --------------------------------------------

this.GetChild('reparaciones_reparaciones_prolema', ldwC_componentes)
ldwC_componentes.SetTransObject(SQLCA)

if ldwC_componentes.Retrieve() < 0 then
	ROLLBACK USING SQLCA;
	return
end if
COMMIT USING SQLCA;

ll_inserted = ldwC_componentes.InsertRow(0)
ldwC_componentes.SetItem(ll_inserted, 'problemas_codigo', 0)
ldwC_componentes.SetItem(ll_inserted, 'problemas_descripcion', '(Nuevo)')
ldwC_componentes.SetSort('problemas_codigo A')
ldwC_componentes.AcceptText()
ldwC_componentes.Sort()

// --------------------------------------------

this.GetChild('soluciones_descripcion', ldwC_componentes)
ldwC_componentes.SetTransObject(SQLCA)

if ldwC_componentes.Retrieve() < 0 then
	ROLLBACK USING SQLCA;
	return
end if
COMMIT USING SQLCA;

ll_inserted = ldwC_componentes.InsertRow(0)
ldwC_componentes.SetItem(ll_inserted, 'soluciones_descripcion', '(Nuevo)')
ldwC_componentes.SetSort('soluciones_descripcion A')
ldwC_componentes.AcceptText()
ldwC_componentes.Sort()

end event

event dw_cabecera::itemchanged;call super::itemchanged;if dwo.name = 'desc_prob_descripcion' and data = '(Nuevo)' then
	mle_descripcion.visible = true
	mle_descripcion.SetFocus()
	//This.SetColumn('descripciones_problemas_desc_prob_descripcion')
	//this.SetItem(1, 'desc_prob_descripcion', ' ')
	
	return
end if 


// --------------------------------------------
if dwo.name = 'reparaciones_reparaciones_prolema' and data = '0' then
	mle_problema.visible = true
	mle_problema.SetFocus()
	//this.SetItem(1, 'problemas_problemas_descripcion', '')
	//This.SetColumn('problemas_problemas_descripcion')

	return
	
end if 


// --------------------------------------------w
if dwo.name = 'soluciones_descripcion' and data = '(Nuevo)' then
	mle_solucion.visible = true
	mle_solucion.SetFocus()
	//This.SetColumn('soluciones_soluciones_descripcion')
	return
	
end if 
end event

type gb_repa from groupbox within w_abm_reparaciones_v2
integer x = 32
integer y = 24
integer width = 2885
integer height = 1288
integer taborder = 30
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Reparacion"
end type

type gb_comp from groupbox within w_abm_reparaciones_v2
integer x = 2981
integer y = 24
integer width = 2720
integer height = 1288
integer taborder = 40
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Presupuesto"
end type

type tab_detalles from tab within w_abm_reparaciones_v2
integer x = 41
integer y = 1344
integer width = 5659
integer height = 1260
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_estados tabpage_estados
tabpage_info tabpage_info
end type

on tab_detalles.create
this.tabpage_estados=create tabpage_estados
this.tabpage_info=create tabpage_info
this.Control[]={this.tabpage_estados,&
this.tabpage_info}
end on

on tab_detalles.destroy
destroy(this.tabpage_estados)
destroy(this.tabpage_info)
end on

type tabpage_estados from userobject within tab_detalles
event ue_select_estado ( integer ai_estado )
event ue_clicked ( string as_bt )
integer x = 18
integer y = 116
integer width = 5623
integer height = 1128
long backcolor = 67108864
string text = "Estados"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
ln_c_2 ln_c_2
ln_c_1 ln_c_1
pb_f pb_f
pb_e pb_e
pb_d pb_d
pb_c_2 pb_c_2
pb_c_1 pb_c_1
pb_c pb_c
pb_b_2 pb_b_2
pb_b pb_b
pb_a_2 pb_a_2
pb_a pb_a
ln_a ln_a
ln_a_2 ln_a_2
ln_b_2 ln_b_2
ln_b ln_b
ln_c ln_c
ln_d ln_d
ln_a_2_exit ln_a_2_exit
ln_b_2_exit ln_b_2_exit
ln_e_bot ln_e_bot
ln_bot_1 ln_bot_1
ln_e_top ln_e_top
ln_c_2_exit ln_c_2_exit
ln_d_4 ln_d_4
ln_d_2 ln_d_2
ln_d_3 ln_d_3
ln_c_top ln_c_top
ln_top_ok_1 ln_top_ok_1
ln_c_2_top ln_c_2_top
ln_c_1_top ln_c_1_top
ln_e ln_e
r_current r_current
ln_bot_2 ln_bot_2
ln_top_ok_2 ln_top_ok_2
dw_estados dw_estados
end type

event ue_select_estado(integer ai_estado);// Se selecciona el boton
Choose case ai_estado
	case 1
		pb_a.enabled = true
	case 2
		r_current.event ue_select(pb_a.X, pb_a.Y, 'pb_a')
	case 3
		r_current.event ue_select(pb_b.X, pb_b.Y, 'pb_b')
	case 4
		r_current.event ue_select(pb_c.X, pb_c.Y, 'pb_c')
	case 5
		r_current.event ue_select(pb_c_1.X, pb_c_1.Y, 'pb_c_1')
	case 6
		r_current.event ue_select(pb_c_2.X, pb_c_2.Y, 'pb_c_2')
	case 7
		r_current.event ue_select(pb_d.X, pb_d.Y, 'pb_d')
	case 8
		r_current.event ue_select(pb_e.X, pb_e.Y, 'pb_e')
	case 9
		r_current.event ue_select(pb_f.X, pb_f.Y, 'pb_f')
end choose

end event

event ue_clicked(string as_bt);Choose case as_bt
	case 'pb_a'
		ln_a.LineColor = il_green
		ln_a_2.LineColor = il_red

		pb_b.enabled = true
		pb_a_2.enabled = true
		
	case 'pb_a_2'
		ln_a.LineColor = il_gray
		ln_a_2.LineColor = il_gray
		
		ln_a_2_exit.LineColor = il_red
		ln_bot_2.LineColor = il_red
		ln_bot_1.LineColor = il_red
		ln_e_bot.LineColor = il_red
		
		pb_b.enabled = false
		pb_a.enabled = false
		pb_f.enabled = true

	case 'pb_b'
		ln_b.LineColor = il_green
		ln_b_2.LineColor = il_red
		
		pb_a.enabled = false
		pb_a_2.enabled = false
		pb_c.enabled = true
		pb_b_2.enabled = true
		
		ln_a.LineColor = il_gray
		ln_a_2.LineColor = il_gray
		
	case 'pb_b_2'
		ln_b.LineColor = il_gray
		ln_b_2.LineColor = il_gray
		
		ln_b_2_exit.LineColor = il_red
		ln_bot_1.LineColor = il_red
		ln_e_bot.LineColor = il_red
		
		pb_b.enabled = false
		pb_c.enabled = false
		pb_e.enabled = true

	case 'pb_c'
		ln_c.LineColor = il_green
		ln_c_1.LineColor = il_yellow
		ln_c_2.LineColor = il_yellow
		
		ln_b.LineColor = il_gray
		ln_b_2.LineColor = il_gray
		
		ln_d.LineColor = il_gray
		ln_d_2.LineColor = il_gray
		ln_d_3.LineColor = il_gray
		ln_d_4.LineColor = il_gray
		
		ln_top_ok_1.LineColor = il_gray
		ln_c_top.LineColor = il_gray
		ln_c_1_top.LineColor = il_gray
		
		ln_top_ok_2.LineColor = il_gray
		ln_c_2_top.LineColor = il_gray
		
		ln_c_2_exit.LineColor = il_gray
		ln_e_top.LineColor = il_gray
		
		pb_b.enabled = false
		pb_b_2.enabled = false
		pb_d.enabled = true
		pb_c_1.enabled = true
		pb_c_2.enabled = true
		pb_e.enabled = false

	case 'pb_c_1'
		ln_c.LineColor = il_gray
		ln_c_1.LineColor = il_gray
		ln_c_2.LineColor = il_gray
		
		ln_top_ok_1.LineColor = il_green
		ln_c_top.LineColor = il_green
		ln_c_1_top.LineColor = il_green
		
		
		pb_d.enabled = false
		pb_c_2.enabled = false
		pb_e.enabled = false

	case 'pb_c_2'
		ln_c.LineColor = il_gray
		ln_c_1.LineColor = il_gray
		ln_c_2.LineColor = il_gray
		
		ln_top_ok_1.LineColor = il_green
		ln_top_ok_2.LineColor = il_green
		ln_c_top.LineColor = il_green
		ln_c_2_top.LineColor = il_green
		
		ln_c_2_exit.LineColor = il_red
		ln_e_top.LineColor = il_red
		
		pb_d.enabled = false
		pb_c.enabled = true
		pb_c_1.enabled = false
		pb_e.enabled = true
//		ln_c.LineColor = il_gray
//		ln_c_1.LineColor = il_gray
//		ln_c_2.LineColor = il_gray
//		
//		ln_top_ok_1.LineColor = il_green
//		ln_top_ok_2.LineColor = il_green
//		ln_c_top.LineColor = il_green
//		ln_c_2_top.LineColor = il_green
//		
//		ln_c_2_exit.LineColor = il_red
//		ln_e_top.LineColor = il_red
//		
//		pb_d.enabled = false
//		pb_c_1.enabled = false
//		pb_e.enabled = true

	case 'pb_d'
		ln_c.LineColor = il_gray
		ln_c_1.LineColor = il_gray
		ln_c_2.LineColor = il_gray
		
		ln_d.LineColor = il_green
		ln_d_2.LineColor = il_green
		ln_d_3.LineColor = il_green
		ln_d_4.LineColor = il_green
		
		
		pb_c.enabled = true
		pb_c_1.enabled = false
		pb_c_2.enabled = false
		pb_e.enabled = true

	case 'pb_e'
		ln_a_2_exit.LineColor = il_gray
		ln_bot_1.LineColor = il_gray
		ln_bot_2.LineColor = il_gray
		ln_e_bot.LineColor = il_gray
		
		ln_d.LineColor = il_gray
		ln_d_2.LineColor = il_gray
		ln_d_3.LineColor = il_gray
		ln_d_4.LineColor = il_gray
		
		ln_top_ok_1.LineColor = il_gray
		ln_top_ok_2.LineColor = il_gray
		ln_c_top.LineColor = il_gray
		ln_c_2_top.LineColor = il_gray
		
		ln_c_2_exit.LineColor = il_gray
		ln_e_top.LineColor = il_gray
		
		ln_e.LineColor = il_green
		
		pb_a_2.enabled = false
		pb_b_2.enabled = false
		pb_c_2.enabled = false
		pb_c.enabled = false
		pb_d.enabled = false
		pb_f.enabled = true
			
	case 'pb_f'
		ln_a_2_exit.LineColor = il_gray
		ln_bot_1.LineColor = il_gray
		ln_bot_2.LineColor = il_gray
		ln_e_bot.LineColor = il_gray
		
		ln_d.LineColor = il_gray
		ln_d_2.LineColor = il_gray
		ln_d_3.LineColor = il_gray
		ln_d_4.LineColor = il_gray
		
		ln_top_ok_1.LineColor = il_gray
		ln_top_ok_2.LineColor = il_gray
		ln_c_top.LineColor = il_gray
		ln_c_2_top.LineColor = il_gray
		
		ln_c_2_exit.LineColor = il_gray
		ln_e_top.LineColor = il_gray
		ln_e.LineColor = il_gray

		pb_e.enabled = false

End Choose
end event

on tabpage_estados.create
this.ln_c_2=create ln_c_2
this.ln_c_1=create ln_c_1
this.pb_f=create pb_f
this.pb_e=create pb_e
this.pb_d=create pb_d
this.pb_c_2=create pb_c_2
this.pb_c_1=create pb_c_1
this.pb_c=create pb_c
this.pb_b_2=create pb_b_2
this.pb_b=create pb_b
this.pb_a_2=create pb_a_2
this.pb_a=create pb_a
this.ln_a=create ln_a
this.ln_a_2=create ln_a_2
this.ln_b_2=create ln_b_2
this.ln_b=create ln_b
this.ln_c=create ln_c
this.ln_d=create ln_d
this.ln_a_2_exit=create ln_a_2_exit
this.ln_b_2_exit=create ln_b_2_exit
this.ln_e_bot=create ln_e_bot
this.ln_bot_1=create ln_bot_1
this.ln_e_top=create ln_e_top
this.ln_c_2_exit=create ln_c_2_exit
this.ln_d_4=create ln_d_4
this.ln_d_2=create ln_d_2
this.ln_d_3=create ln_d_3
this.ln_c_top=create ln_c_top
this.ln_top_ok_1=create ln_top_ok_1
this.ln_c_2_top=create ln_c_2_top
this.ln_c_1_top=create ln_c_1_top
this.ln_e=create ln_e
this.r_current=create r_current
this.ln_bot_2=create ln_bot_2
this.ln_top_ok_2=create ln_top_ok_2
this.dw_estados=create dw_estados
this.Control[]={this.ln_c_2,&
this.ln_c_1,&
this.pb_f,&
this.pb_e,&
this.pb_d,&
this.pb_c_2,&
this.pb_c_1,&
this.pb_c,&
this.pb_b_2,&
this.pb_b,&
this.pb_a_2,&
this.pb_a,&
this.ln_a,&
this.ln_a_2,&
this.ln_b_2,&
this.ln_b,&
this.ln_c,&
this.ln_d,&
this.ln_a_2_exit,&
this.ln_b_2_exit,&
this.ln_e_bot,&
this.ln_bot_1,&
this.ln_e_top,&
this.ln_c_2_exit,&
this.ln_d_4,&
this.ln_d_2,&
this.ln_d_3,&
this.ln_c_top,&
this.ln_top_ok_1,&
this.ln_c_2_top,&
this.ln_c_1_top,&
this.ln_e,&
this.r_current,&
this.ln_bot_2,&
this.ln_top_ok_2,&
this.dw_estados}
end on

on tabpage_estados.destroy
destroy(this.ln_c_2)
destroy(this.ln_c_1)
destroy(this.pb_f)
destroy(this.pb_e)
destroy(this.pb_d)
destroy(this.pb_c_2)
destroy(this.pb_c_1)
destroy(this.pb_c)
destroy(this.pb_b_2)
destroy(this.pb_b)
destroy(this.pb_a_2)
destroy(this.pb_a)
destroy(this.ln_a)
destroy(this.ln_a_2)
destroy(this.ln_b_2)
destroy(this.ln_b)
destroy(this.ln_c)
destroy(this.ln_d)
destroy(this.ln_a_2_exit)
destroy(this.ln_b_2_exit)
destroy(this.ln_e_bot)
destroy(this.ln_bot_1)
destroy(this.ln_e_top)
destroy(this.ln_c_2_exit)
destroy(this.ln_d_4)
destroy(this.ln_d_2)
destroy(this.ln_d_3)
destroy(this.ln_c_top)
destroy(this.ln_top_ok_1)
destroy(this.ln_c_2_top)
destroy(this.ln_c_1_top)
destroy(this.ln_e)
destroy(this.r_current)
destroy(this.ln_bot_2)
destroy(this.ln_top_ok_2)
destroy(this.dw_estados)
end on

event constructor;


ln_a.beginX = pb_a.X + pb_a.Width
ln_a.beginY = (pb_a.Y + pb_a.Height/2)

ln_a.endX = pb_B.X
ln_a.endY = ln_a.beginY

// ----------- 

ln_a_2.beginX = (ln_a.beginX + ln_a.endX) / 2
ln_a_2.beginY = ln_a.beginY

ln_a_2.endX = ln_a_2.beginX
ln_a_2.endY = pb_a_2.Y

// ----------

pb_a_2.X = ln_a_2.beginX - (pb_a_2.Width/2)

// ########################################


ln_b.beginX = pb_b.X + pb_b.Width
ln_b.beginY = (pb_b.Y + pb_b.Height/2)

ln_b.endX = pb_c.X
ln_b.endY = ln_b.beginY

// ----------- 


ln_b_2.beginX = (ln_b.beginX + ln_b.endX) / 2
ln_b_2.beginY = ln_b.beginY

ln_b_2.endX = ln_b_2.beginX
ln_b_2.endY = pb_b_2.Y

// ----------

pb_b_2.X = ln_b_2.beginX - (pb_b_2.Width/2)

// ########################################

ln_c.beginX = pb_c.X + pb_c.Width
ln_c.beginY = (pb_c.Y + pb_c.Height/2)

ln_c.endX = pb_d.X
ln_c.endY = ln_c.beginY

// ----------- 

ln_c_1.beginX = ln_c.beginX + ((ln_c.endX - ln_c.beginX) / 4) * 1
ln_c_1.beginY = ln_a.beginY

ln_c_1.endX = ln_c_1.beginX
ln_c_1.endY = pb_c_2.Y

pb_c_1.X = ln_c_1.beginX - (pb_c_1.Width/2)

// ----------- 

ln_c_2.beginX = ln_c.beginX + ((ln_c.endX - ln_c.beginX) / 4) * 3
ln_c_2.beginY = ln_a.beginY

ln_c_2.endX = ln_c_2.beginX
ln_c_2.endY = pb_c_2.Y

pb_c_2.X = ln_c_2.beginX - (pb_c_2.Width/2)


// ########################################

ln_d.beginX = pb_d.X + pb_d.Width
ln_d.beginY = (pb_d.Y + pb_d.Height/2)

ln_d.endX = pb_e.X
ln_d.endY = ln_d.beginY

ln_e.beginX = pb_e.X + pb_e.Width
ln_e.beginY = (pb_e.Y + pb_e.Height/2)

ln_e.endX = pb_f.X
ln_e.endY = ln_e.beginY

// ############################# Finales ################################# //

// finales por debajo

ln_a_2_exit.beginX = ln_a_2.beginX
ln_a_2_exit.beginY = pb_a_2.Y + pb_a_2.Height

ln_a_2_exit.endX = ln_a_2.beginX
ln_a_2_exit.endY = ln_a_2_exit.beginY  + 60


ln_b_2_exit.beginX = ln_b_2.beginX
ln_b_2_exit.beginY = pb_b_2.Y + pb_b_2.Height

ln_b_2_exit.endX = ln_b_2_exit.beginX
ln_b_2_exit.endY = ln_b_2_exit.beginY + 60

// ---------------

ln_e_bot.beginX = pb_f.X + (pb_f.Width /2)
ln_e_bot.beginY = pb_f.Y + pb_f.Height
ln_e_bot.endX = ln_e_bot.beginX
ln_e_bot.endY = ln_b_2_exit.endY

// -------

ln_bot_1.beginX = ln_b_2_exit.beginX
ln_bot_1.beginY = ln_b_2_exit.endY
ln_bot_1.endX = ln_e_bot.beginX
ln_bot_1.endY = ln_b_2_exit.endY

ln_bot_2.beginX = ln_a_2_exit.beginX
ln_bot_2.beginY = ln_b_2_exit.endY
ln_bot_2.endX = ln_b_2_exit.beginX
ln_bot_2.endY = ln_b_2_exit.endY

// Final por arriba

ln_e_top.beginX = pb_e.X + (pb_e.Width /2)
ln_e_top.beginY = pb_c_2.Y + (pb_c_2.Height /2)
ln_e_top.endX = ln_e_top.beginX
ln_e_top.endY = pb_f.Y

ln_c_2_exit.beginX = pb_c_2.X + pb_c_2.Width
ln_c_2_exit.beginY = ln_e_top.beginY

ln_c_2_exit.endX = ln_e_top.beginX
ln_c_2_exit.endY = ln_e_top.beginY

//inicio de pruebas ---> trabajando

ln_d_2.beginX = pb_d.X + (pb_d.Width /2)
ln_d_2.beginY =  pb_d.Y + pb_d.Height

ln_d_2.endX = ln_d_2.beginX
ln_d_2.endY = ln_d_2.beginY + 100

ln_d_4.beginX = pb_c.X + (pb_c.Width /2)
ln_d_4.beginY =  pb_c.Y + pb_c.Height

ln_d_4.endX = ln_d_4.beginX
ln_d_4.endY = ln_d_4.beginY + 100

ln_d_3.beginX = ln_d_4.beginX
ln_d_3.beginY = ln_d_2.endY

ln_d_3.endX = ln_d_2.beginX
ln_d_3.endY = ln_d_4.endY

// ##############################
// Retorno de pausas a trabajo

ln_c_2_top.beginX = ln_c_2.beginX
ln_c_2_top.beginY = pb_c_2.Y - 60
ln_c_2_top.endX = ln_c_2_top.beginX
ln_c_2_top.endY =  pb_c_2.Y

ln_c_1_top.beginX = ln_c_1.beginX
ln_c_1_top.beginY = pb_c_1.Y - 60
ln_c_1_top.endX = ln_c_1_top.beginX
ln_c_1_top.endY =  pb_c_1.Y

ln_c_top.beginX = ln_d_4.beginX
ln_c_top.beginY = ln_c_2_top.beginY
ln_c_top.endX = ln_c_top.beginX
ln_c_top.endY = pb_c.Y

ln_top_ok_1.beginX = ln_c_top.beginX
ln_top_ok_1.beginY = ln_c_2_top.beginY
ln_top_ok_1.endX = ln_c_1_top.endX
ln_top_ok_1.endY =  ln_top_ok_1.beginY

ln_top_ok_2.beginX = ln_c_1_top.beginX
ln_top_ok_2.beginY = ln_c_2_top.beginY
ln_top_ok_2.endX = ln_c_2_top.endX
ln_top_ok_2.endY =  ln_top_ok_1.beginY





end event

type ln_c_2 from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 3415
integer beginy = 372
integer endx = 3415
integer endy = 556
end type

type ln_c_1 from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 2857
integer beginy = 372
integer endx = 2857
integer endy = 556
end type

type pb_f from picturebutton within tabpage_estados
integer x = 5106
integer y = 468
integer width = 512
integer height = 216
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Cobrar"
boolean originalsize = true
string picturename = ".\iconos\png\greenButton.png"
string disabledname = ".\iconos\png\grayButton.png"
vtextalign vtextalign = vcenter!
long backcolor = 12639424
end type

event clicked;
if wf_cambiar_estado( 9, 1, This.text) <> 0 then return

r_current.event ue_select(This.X, This.Y, this.Classname())

dw_cabecera.SetItem(1, 'reparaciones_fin', today())
dw_cabecera.SetItem(1, 'reparaciones_vencimiento_garantia', RelativeDate( today(), 30))

wf_mandar_monto()

cb_1.post event clicked()

wf_mail(9)

wf_enviar_encuesta()

//ln_e.LineColor = il_gray
//
//pb_e.enabled = false

end event

type pb_e from picturebutton within tabpage_estados
integer x = 4475
integer y = 468
integer width = 512
integer height = 216
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Listo para retirar"
string picturename = ".\iconos\png\greenButton.png"
string disabledname = ".\iconos\png\grayButton.png"
vtextalign vtextalign = multiline!
long backcolor = 12639424
end type

event clicked;long ll_problema
string ls_solucion, ls_mensaje
boolean 	lbool_grabar = true

ls_mensaje = 'Debe completar'

ll_problema = dw_cabecera.GetItemNumber(1, 'reparaciones_reparaciones_prolema')
ls_solucion = dw_cabecera.GetItemString(1, 'soluciones_descripcion')

if ll_problema = 0 or isNull(ll_problema) then
	dw_cabecera.Modify("reparaciones_reparaciones_prolema.Background.Mode='0~tIf(getrow()=currentrow(),0,1)'")
	dw_cabecera.Modify("reparaciones_reparaciones_prolema.Background.Color='0~tIf(isnull(reparaciones_reparaciones_prolema),RGB(255, 179, 179),rgb(255,255,255))'")
	lbool_grabar = false
	ls_mensaje += ' descripción del problema'
end if 

if trim(ls_solucion, true) = '' or isNull(ls_solucion) then
	dw_cabecera.Modify("soluciones_descripcion.Background.Mode='0~tIf(getrow()=currentrow(),0,1)'")
	dw_cabecera.Modify("soluciones_descripcion.Background.Color='0~tIf(isnull(soluciones_descripcion),RGB(255, 179, 179),rgb(255,255,255))'")
	lbool_grabar = false
	if len(ls_mensaje) > 14 then ls_mensaje += ','
	ls_mensaje += ' solución'
end if 

if not lbool_grabar then 
	messagebox('Aviso!', ls_mensaje)
	return
end if 

if wf_cambiar_estado( 8, 1, This.text) <> 0 then return

r_current.event ue_select(This.X, This.Y, this.Classname())

wf_calcular_mano_obra()

wf_mail(8)

//ln_a_2_exit.LineColor = il_gray
//ln_bot_1.LineColor = il_gray
//ln_bot_2.LineColor = il_gray
//ln_e_bot.LineColor = il_gray
//
//ln_d.LineColor = il_gray
//ln_d_2.LineColor = il_gray
//ln_d_3.LineColor = il_gray
//ln_d_4.LineColor = il_gray
//
//ln_top_ok_1.LineColor = il_gray
//ln_top_ok_2.LineColor = il_gray
//ln_c_top.LineColor = il_gray
//ln_c_2_top.LineColor = il_gray
//
//ln_c_2_exit.LineColor = il_gray
//ln_e_top.LineColor = il_gray
//
//ln_e.LineColor = il_green
//
//pb_a_2.enabled = false
//pb_b_2.enabled = false
//pb_c_2.enabled = false
//pb_c.enabled = false
//pb_d.enabled = false
//pb_f.enabled = true









end event

type pb_d from picturebutton within tabpage_estados
integer x = 3845
integer y = 468
integer width = 512
integer height = 216
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Iniciar pruebas"
boolean originalsize = true
string picturename = ".\iconos\png\greenButton.png"
string disabledname = ".\iconos\png\grayButton.png"
vtextalign vtextalign = vcenter!
long backcolor = 12639424
end type

event clicked;
if wf_cambiar_estado( 7, 1, 'en pruebas') <> 0 then return

r_current.event ue_select(This.X, This.Y, this.Classname())

wf_mail(7)

//ln_c.LineColor = il_gray
//ln_c_1.LineColor = il_gray
//ln_c_2.LineColor = il_gray
//
//ln_d.LineColor = il_green
//ln_d_2.LineColor = il_green
//ln_d_3.LineColor = il_green
//ln_d_4.LineColor = il_green
//
//
//pb_c_1.enabled = false
//pb_c_2.enabled = false
//pb_e.enabled = true
//

end event

type pb_c_2 from picturebutton within tabpage_estados
integer x = 3186
integer y = 208
integer width = 512
integer height = 216
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Enviar a soporte externo"
string picturename = ".\iconos\png\yellowButton.png"
string disabledname = ".\iconos\png\grayButton.png"
vtextalign vtextalign = multiline!
long backcolor = 28573176
end type

event clicked;
if wf_cambiar_estado( 6, 1, 'en soporte externo') <> 0 then return

r_current.event ue_select(This.X, This.Y, this.Classname())



// il_green il_yellow il_gray il_red

//ln_c.LineColor = il_gray
//ln_c_1.LineColor = il_gray
//ln_c_2.LineColor = il_gray
//
//ln_top_ok_1.LineColor = il_green
//ln_top_ok_2.LineColor = il_green
//ln_c_top.LineColor = il_green
//ln_c_2_top.LineColor = il_green
//
//ln_c_2_exit.LineColor = il_red
//ln_e_top.LineColor = il_red
//
//pb_d.enabled = false
//pb_c_1.enabled = false
//pb_e.enabled = true

end event

type pb_c_1 from picturebutton within tabpage_estados
integer x = 2629
integer y = 208
integer width = 512
integer height = 216
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Pausar"
boolean originalsize = true
string picturename = ".\iconos\png\yellowButton.png"
string disabledname = ".\iconos\png\grayButton.png"
vtextalign vtextalign = vcenter!
long backcolor = 28573176
end type

event clicked;
if wf_cambiar_estado( 5, 1, 'pausado') <> 0 then return

r_current.event ue_select(This.X, This.Y, this.Classname())

wf_mail(5)

// il_green il_yellow il_gray

//ln_c.LineColor = il_gray
//ln_c_1.LineColor = il_gray
//ln_c_2.LineColor = il_gray
//
//ln_top_ok_1.LineColor = il_green
//ln_c_top.LineColor = il_green
//ln_c_1_top.LineColor = il_green
//
//
//pb_d.enabled = false
//pb_c_2.enabled = false
//pb_e.enabled = false

end event

type pb_c from picturebutton within tabpage_estados
integer x = 2075
integer y = 468
integer width = 512
integer height = 216
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Iniciar trabajo"
boolean originalsize = true
string picturename = ".\iconos\png\greenButton.png"
string disabledname = ".\iconos\png\grayButton.png"
vtextalign vtextalign = vcenter!
long backcolor = 12639424
end type

event clicked;

if pb_b.enabled or pb_c_1.enabled or pb_c_2.enabled then 
	if wf_cambiar_estado( 4, 1, 'trabajando') <> 0 then return
else
	if wf_cambiar_estado( 4, 4, 'trabajando') <> 0 then return
end if 

r_current.event ue_select(This.X, This.Y, this.Classname())

wf_mail(4)

//ln_c.LineColor = il_green
//ln_c_1.LineColor = il_yellow
//ln_c_2.LineColor = il_yellow
//
//ln_b.LineColor = il_gray
//ln_b_2.LineColor = il_gray
//
//ln_d.LineColor = il_gray
//ln_d_2.LineColor = il_gray
//ln_d_3.LineColor = il_gray
//ln_d_4.LineColor = il_gray
//
//ln_top_ok_1.LineColor = il_gray
//ln_c_top.LineColor = il_gray
//ln_c_1_top.LineColor = il_gray
//
//ln_top_ok_2.LineColor = il_gray
//ln_c_2_top.LineColor = il_gray
//
//ln_c_2_exit.LineColor = il_gray
//ln_e_top.LineColor = il_gray
//
//pb_b.enabled = false
//pb_b_2.enabled = false
//pb_d.enabled = true
//pb_c_1.enabled = true
//pb_c_2.enabled = true
//pb_e.enabled = false

end event

type pb_b_2 from picturebutton within tabpage_estados
integer x = 1582
integer y = 700
integer width = 512
integer height = 216
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Presupuesto no aprobado"
boolean originalsize = true
string picturename = ".\iconos\png\redButton.png"
string disabledname = ".\iconos\png\grayButton.png"
vtextalign vtextalign = multiline!
long backcolor = 28553471
end type

event clicked;
if wf_cambiar_estado( 8, 3, This.text) <> 0 then return

r_current.event ue_select(This.X, This.Y, this.Classname())

wf_calcular_mano_obra()

wf_mail(8)

//ln_b.LineColor = il_gray
//ln_b_2.LineColor = il_gray
//
//ln_b_2_exit.LineColor = il_red
//ln_bot_1.LineColor = il_red
//ln_e_bot.LineColor = il_red
//
//pb_b.enabled = false
//pb_c.enabled = false
//pb_e.enabled = true
end event

type pb_b from picturebutton within tabpage_estados
integer x = 1070
integer y = 468
integer width = 512
integer height = 216
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Comunicar Presupuesto"
string picturename = ".\iconos\png\greenButton.png"
string disabledname = ".\iconos\png\grayButton.png"
vtextalign vtextalign = multiline!
long backcolor = 12639424
end type

event clicked;
if wf_cambiar_estado( 3, 1, 'esperando aporbación de presupuesto') <> 0 then return

r_current.event ue_select(This.X, This.Y, this.Classname())

wf_mail(3)

wf_enviar_presupuesto()

//ln_b.LineColor = il_green
//ln_b_2.LineColor = il_red
//
//pb_a.enabled = false
//pb_a_2.enabled = false
//pb_c.enabled = true
//pb_b_2.enabled = true
//
//ln_a.LineColor = il_gray
//ln_a_2.LineColor = il_gray
end event

type pb_a_2 from picturebutton within tabpage_estados
integer x = 558
integer y = 700
integer width = 512
integer height = 216
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Reparacion imposible"
string picturename = ".\iconos\png\redButton.png"
string disabledname = ".\iconos\png\grayButton.png"
vtextalign vtextalign = multiline!
long backcolor = 28553471
end type

event clicked;// cambiar el estado

if wf_cambiar_estado( 8, 2, This.text) <> 0 then return

r_current.event ue_select(This.X, This.Y, this.Classname())

wf_calcular_mano_obra()

wf_mail(8)

//ln_a.LineColor = il_gray
//ln_a_2.LineColor = il_gray
//
//ln_a_2_exit.LineColor = il_red
//ln_bot_2.LineColor = il_red
//ln_bot_1.LineColor = il_red
//ln_e_bot.LineColor = il_red
//
//pb_b.enabled = false
//pb_a.enabled = false
//pb_e.enabled = true
end event

type pb_a from picturebutton within tabpage_estados
integer x = 46
integer y = 468
integer width = 512
integer height = 216
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Iniciar analisis preliminar"
boolean originalsize = true
string picturename = ".\iconos\png\greenButton.png"
string disabledname = ".\iconos\png\grayButton.png"
vtextalign vtextalign = multiline!
long backcolor = 12639424
end type

event clicked;// cambiar el estado

if wf_cambiar_estado( 2, 1, This.text) <> 0 then return

r_current.event ue_select(This.X, This.Y, this.Classname())

wf_mail(2)

//ln_a.LineColor = il_green
//ln_a_2.LineColor = il_red
//
//pb_b.enabled = true
//pb_a_2.enabled = true
end event

type ln_a from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 613
integer beginy = 468
integer endx = 1010
integer endy = 516
end type

type ln_a_2 from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 795
integer beginy = 460
integer endx = 823
integer endy = 644
end type

type ln_b_2 from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 1806
integer beginy = 412
integer endx = 1787
integer endy = 652
end type

type ln_b from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 1632
integer beginy = 464
integer endx = 2030
integer endy = 512
end type

type ln_c from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 2661
integer beginy = 504
integer endx = 3726
integer endy = 492
end type

type ln_d from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 4201
integer beginy = 488
integer endx = 4599
integer endy = 536
end type

type ln_a_2_exit from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 823
integer beginy = 820
integer endx = 850
integer endy = 1004
end type

type ln_b_2_exit from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 1824
integer beginy = 792
integer endx = 1851
integer endy = 976
end type

type ln_e_bot from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 4709
integer beginy = 620
integer endx = 4736
integer endy = 804
end type

type ln_bot_1 from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 1856
integer beginy = 936
integer endx = 4731
integer endy = 908
end type

type ln_e_top from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 4699
integer beginy = 180
integer endx = 4727
integer endy = 364
end type

type ln_c_2_exit from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 3680
integer beginy = 256
integer endx = 4686
integer endy = 224
end type

type ln_d_4 from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 2309
integer beginy = 600
integer endx = 2322
integer endy = 784
end type

type ln_d_2 from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 4064
integer beginy = 608
integer endx = 4082
integer endy = 756
end type

type ln_d_3 from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 2341
integer beginy = 788
integer endx = 4087
integer endy = 800
end type

type ln_c_top from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 2318
integer beginy = 220
integer endx = 2331
integer endy = 404
end type

type ln_top_ok_1 from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 1879
integer beginy = 92
integer endx = 2917
integer endy = 92
end type

type ln_c_2_top from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 3401
integer beginy = 80
integer endx = 3415
integer endy = 264
end type

type ln_c_1_top from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 2894
integer beginy = 128
integer endx = 2907
integer endy = 312
end type

type ln_e from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 4896
integer beginy = 640
integer endx = 5294
integer endy = 688
end type

type r_current from rectangle within tabpage_estados
event ue_select ( long al_x,  long al_y,  string as_name )
boolean visible = false
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 16777215
integer x = 23
integer y = 392
integer width = 549
integer height = 252
end type

event ue_select(long al_x, long al_y, string as_name);this.visible = true

this.X = al_X - 20
this.Y = al_Y - 20

event ue_clicked(as_name)
end event

type ln_bot_2 from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 864
integer beginy = 936
integer endx = 1792
integer endy = 904
end type

type ln_top_ok_2 from line within tabpage_estados
long linecolor = 134217728
integer linethickness = 10
integer beginx = 3022
integer beginy = 52
integer endx = 4059
integer endy = 52
end type

type dw_estados from datawindow within tabpage_estados
boolean visible = false
integer x = 37
integer y = 32
integer width = 5586
integer height = 1052
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_list_reparaciones_estados"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(SQLCA)
end event

type tabpage_info from userobject within tab_detalles
integer x = 18
integer y = 116
integer width = 5623
integer height = 1128
long backcolor = 67108864
string text = "Información adicional"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_cliente dw_cliente
dw_equipo dw_equipo
st_hora st_hora
st_horas st_horas
gb_equipo gb_equipo
gb_cliente gb_cliente
gb_hora gb_hora
gb_1 gb_1
end type

on tabpage_info.create
this.dw_cliente=create dw_cliente
this.dw_equipo=create dw_equipo
this.st_hora=create st_hora
this.st_horas=create st_horas
this.gb_equipo=create gb_equipo
this.gb_cliente=create gb_cliente
this.gb_hora=create gb_hora
this.gb_1=create gb_1
this.Control[]={this.dw_cliente,&
this.dw_equipo,&
this.st_hora,&
this.st_horas,&
this.gb_equipo,&
this.gb_cliente,&
this.gb_hora,&
this.gb_1}
end on

on tabpage_info.destroy
destroy(this.dw_cliente)
destroy(this.dw_equipo)
destroy(this.st_hora)
destroy(this.st_horas)
destroy(this.gb_equipo)
destroy(this.gb_cliente)
destroy(this.gb_hora)
destroy(this.gb_1)
end on

type dw_cliente from datawindow within tabpage_info
integer x = 2254
integer y = 132
integer width = 2094
integer height = 920
integer taborder = 30
string title = "none"
string dataobject = "dw_abm_clientes_v2"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;messagebox('Error',sqlerrtext)
end event

event constructor;this.settransobject(sqlca)
this.insertrow(0)
end event

event itemchanged;
if dwo.name = 'clientes_codigo' then
	this.Retrieve(long(data))
	
	dw_cabecera.SetItem(1, 'clientes_codigo', long(data))
	
	wf_refresh_dddw('clientes_codigo', long(data))
		
end if 
end event

event buttonclicked;long ll_estado, ll_codigo 
DatawindowChild ldwC_proveedores


if dwo.name = 'b_1' then 

	ll_codigo = this.GetItemNumber(1,'clientes_codigo')
	
	// se refresca la dddw para que aparezca el proveedor
	this.GetChild( 'clientes_codigo', ldwC_proveedores)
	ldwC_proveedores.SetTransObject(SQLCA)
	
	if ldwC_proveedores.Retrieve() < 0 then
		ROLLBACK USING SQLCA;
		return
	end if
	COMMIT USING SQLCA;
	
	dw_cabecera.SetItem(1, 'clientes_codigo', ll_codigo)
	this.enabled = true

	
end if 

if dwo.name = 'b_correo' then 

	SELECT TOP 1 ESTADOS_CODIGO
	into :ll_estado
	FROM REPARACIONES_ESTADOS
	WHERE REPARACIONES_CODIGO = :il_codigo
	ORDER BY REPA_ESTA_FECHA DESC
	COMMIT USING SQLCA;
	
	if ll_estado = 6 then return
	
	wf_mail(ll_estado)
end if
end event

type dw_equipo from datawindow within tabpage_info
integer x = 114
integer y = 132
integer width = 2011
integer height = 920
integer taborder = 20
string title = "none"
string dataobject = "dw_abm_equipos"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;messagebox('Error',sqlerrtext)
end event

event constructor;this.settransobject(sqlca)
this.insertrow(0)
end event

event itemchanged;if dwo.name = 'equipos_codigo' then
	this.Retrieve(long(data))
	
	dw_cabecera.SetItem(1, 'equipos_codigo', long(data))
	
	wf_refresh_dddw('equipos_codigo', long(data))
	
end if 
end event

event buttonclicked;long ll_codigo
DatawindowChild ldwC_proveedores

if dwo.name <> 'b_guardar' then return

ll_codigo = this.GetItemNumber(1,'equipos_codigo')

// se refresca la dddw para que aparezca el proveedor
this.GetChild( 'equipos_codigo', ldwC_proveedores)
ldwC_proveedores.SetTransObject(SQLCA)

if ldwC_proveedores.Retrieve() < 0 then
	ROLLBACK USING SQLCA;
	return
end if
COMMIT USING SQLCA;

dw_cabecera.SetItem(1, 'equipos_codigo', ll_codigo)
this.enabled = true

end event

type st_hora from statictext within tabpage_info
integer x = 4731
integer y = 836
integer width = 709
integer height = 136
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "00:00 "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_horas from statictext within tabpage_info
integer x = 4777
integer y = 232
integer width = 576
integer height = 136
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "00 Horas"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_equipo from groupbox within tabpage_info
integer x = 73
integer y = 56
integer width = 2080
integer height = 1032
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Equipo"
end type

type gb_cliente from groupbox within tabpage_info
integer x = 2203
integer y = 56
integer width = 2226
integer height = 1032
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cliente"
end type

type gb_hora from groupbox within tabpage_info
integer x = 4539
integer y = 56
integer width = 1051
integer height = 424
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tiempo Transcurrido"
end type

type gb_1 from groupbox within tabpage_info
integer x = 4539
integer y = 664
integer width = 1051
integer height = 424
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hora"
end type

type mle_descripcion from multilineedit within w_abm_reparaciones_v2
boolean visible = false
integer x = 850
integer y = 456
integer width = 1966
integer height = 248
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
end type

type mle_problema from multilineedit within w_abm_reparaciones_v2
boolean visible = false
integer x = 850
integer y = 724
integer width = 1966
integer height = 248
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
end type

type mle_solucion from multilineedit within w_abm_reparaciones_v2
boolean visible = false
integer x = 846
integer y = 992
integer width = 1975
integer height = 248
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
end type

type uo_email from uo_envio_email within w_abm_reparaciones_v2 descriptor "pb_nvo" = "true" 
event create ( )
event destroy ( )
end type

on uo_email.create
call super::create
end on

on uo_email.destroy
call super::destroy
end on

