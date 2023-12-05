﻿$PBExportHeader$w_abm_reparaciones_v2.srw
forward
global type w_abm_reparaciones_v2 from w_abm_cyd_base
end type
type gb_repa from groupbox within w_abm_reparaciones_v2
end type
type gb_problema from groupbox within w_abm_reparaciones_v2
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
end type
type tabpage_info from userobject within tab_detalles
end type
type dw_cliente from datawindow within tabpage_info
end type
type dw_equipo from datawindow within tabpage_info
end type
type st_1 from statictext within tabpage_info
end type
type st_minutos from statictext within tabpage_info
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
st_1 st_1
st_minutos st_minutos
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
end forward

global type w_abm_reparaciones_v2 from w_abm_cyd_base
integer width = 5774
integer height = 2840
gb_repa gb_repa
gb_problema gb_problema
gb_comp gb_comp
tab_detalles tab_detalles
end type
global w_abm_reparaciones_v2 w_abm_reparaciones_v2

type variables
long il_codigo

long il_red = 28553471
long il_green = 12639424
long il_yellow = 28573176
long il_gray = 134217728

end variables

forward prototypes
public function integer wf_refresh_proveedores (integer al_proveedor)
public subroutine wf_get_codigo ()
end prototypes

public function integer wf_refresh_proveedores (integer al_proveedor);DatawindowChild ldwC_proveedores

// se refresca la dddw para que aparezca el proveedor
dw_cabecera.GetChild('proveedores_codigo', ldwC_proveedores)
ldwC_proveedores.SetTransObject(SQLCA)

if ldwC_proveedores.Retrieve() < 0 then
	ROLLBACK USING SQLCA;
	return -1
end if
COMMIT USING SQLCA;

dw_cabecera.SetItem(1, 'proveedores_codigo', al_proveedor)
dw_cabecera.enabled = true

return 0
end function

public subroutine wf_get_codigo ();SELECT TOP 1 COMPRAS_CODIGO
INTO :il_codigo
FROM COMPRAS
ORDER BY COMPRAS_CODIGO DESC
COMMIT USING SQLCA;

il_codigo += 1
end subroutine

on w_abm_reparaciones_v2.create
int iCurrent
call super::create
this.gb_repa=create gb_repa
this.gb_problema=create gb_problema
this.gb_comp=create gb_comp
this.tab_detalles=create tab_detalles
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_repa
this.Control[iCurrent+2]=this.gb_problema
this.Control[iCurrent+3]=this.gb_comp
this.Control[iCurrent+4]=this.tab_detalles
end on

on w_abm_reparaciones_v2.destroy
call super::destroy
destroy(this.gb_repa)
destroy(this.gb_problema)
destroy(this.gb_comp)
destroy(this.tab_detalles)
end on

event open;//ancestro anulado
long ll_codigo, ll_row, ll_aux, ll_cliente, ll_equipo
string ls_codigo, ls_aux

ls_aux = message.stringparm

ll_aux = pos(ls_aux, ',') - 1

ls_codigo = mid(ls_aux, 1, ll_aux)

if mid(ls_codigo, ll_aux) = 'yes' then dw_cabecera.modify('usuarios_codigo.protected=true')

if ll_codigo>0 then 
	ll_row = dw_cabecera.retrieve(ll_codigo)
	
	if ll_row >0 then 
		dw_detalle.retrieve(ll_codigo)
	end if
	
elseif len(ls_codigo)>0 then 
	ll_row = dw_cabecera.retrieve(ls_codigo)
	
	if ll_row>0 then 
		dw_detalle.retrieve(ls_codigo)
		ll_cliente = dw_cabecera.GetItemNumber(1, 'clientes_codigo')
		ll_equipo = dw_cabecera.GetItemNumber(1, 'equipos_codigo')
		
		tab_detalles.tabpage_info.dw_cliente.Retrieve(ll_cliente)
		tab_detalles.tabpage_info.dw_equipo.Retrieve(ll_equipo)
		
		
		
	end if
	
end if
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
long ll_counter
long ll_inserted
datastore lds_componentes

long ll_codigo
string ls_sk
string ls_nombre
long ll_cantidad
long ll_precio

dw_detalle.AcceptText()

wf_get_codigo()

// se copia el total a la cabeza
dw_cabecera.SetItem(1, 'compras_monto', dw_detalle.GetItemNumber(1, 'c_gran_total'))
dw_cabecera.SetItem(1, 'compras_codigo', string(il_codigo))

