$PBExportHeader$uo_grilla_base.sru
forward
global type uo_grilla_base from userobject
end type
type uo_desp from uo_desplazador within uo_grilla_base
end type
type uo_control from uo_contrloles within uo_grilla_base
end type
type st_pagina from statictext within uo_grilla_base
end type
type uo_1 from u_searchbox within uo_grilla_base
end type
type dw_datos from dw_list within uo_grilla_base
end type
type st_titulo from statictext within uo_grilla_base
end type
end forward

global type uo_grilla_base from userobject
integer width = 3643
integer height = 2024
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_size pbm_size
event ue_init ( )
uo_desp uo_desp
uo_control uo_control
st_pagina st_pagina
uo_1 uo_1
dw_datos dw_datos
st_titulo st_titulo
end type
global uo_grilla_base uo_grilla_base

type variables
private long il_pagina = 0
private long il_registros = 100
private long il_total_registros = 1000
private string is_busqueda = '%%'
string is_titulo 
string is_alta, is_baja, is_modificacion 
end variables
forward prototypes
public function long get_pagina ()
public subroutine set_pagina (long al_pagina)
public function long get_registros ()
public subroutine set_registros (long al_registros)
public subroutine of_mensaje_paginacion ()
public function long get_total_registros ()
public subroutine set_total_registros (long al_total_registros)
public subroutine of_contar_registros ()
public subroutine of_desplazar ()
public subroutine of_salir ()
public subroutine set_busqueda (string as_busqueda)
public function string get_busqueda ()
public function string of_replace (string as_syntax, string as_texto, string as_remplazo)
end prototypes

event ue_size;st_titulo.width =  this.width - 10
uo_control.x = this.width - uo_control.width
dw_datos.width =  this.width -10
dw_datos.height =  this.height - dw_datos.y - 400
st_pagina.y =  this.height -300
uo_desp.y = this.height - 400
uo_desp.x = this.width - uo_desp.width
end event

event ue_init();st_titulo.text = upper(is_titulo)
this.text = is_titulo
of_contar_registros()
uo_control.event ue_actualizar( )

end event

public function long get_pagina ();return il_pagina
end function

public subroutine set_pagina (long al_pagina);il_pagina = al_pagina
end subroutine

public function long get_registros ();return il_registros
end function

public subroutine set_registros (long al_registros);il_registros = al_registros 
end subroutine

public subroutine of_mensaje_paginacion ();long ll_inicio, ll_final

if get_pagina() = 0 then 
	ll_inicio = 1
else
	ll_inicio = get_pagina()*get_registros()
end if
ll_final = (get_pagina()*get_registros())+get_registros()
if ll_final > get_total_registros() then ll_final = get_total_registros()
st_pagina.text =  'Mostrando del ' + string(ll_inicio) +' al ' + string(ll_final ) + ' de ' +  string (get_total_registros())+' registros'
end subroutine

public function long get_total_registros ();return il_total_registros
end function

public subroutine set_total_registros (long al_total_registros);il_total_registros  = al_total_registros
end subroutine

public subroutine of_contar_registros ();//cuenta la cantidad de registros de una tabla 

string ls_syntax
string ls_from 
string ls_where
int ll_pos
int ll_len
int li_val

ls_syntax = lower(dw_datos.describe("DataWindow.table.select"))
ll_len = len(ls_syntax)
ll_pos = pos(ls_syntax,'from') +4
ls_from = mid(ls_syntax,ll_pos,ll_len)
ll_pos = pos(ls_from,'where')-1
if ll_pos >0 then 
	ls_from = mid(ls_from,1,ll_pos)
	ll_pos = pos(ls_syntax,'where') + 5
	ls_where = Mid(ls_syntax,ll_pos,ll_len)
	ll_pos = pos(ls_where,'order by')-1
	ls_where = mid(ls_where,1,ll_pos)
	ls_syntax = 'select count(*) from ' + ls_from+ 'where ' + ls_where
	ls_syntax = of_replace(ls_syntax,':busqueda', "'"+get_busqueda()+"'")
else
	ll_pos = pos(ls_from,'order by')-1
	ls_from = mid(ls_from,1,ll_pos)
	ls_syntax = 'select count(*) from ' + ls_from
