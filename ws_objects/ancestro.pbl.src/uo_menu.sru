$PBExportHeader$uo_menu.sru
$PBExportComments$menu estilo hamburguesa
forward
global type uo_menu from userobject
end type
type lv_menu from listview within uo_menu
end type
type p_1 from picture within uo_menu
end type
type lv_colapsado from listview within uo_menu
end type
end forward

global type uo_menu from userobject
integer width = 887
integer height = 2472
long backcolor = 134217730
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_init ( )
event ue_clicked ( integer index )
event ue_resize ( )
lv_menu lv_menu
p_1 p_1
lv_colapsado lv_colapsado
end type
global uo_menu uo_menu

type variables
string is_objeto[]
string is_title[]
boolean ib_flag = false
end variables

forward prototypes
public function string get_object (long al_index)
public function string get_title (integer ai_index)
public subroutine of_cargar_menu (ref listview alv_menu)
public subroutine of_cargar_menu_c (ref listview alv_menu)
end prototypes

event ue_init();//para iniciar cosas
//is_objeto[1] = 'tab_inicio'
//is_title[1] = 'Inicio'
end event

event ue_resize();
if ib_flag then
	lv_menu.deleteitems( )
	of_cargar_menu(lv_menu)
	ib_flag = false
else
	lv_colapsado.deleteitems( )
	of_cargar_menu_c(lv_colapsado)
	ib_flag =true
end if
end event

public function string get_object (long al_index);return is_objeto[al_index]
end function

public function string get_title (integer ai_index);return is_title[ai_index]
end function

public subroutine of_cargar_menu (ref listview alv_menu);string ls_titulo, ls_objeto, ls_dir
long ll_upper, ll_i, ll_item //= 2
uo_lista_objetos lista
lista = create uo_lista_objetos
for ll_i = 1 to lista.il_row
	ls_titulo = lista.is_objetos[ll_i , 1]
	ls_objeto =  lista.is_objetos[ll_i, 2]
	ls_dir =  lista.is_objetos[ll_i , 3]
	ll_item = alv_menu.addsmallpicture(ls_dir)
	alv_menu.additem( ls_titulo,ll_item)
	is_objeto[ll_i] = ls_objeto
	is_title[ll_i]= ls_titulo
next 

destroy lista
end subroutine

public subroutine of_cargar_menu_c (ref listview alv_menu);string ls_titulo, ls_objeto, ls_dir
long ll_upper, ll_i, ll_item = 2
uo_lista_objetos lista
lista = create uo_lista_objetos
for ll_i = 1 to lista.il_row
	ls_titulo = ''
	ls_objeto =  lista.is_objetos[ll_i, 2]
	ls_dir =  lista.is_objetos[ll_i , 3]
	ll_item = alv_menu.addsmallpicture(ls_dir)
	alv_menu.additem( ls_titulo,ll_item)
next 

destroy lista
end subroutine

on uo_menu.create
this.lv_menu=create lv_menu
this.p_1=create p_1
this.lv_colapsado=create lv_colapsado
this.Control[]={this.lv_menu,&
this.p_1,&
this.lv_colapsado}
end on

on uo_menu.destroy
destroy(this.lv_menu)
destroy(this.p_1)
destroy(this.lv_colapsado)
end on

event constructor;post event ue_init()


end event

type lv_menu from listview within uo_menu
integer x = 32
integer y = 204
integer width = 882
integer height = 1372
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 268435456
boolean border = false
listviewview view = listviewlist!
long largepicturemaskcolor = 536870912
integer smallpicturewidth = 32
integer smallpictureheight = 32
long smallpicturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event constructor;this.deleteitems( )
of_cargar_menu(lv_menu)
end event

event clicked;if index >0 then event ue_clicked(index)
//lv_colapsado.event itemactivate( index)
end event

type p_1 from picture within uo_menu
integer width = 219
integer height = 192
boolean originalsize = true
string picturename = ".\iconos\1x\baseline_menu_white_48dp.png"
boolean focusrectangle = false
end type

event clicked;event ue_resize()
end event

type lv_colapsado from listview within uo_menu
integer x = 32
integer y = 204
integer width = 882
integer height = 1372
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 268435456
boolean border = false
listviewview view = listviewlist!
long largepicturemaskcolor = 536870912
integer smallpicturewidth = 32
integer smallpictureheight = 32
long smallpicturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event clicked;if index >0 then event ue_clicked(index)
//lv_colapsado.event itemactivate( index)
end event

event constructor;//of_deleteitems(lv_colapsado)
//of_cargar_menu_c(lv_menu)
this.deleteitems( )
of_cargar_menu_c(lv_colapsado)
end event