lds_componentes = Create datastore
lds_componentes.DataObject = 'dw_ds_componentes'
lds_componentes.SetTransObject(SQLCA)

// recorre todas las filas limpiando la basura (campos incompletos) y
// aquellas que tengan 0 como codigo de item, inserta y pone el codigo retornado en el componente codigo
for ll_counter = dw_detalle.RowCount() to 1 step -1
	dw_detalle.SetItem(ll_counter, 'compras_codigo', string(il_codigo))
	
	ll_codigo =		dw_detalle.GetItemNumber(ll_counter, 'componentes_codigo')
	ls_sk = 			dw_detalle.GetItemString(ll_counter, 'componentes_componentes_sk')
	ls_nombre =	dw_detalle.GetItemString(ll_counter, 'componentes_componentes_nombre')
	ll_cantidad = 	dw_detalle.GetItemNumber(ll_counter, 'compo_compr_cantidad')
	ll_precio =		dw_detalle.GetItemNumber(ll_counter, 'compo_compr_precio_compra')
	
	if isNull(ll_codigo) or isNull(ls_sk) or isNull(ll_cantidad) or isNull(ll_precio) then
		dw_detalle.DeleteRow(ll_counter)
	elseif trim(ls_sk, true) = '' or ll_cantidad = 0 or ll_precio = 0 then
		dw_detalle.DeleteRow(ll_counter)
	elseif ll_codigo = 0 and isNull(ls_nombre) then 
		dw_detalle.DeleteRow(ll_counter)
	elseif ll_codigo = 0 then
		lds_componentes.Reset()
		lds_componentes.InsertRow(0)
		lds_componentes.SetItem(1, 'componentes_nombre', ls_nombre)
		lds_componentes.SetItem(1, 'componentes_sk', ls_sk)
		
		lds_componentes.AcceptText()
		
		if lds_componentes.Update(True, False) = 1 then
			COMMIT USING SQLCA;
			
			SELECT TOP 1 COMPONENTES_CODIGO
			INTO :ll_inserted		
			FROM COMPONENTES
			ORDER BY COMPONENTES_CODIGO DESC
			COMMIT USING SQLCA;
			
			dw_detalle.SetItem(ll_counter, 'componentes_codigo', ll_inserted)
		else 
			dw_detalle.DeleteRow(ll_counter)
		end if 
		
	end if 

next

Destroy lds_componentes 
if f_grabar_cabecera_detalle(dw_cabecera,dw_detalle) <> -1 then cb_2.event clicked()

end event

type dw_detalle from w_abm_cyd_base`dw_detalle within w_abm_reparaciones_v2
integer x = 3067
integer y = 160
integer width = 2560
integer height = 508
string dataobject = "dw_abm_reparaciones_det"
boolean vscrollbar = true
end type

event dw_detalle::constructor;call super::constructor;DatawindowChild ldwC_componentes
long ll_inserted

this.GetChild('componentes_codigo', ldwC_componentes)
ldwC_componentes.SetTransObject(SQLCA)

if ldwC_componentes.Retrieve() < 0 then
	ROLLBACK USING SQLCA;
	return
end if
COMMIT USING SQLCA;

ll_inserted = ldwC_componentes.InsertRow(0)
ldwC_componentes.SetItem(ll_inserted, 'componentes_codigo', 0)
ldwC_componentes.SetItem(ll_inserted, 'componentes_nombre', '(Nuevo)')
ldwC_componentes.SetSort('componentes_codigo A')
ldwC_componentes.AcceptText()
ldwC_componentes.Sort()

end event

event dw_detalle::itemchanged;call super::itemchanged;if dwo.name <> 'componentes_codigo' then return


if data = '0' then
	This.SetColumn('componentes_componentes_nombre')
	return
end if 

datastore lds_componentes

lds_componentes = Create datastore
lds_componentes.DataObject = 'dw_ds_componentes'
lds_componentes.SetTransObject(SQLCA)

if lds_componentes.Retrieve(long(data)) > 0 then
	COMMIT USING SQLCA;
	
	dw_detalle.SetItem(row, 'componentes_componentes_sk', lds_componentes.GetItemString(1, 'componentes_sk'))
	dw_detalle.SetItem(row, 'compo_compr_precio_compra', lds_componentes.GetItemNumber(1, 'componentes_precio_compra'))
	
end if 
ROLLBACK USING SQLCA;
end event

type dw_cabecera from w_abm_cyd_base`dw_cabecera within w_abm_reparaciones_v2
integer x = 151
integer y = 128
integer width = 2688
integer height = 1040
string dataobject = "dw_abm_reparaciones_v2"
end type