end if

DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA;
PREPARE SQLSA FROM :ls_syntax USING SQLCA ;
OPEN DYNAMIC my_cursor ;	
FETCH my_cursor INTO :li_val ;
CLOSE my_cursor;

set_total_registros(li_val)

end subroutine

public subroutine of_desplazar ();long ll_paginas 
long ll_i
ll_paginas =  round(get_total_registros() / get_registros(),0)
uo_desp.em_1.minmax = '1~~' +string(ll_paginas)
uo_desp.em_1.text = string(get_pagina()+1)
end subroutine

public subroutine of_salir ();parent.triggerevent('ue_cerrar_tab')
end subroutine

public subroutine set_busqueda (string as_busqueda);is_busqueda = as_busqueda
end subroutine

public function string get_busqueda ();return is_busqueda		
end function

public function string of_replace (string as_syntax, string as_texto, string as_remplazo);string ls_ret
long ll_pos, ll_len,ll_i
ll_len = len(as_syntax)
ls_ret = as_syntax
for ll_i = 1 to ll_len
	ll_pos = pos(ls_ret,as_texto)
	if ll_pos >0 then 
		ls_ret = replace(ls_ret,ll_pos,9,as_remplazo)
	else
		ll_i = ll_len
	end if
next 
return ls_ret 
end function

on uo_grilla_base.create
this.uo_desp=create uo_desp
this.uo_control=create uo_control
this.st_pagina=create st_pagina
this.uo_1=create uo_1
this.dw_datos=create dw_datos
this.st_titulo=create st_titulo
this.Control[]={this.uo_desp,&
this.uo_control,&
this.st_pagina,&
this.uo_1,&
this.dw_datos,&
this.st_titulo}
end on

on uo_grilla_base.destroy
destroy(this.uo_desp)
destroy(this.uo_control)
destroy(this.st_pagina)
destroy(this.uo_1)
destroy(this.dw_datos)
destroy(this.st_titulo)
end on

event constructor;post event ue_init()
end event

type uo_desp from uo_desplazador within uo_grilla_base
integer x = 2862
integer y = 1816
integer height = 196
integer taborder = 20
end type

on uo_desp.destroy
call uo_desplazador::destroy
end on

event ue_siguiente;call super::ue_siguiente;if get_pagina() = round(get_total_registros() /get_registros(),0) then return
set_pagina(get_pagina()+1)
this.em_1.text = string(get_pagina()+1)
uo_control.event ue_actualizar( )
end event

event ue_anterior;call super::ue_anterior;if get_pagina() = 0 then return
set_pagina(get_pagina()-1)
this.em_1.text = string(get_pagina()+1)
uo_control.event ue_actualizar( )
end event

type uo_control from uo_contrloles within uo_grilla_base
integer x = 2994
integer y = 136
integer height = 172
integer taborder = 30
end type

on uo_control.destroy
call uo_contrloles::destroy
end on

event ue_actualizar;call super::ue_actualizar;string ls_busquda
dw_datos.retrieve(get_pagina(), get_registros(), get_busqueda())
of_mensaje_paginacion()
of_desplazar()
end event

event ue_salir;call super::ue_salir;of_salir()
end event

type st_pagina from statictext within uo_grilla_base
integer y = 1880
integer width = 1417
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostrando del 1 al 10 de 1000 registros"
boolean focusrectangle = false
end type

type uo_1 from u_searchbox within uo_grilla_base
integer y = 160
integer taborder = 30
end type

on uo_1.destroy
call u_searchbox::destroy
end on

event ue_search;call super::ue_search;string ls_busqueda
ls_busqueda =  '%' + this.sle_search.text + '%'
set_busqueda(ls_busqueda)
set_pagina(0)
of_contar_registros()
uo_control.event ue_actualizar( )
end event

type dw_datos from dw_list within uo_grilla_base
integer y = 324
integer width = 3602
integer height = 1480
integer taborder = 10
boolean hscrollbar = true
boolean vscrollbar = true
end type

type st_titulo from statictext within uo_grilla_base
integer width = 2158
integer height = 148
integer textsize = -20
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Título"
boolean focusrectangle = false
end type

