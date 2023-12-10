$PBExportHeader$w_abm_compras.srw
forward
global type w_abm_compras from w_abm_cyd_base
end type
end forward

global type w_abm_compras from w_abm_cyd_base
integer width = 2592
integer height = 2312
string title = "Compras"
end type
global w_abm_compras w_abm_compras

type variables
long il_codigo
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

on w_abm_compras.create
call super::create
end on

on w_abm_compras.destroy
call super::destroy
end on

type cb_2 from w_abm_cyd_base`cb_2 within w_abm_compras
integer x = 1755
integer y = 2076
end type

type cb_1 from w_abm_cyd_base`cb_1 within w_abm_compras
integer x = 2153
integer y = 2076
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

type dw_detalle from w_abm_cyd_base`dw_detalle within w_abm_compras
integer y = 452
integer width = 2560
string dataobject = "dw_abm_compras_det"
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
ldwC_componentes.SetFilter('componentes_codigo<>17 and componentes_codigo<>18')
ldwC_componentes.Filter()
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

type dw_cabecera from w_abm_cyd_base`dw_cabecera within w_abm_compras
integer width = 2560
integer height = 440
string dataobject = "dw_abm_compras"
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

