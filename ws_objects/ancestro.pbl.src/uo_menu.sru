$PBExportHeader$uo_menu.sru
$PBExportComments$menu estilo hamburguesa
forward
global type uo_menu from userobject
end type
type lv_menu from listview within uo_menu
end type
type p_1 from picture within uo_menu
end type
end forward

global type uo_menu from userobject
integer width = 1193
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
end type
global uo_menu uo_menu

event ue_init();//para iniciar cosas

end event

on uo_menu.create
this.lv_menu=create lv_menu
this.p_1=create p_1
this.Control[]={this.lv_menu,&
this.p_1}
end on

on uo_menu.destroy
destroy(this.lv_menu)
destroy(this.p_1)
end on

event constructor;post event ue_init()


end event

type lv_menu from listview within uo_menu
integer y = 184
integer width = 1189
integer height = 1372
integer taborder = 10
integer transparency = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 268435456
boolean border = false
borderstyle borderstyle = stylelowered!
boolean fullrowselect = true
listviewview view = listviewlist!
string item[] = {"Home                                       "}
integer itempictureindex[] = {1}
long largepicturemaskcolor = 536870912
string smallpicturename[] = {".\iconos\1x\baseline_home_white_48dp.png"}
integer smallpicturewidth = 32
integer smallpictureheight = 32
long smallpicturemaskcolor = 268435456
long statepicturemaskcolor = 536870912
end type

event clicked;event ue_clicked(index)
end event

event constructor;string ls_titulo, ls_objeto, ls_dir
long ll_upper, ll_i, ll_item = 2
uo_lista_objetos lista
lista = create uo_lista_objetos
for ll_i = 1 to lista.il_row
	ls_titulo = lista.is_objetos[ll_i , 1]
	ls_objeto =  lista.is_objetos[ll_i, 2]
	ls_dir =  lista.is_objetos[ll_i , 3]
	ll_item = this.addsmallpicture(ls_dir)
	this.additem( ls_titulo,ll_item)
next 

destroy lista

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

event losefocus;event ue_resize()
end event