event dw_cabecera::buttonclicked;call super::buttonclicked;long ll_proveedor_cod
datawindowChild ldwC_proveedores

// se carga uno nuevo, que sera el de mayor numero
if dwo.name  = 'b_new' then
	open(dw_abm_proveedores)
	
	if Message.DoubleParm <> 0 then return

	this.enabled = false

	SELECT TOP 1 PROVEEDORES_CODIGO
	INTO :ll_proveedor_cod
	FROM PROVEEDORES	
	ORDER BY PROVEEDORES_CODIGO DESC
	COMMIT USING SQLCA;
	
	if wf_refresh_proveedores(ll_proveedor_cod) = -1 then return
	
end if 

if dwo.name  = 'b_edit' then
	ll_proveedor_cod = this.GetItemNumber(1, 'proveedores_codigo')
	
	openWithParm(dw_abm_proveedores, string(ll_proveedor_cod))
	
	this.enabled = false
	
	if wf_refresh_proveedores(ll_proveedor_cod) = -1 then return
	
end if 
end event

type gb_repa from groupbox within w_abm_reparaciones_v2
integer x = 32
integer y = 24
integer width = 2885
integer height = 1176
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

type gb_problema from groupbox within w_abm_reparaciones_v2
integer x = 2976
integer y = 780
integer width = 2720
integer height = 444
integer taborder = 130
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Problema"
end type

type gb_comp from groupbox within w_abm_reparaciones_v2
integer x = 2981
integer y = 24
integer width = 2720
integer height = 732
integer taborder = 40
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Componentes"
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
end type

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
this.ln_top_ok_2}
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

ln_e_bot.beginX = pb_e.X + (pb_e.Width /2)
ln_e_bot.beginY = pb_e.Y + pb_e.Height

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

ln_e_top.beginX = ln_e_bot.beginX
ln_e_top.beginY = pb_c_2.Y + (pb_c_2.Height /2)

ln_e_top.endX = ln_e_bot.beginX
ln_e_top.endY = pb_e.Y

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
integer y = 408
integer width = 485
integer height = 192
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
vtextalign vtextalign = vcenter!
long backcolor = 12639424
end type

event clicked;r_current.event ue_select(This.X, This.Y)

ln_e.LineColor = il_gray

pb_e.enabled = false

end event

type pb_e from picturebutton within tabpage_estados
integer x = 4475
integer y = 408
integer width = 485
integer height = 192
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
boolean originalsize = true
vtextalign vtextalign = multiline!
long backcolor = 12639424
end type

event clicked;r_current.event ue_select(This.X, This.Y)


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









end event

type pb_d from picturebutton within tabpage_estados
integer x = 3845
integer y = 408
integer width = 485
integer height = 192
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
vtextalign vtextalign = vcenter!
long backcolor = 12639424
end type

event clicked;r_current.event ue_select(This.X, This.Y)


ln_c.LineColor = il_gray
ln_c_1.LineColor = il_gray
ln_c_2.LineColor = il_gray

ln_d.LineColor = il_green
ln_d_2.LineColor = il_green
ln_d_3.LineColor = il_green
ln_d_4.LineColor = il_green


pb_c_1.enabled = false
pb_c_2.enabled = false
pb_e.enabled = true


end event

type pb_c_2 from picturebutton within tabpage_estados
integer x = 3186
integer y = 172
integer width = 485
integer height = 192
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
boolean originalsize = true
vtextalign vtextalign = multiline!
long backcolor = 28573176
end type

event clicked;r_current.event ue_select(This.X, This.Y)

// il_green il_yellow il_gray il_red

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
pb_c_1.enabled = false
pb_e.enabled = true

end event

type pb_c_1 from picturebutton within tabpage_estados
integer x = 2629
integer y = 172
integer width = 485
integer height = 192
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
vtextalign vtextalign = vcenter!
long backcolor = 28573176
end type

event clicked;r_current.event ue_select(This.X, This.Y)

// il_green il_yellow il_gray

ln_c.LineColor = il_gray
ln_c_1.LineColor = il_gray
ln_c_2.LineColor = il_gray

