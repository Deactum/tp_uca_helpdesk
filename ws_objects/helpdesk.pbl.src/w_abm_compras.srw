$PBExportHeader$w_abm_compras.srw
forward
global type w_abm_compras from w_abm_cyd_base
end type
end forward

global type w_abm_compras from w_abm_cyd_base
integer width = 2615
integer height = 2312
end type
global w_abm_compras w_abm_compras

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

type dw_detalle from w_abm_cyd_base`dw_detalle within w_abm_compras
integer y = 452
integer width = 2560
string dataobject = "dw_abm_compras_det"
boolean vscrollbar = true
end type

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
	
	// se refresca la dddw para que aparezca el proveedor
	this.GetChild('proveedores_codigo', ldwC_proveedores)
	ldwC_proveedores.SetTransObject(SQLCA)
	
	if ldwC_proveedores.Retrieve() < 0 then
		ROLLBACK USING SQLCA;
		return
	end if
	COMMIT USING SQLCA;
	
	this.SetItem(1, 'proveedores_codigo', ll_proveedor_cod)
	this.enabled = true
	
end if 

if dwo.name  = 'b_edit' then
	openWithParm(dw_abm_proveedores, this.GetItemNumber(1, 'proveedores_codigo'))
end if 
end event

