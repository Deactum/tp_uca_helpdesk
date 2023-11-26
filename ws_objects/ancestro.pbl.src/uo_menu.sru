$PBExportHeader$uo_menu.sru
$PBExportComments$menu estilo hamburguesa
forward
global type uo_menu from userobject
end type
type p_2 from picture within uo_menu
end type
type tv_1 from treeview within uo_menu
end type
type st_usuario from statictext within uo_menu
end type
type p_imagen from picture within uo_menu
end type
type ln_1 from line within uo_menu
end type
end forward

global type uo_menu from userobject
integer width = 923
integer height = 2472
long backcolor = 134217730
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_init ( )
event ue_clicked ( long index )
event ue_resize pbm_size
event ue_clicked_logout ( )
p_2 p_2
tv_1 tv_1
st_usuario st_usuario
p_imagen p_imagen
ln_1 ln_1
end type
global uo_menu uo_menu

type variables
string is_objeto[]
string is_title[]
boolean ib_flag = false
datastore ids_datos
end variables

forward prototypes
public function string get_object (long al_index)
public function long of_set_menu (long al_nivel, string as_titulo, string as_objeto, string as_icono)
public function long of_set_menu (long al_nivel, string as_titulo, string as_icono)
public function string get_title (long al_index)
end prototypes

event ue_init();long ll_padre
string ls_nombre, ls_apellido
blob lblob_imagen

// obtiene informacion del usuario
SELECT USUARIOS_NOMBRE, USUARIOS_APELLIDO
INTO :ls_nombre, :ls_apellido
FROM USUARIOS
WHERE USUARIOS_CODIGO = :gs_usu_codigo
COMMIT USING SQLCA;

// Obtiene imagen de usuario
SELECTBLOB USUARIOS_FOTO
INTO :lblob_imagen
FROM USUARIOS
WHERE USUARIOS_CODIGO = :gs_usu_codigo;
COMMIT USING SQLCA;

if isNull(lblob_imagen) then p_imagen.pictureName = '.\iconos\2x\baseline_person_white_48dp.png'
p_imagen.setpicture(lblob_imagen)

st_usuario.text = ls_apellido + ', ' + ls_nombre

// construye el menu
of_set_menu(0,'Inicio','tab_inicio','baseline_home_white_48dp.png') 
ll_padre = of_set_menu(0,'Reparaciones','baseline_construction_white_48dp.png') //nodo padre
	//of_set_menu(ll_padre,'Clientes','tab_clientes','baseline_person_white_48dp.png') //nodo hijo
	of_set_menu(ll_padre,'Reparaciones','tab_reparaciones','baseline_construction_white_48dp.png')
	of_set_menu(ll_padre,'Base de Conocimientos','baseline_school_white_48dp.png')
ll_padre = of_set_menu(0,'Depósito','baseline_inventory_white_48dp.png')
	of_set_menu(ll_padre,'Ajustes','baseline_task_alt_white_48dp.png')
	of_set_menu(ll_padre,'Componentes','baseline_wysiwyg_white_48dp.png')
	of_set_menu(ll_padre,'Compras','tab_compras','baseline_storefront_white_48dp.png')
	of_set_menu(ll_padre,'Inventario','round_inventory_white_48dp.png')
	//of_set_menu(ll_padre,'Proveedores','tab_proveedores','baseline_wysiwyg_white_48dp.png')
ll_padre = of_set_menu(0,'Administración','baseline_admin_panel_settings_white_48dp.png')
	of_set_menu(ll_padre,'Parámetros','baseline_tune_white_48dp.png')
	of_set_menu(ll_padre,'Usuarios','tab_usuarios','baseline_manage_accounts_white_48dp.png')
ll_padre = of_set_menu(0,'Reportes','baseline_analytics_white_48dp.png')
	of_set_menu(ll_padre,'Tiempo promedio de Reparación', 'tab_rpt_reparacion', 'baseline_description_white_48dp.png')
	of_set_menu(ll_padre,'Problemas más comunes', 'tab_rpt_problemas','baseline_description_white_48dp.png')
	of_set_menu(ll_padre,'Rendimiento del equipo técnico', 'tab_rpt_rendimiento','baseline_description_white_48dp.png')
end event

event ue_resize;
tv_1.height =  this.height - tv_1.y -600
p_2.y =  tv_1.height + tv_1.y
end event

public function string get_object (long al_index);//retorna el nombre del objeto según el indice del treeview
long ll_find
string ls_objeto
ll_find = ids_datos.find( 'nivel ='+string(al_index),1,ids_datos.rowcount( ))
ls_objeto = ids_datos.getitemstring( ll_find,3)
return ls_objeto
end function

public function long of_set_menu (long al_nivel, string as_titulo, string as_objeto, string as_icono);//llena el treeview 
long ll_row, ll_ret, ll_imagen
constant string ls_path = '.\iconos\1x\'
ll_imagen = tv_1.addpicture(ls_path+as_icono)
ll_ret = tv_1.insertitemlast(al_nivel,as_titulo,ll_imagen)
ll_row = ids_datos.insertrow(0)
ids_datos.setitem( ll_row,1,ll_ret)
ids_datos.setitem( ll_row,2,as_titulo)
ids_datos.setitem( ll_row,3,as_objeto)
ids_datos.setitem( ll_row,4,as_icono)
return ll_ret
end function

public function long of_set_menu (long al_nivel, string as_titulo, string as_icono);//llena el treeview  sin nececidad de nombrar el objeto
return of_set_menu(al_nivel,as_titulo,'',as_icono)
end function

public function string get_title (long al_index);//retorna el titulo según el indice del treeview
long ll_find
string ls_titulo
ll_find = ids_datos.find( 'nivel ='+string(al_index),1,ids_datos.rowcount( ))
ls_titulo = ids_datos.getitemstring( ll_find,2)
return ls_titulo
end function

on uo_menu.create
this.p_2=create p_2
this.tv_1=create tv_1
this.st_usuario=create st_usuario
this.p_imagen=create p_imagen
this.ln_1=create ln_1
this.Control[]={this.p_2,&
this.tv_1,&
this.st_usuario,&
this.p_imagen,&
this.ln_1}
end on

on uo_menu.destroy
destroy(this.p_2)
destroy(this.tv_1)
destroy(this.st_usuario)
destroy(this.p_imagen)
destroy(this.ln_1)
end on

event constructor;ids_datos =  create datastore
ids_datos.dataobject =  'dw_list_menu_objetos'
post event ue_init()




end event

type p_2 from picture within uo_menu
integer y = 2156
integer width = 219
integer height = 192
boolean originalsize = true
string picturename = ".\iconos\1x\baseline_power_settings_new_white_48dp.png"
end type

event clicked;parent.event ue_clicked_logout( )
end event

type tv_1 from treeview within uo_menu
integer y = 512
integer width = 905
integer height = 1644
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean border = false
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
boolean singleexpand = true
integer picturewidth = 32
integer pictureheight = 32
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event clicked;parent.event ue_clicked(handle)
end event

type st_usuario from statictext within uo_menu
integer x = 18
integer y = 372
integer width = 896
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 67108864
string text = "Usuario"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type p_imagen from picture within uo_menu
integer x = 270
integer width = 389
integer height = 360
string picturename = ".\iconos\2x\baseline_person_white_48dp.png"
boolean border = true
boolean focusrectangle = false
end type

type ln_1 from line within uo_menu
long linecolor = 134217730
integer linethickness = 4
integer beginx = 14
integer beginy = 480
integer endx = 905
integer endy = 480
end type