ln_top_ok_1.LineColor = il_green
ln_c_top.LineColor = il_green
ln_c_1_top.LineColor = il_green


pb_d.enabled = false
pb_c_2.enabled = false
pb_e.enabled = false

end event

type pb_c from picturebutton within tabpage_estados
integer x = 2075
integer y = 408
integer width = 485
integer height = 192
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
vtextalign vtextalign = vcenter!
long backcolor = 12639424
end type

event clicked;r_current.event ue_select(This.X, This.Y)

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

end event

type pb_b_2 from picturebutton within tabpage_estados
integer x = 1582
integer y = 652
integer width = 485
integer height = 192
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
vtextalign vtextalign = multiline!
long backcolor = 28553471
end type

event clicked;r_current.event ue_select(This.X, This.Y)

ln_b.LineColor = il_gray
ln_b_2.LineColor = il_gray

ln_b_2_exit.LineColor = il_red
ln_bot_1.LineColor = il_red
ln_e_bot.LineColor = il_red

pb_b.enabled = false
pb_c.enabled = false
pb_e.enabled = true
end event

type pb_b from picturebutton within tabpage_estados
integer x = 1070
integer y = 408
integer width = 485
integer height = 192
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
boolean originalsize = true
vtextalign vtextalign = multiline!
long backcolor = 12639424
end type

event clicked;r_current.event ue_select(This.X, This.Y)

ln_b.LineColor = il_green
ln_b_2.LineColor = il_red

pb_a.enabled = false
pb_a_2.enabled = false
pb_c.enabled = true
pb_b_2.enabled = true

ln_a.LineColor = il_gray
ln_a_2.LineColor = il_gray
end event

type pb_a_2 from picturebutton within tabpage_estados
integer x = 558
integer y = 652
integer width = 485
integer height = 192
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
boolean originalsize = true
vtextalign vtextalign = multiline!
long backcolor = 28553471
end type

event clicked;// cambiar el estado

r_current.event ue_select(This.X, This.Y)

ln_a.LineColor = il_gray
ln_a_2.LineColor = il_gray

ln_a_2_exit.LineColor = il_red
ln_bot_2.LineColor = il_red
ln_bot_1.LineColor = il_red
ln_e_bot.LineColor = il_red

pb_b.enabled = false
pb_a.enabled = false
pb_e.enabled = true
end event

type pb_a from picturebutton within tabpage_estados
integer x = 46
integer y = 408
integer width = 485
integer height = 192
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Iniciar analisis preliminar"
boolean originalsize = true
vtextalign vtextalign = multiline!
long backcolor = 12639424
end type

event clicked;// cambiar el estado

r_current.event ue_select(This.X, This.Y)

ln_a.LineColor = il_green
ln_a_2.LineColor = il_red

pb_b.enabled = true
pb_a_2.enabled = true
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
event ue_select ( long al_x,  long al_y )
boolean visible = false
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 16777215
integer x = 23
integer y = 392
integer width = 530
integer height = 236
end type

event ue_select(long al_x, long al_y);this.visible = true

this.X = al_X - 20
this.Y = al_Y - 20
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
st_1 st_1
st_minutos st_minutos
st_horas st_horas
gb_equipo gb_equipo
gb_cliente gb_cliente
gb_hora gb_hora
gb_1 gb_1
end type

on tabpage_info.create
this.dw_cliente=create dw_cliente
this.dw_equipo=create dw_equipo
this.st_1=create st_1
this.st_minutos=create st_minutos
this.st_horas=create st_horas
this.gb_equipo=create gb_equipo
this.gb_cliente=create gb_cliente
this.gb_hora=create gb_hora
this.gb_1=create gb_1
this.Control[]={this.dw_cliente,&
this.dw_equipo,&
this.st_1,&
this.st_minutos,&
this.st_horas,&
this.gb_equipo,&
this.gb_cliente,&
this.gb_hora,&
this.gb_1}
end on

on tabpage_info.destroy
destroy(this.dw_cliente)
destroy(this.dw_equipo)
destroy(this.st_1)
destroy(this.st_minutos)
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

type st_1 from statictext within tabpage_info
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
alignment alignment = Center!
boolean focusrectangle = false
end type

type st_minutos from statictext within tabpage_info
integer x = 4805
integer y = 252
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
string text = "00 Minutos"
boolean focusrectangle = false
end type

type st_horas from statictext within tabpage_info
integer x = 4805
integer y = 132
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

