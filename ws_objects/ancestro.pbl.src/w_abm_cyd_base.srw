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
boolean minbox = false
boolean maxbox = false
windowtype windowtype = response!
windowstate windowstate = normal!
cb_2 cb_2
cb_1 cb_1
dw_detalle dw_detalle
dw_cabecera dw_cabecera
end type
global w_abm_cyd_base w_abm_cyd_base

forward prototypes
public function long wf_asigna_clave ()
end prototypes

public function long wf_asigna_clave ();//asigna la clave de tipo numerico a las dw 
string ls_column, ls_tabla, ls_query, ls_error
long ll_i, ll_row, ll_clave, ll_ret
datastore lds_datos
lds_datos = create datastore
ls_column=dw_cabecera.describe('#' + string(1) + '.name')
ls_tabla =  f_nombre_tabla(dw_cabecera)
ls_query = 'select max('+ ls_column+' from '+ ls_tabla
ls_query = sqlca.syntaxfromsql( ls_query,'',ls_error)
if len(ls_error)>0 then 
	messagebox('Error', 'No se ha podido asignar la clave',stopsign!)
	ll_ret = -1
else
	lds_datos.create(ls_query)
	lds_datos.settransobject(SQLCA)
	lds_datos.retrieve()
	ll_clave = lds_datos.getitemnumber( 1,1)
	ll_row = dw_detalle.rowcount()
	dw_detalle.setitem(1, 1,ll_clave)
	for ll_i = 1 to ll_row
		dw_detalle.setitem( ll_i, 1, ll_clave)
	next 
	ll_ret = 1
end if
return ll_ret


end function

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

event open;call super::open;long ll_codigo, ll_row
string ls_codigo
ll_codigo =  message.doubleparm
ls_codigo = message.stringparm
if ll_codigo>0 then 
	ll_row = dw_cabecera.retrieve(ll_codigo)
	if ll_row >0 then 
		dw_detalle.retrieve(ll_codigo)
	end if
elseif len(ls_codigo)>0 then 
	ll_row = dw_cabecera.retrieve(ls_codigo)
	if ll_row>0 then 
		dw_detalle.retrieve(ls_codigo)
	end if
end if
end event

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

event clicked;call super::clicked;if f_validacion(dw_detalle) = 1 and f_validacion(dw_cabecera) = 1 then 
	if wf_asigna_clave() = 1 then  f_grabar_cabecera_detalle(dw_cabecera,dw_detalle)
end if
end event

type dw_detalle from dw_list within w_abm_cyd_base
event pbm_dwnkey pbm_dwnkey
integer y = 592
integer width = 2181
integer taborder = 20
end type

event pbm_dwnkey;if key = KeyEnter! then
	
	if this.GetSelectedRow(0) = this.RowCount() then 
		this.insertRow(this.RowCount() + 1)
	else
		this.ScrollToRow ( this.GetSelectedRow(0) )
	end if 

end if
end event

event constructor;call super::constructor;this.insertrow(0)
end event

type dw_cabecera from dw_abm within w_abm_cyd_base
integer taborder = 10
end type

