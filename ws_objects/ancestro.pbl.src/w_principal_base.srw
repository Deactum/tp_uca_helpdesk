$PBExportHeader$w_principal_base.srw
forward
global type w_principal_base from window
end type
type mdi_1 from mdiclient within w_principal_base
end type
type lv_1 from listview within w_principal_base
end type
type uo_1 from uo_menu within w_principal_base
end type
type uo_2 from uo_barra_superior within w_principal_base
end type
type tab_principal from tab within w_principal_base
end type
type tab_principal from tab within w_principal_base
end type
type uo_barra from uo_barra_inferior within w_principal_base
end type
end forward

global type w_principal_base from window
integer width = 5294
integer height = 2512
boolean titlebar = true
string menuname = "m_menu_invisible"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdi!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_resize ( )
mdi_1 mdi_1
lv_1 lv_1
uo_1 uo_1
uo_2 uo_2
tab_principal tab_principal
uo_barra uo_barra
end type
global w_principal_base w_principal_base

type variables
private string is_objetos []
end variables

forward prototypes
public function boolean wf_buscar_tab (string as_nombreobj)
public subroutine wf_reciente (string as_titulo, string as_objeto)
end prototypes

event ue_resize();//resize del tab
if this.windowstate = Normal! then 
	uo_barra.y = this.height - 210
	uo_2.y = 0
	uo_2.width = this.width
	lv_1.x =  uo_2.width - lv_1.width
	tab_principal.y = uo_2.height
	tab_principal.height = this.height - tab_principal.y
	tab_principal.width = this.width -tab_principal.x +130
else
	uo_barra.y = this.height - 240
	uo_2.width = this.width -60
	lv_1.x =  uo_2.width - lv_1.width
	tab_principal.y = uo_2.height
	tab_principal.height = this.height -tab_principal.y -30 
	tab_principal.width = this.width -tab_principal.x  +55 
end if
uo_barra.width = this.width
uo_barra.event ue_resize( )


//resize del menu 
uo_1.height = this.height -uo_barra.height +20
//uo_1.lv_menu.height =  uo_1.height
//uo_1.lv_colapsado.height = uo_1.height

end event

public function boolean wf_buscar_tab (string as_nombreobj);//Busca el tab abierto 
long i
string lnombreTab
boolean band
For i = 1 to UpperBound(tab_principal.Control)             //recorrer todos los tab abiertos
	lnombreTab = tab_principal.Control[i].classname()      //preguntar si exisite el tab que estamos tratando abrir
	if lnombreTab = as_nombreObj then
			tab_principal.SelectedTab = i             //esto deberia seleccionar el TAB ya abierto
			return true                             //control si encontró el TAB
	 end if
next
return false
end function

public subroutine wf_reciente (string as_titulo, string as_objeto);string ls_titulo
long ll_upper, ll_i
boolean lb_encontrado = false
if not wf_buscar_tab(as_objeto) then
	ls_titulo =  string(lv_1.totalitems( )+1) + ' - '+ as_titulo
	ll_upper = upperbound(is_objetos)
	for ll_i = 1 to ll_upper
		if is_objetos[ll_i] = as_objeto then
			lb_encontrado = true
			ll_i = ll_upper
		end if
	next
	if not lb_encontrado then 
		is_objetos[ll_upper+1] = as_objeto
		lv_1.additem(ls_titulo,0)
	end if
end if
end subroutine

on w_principal_base.create
if this.MenuName = "m_menu_invisible" then this.MenuID = create m_menu_invisible
this.mdi_1=create mdi_1
this.lv_1=create lv_1
this.uo_1=create uo_1
this.uo_2=create uo_2
this.tab_principal=create tab_principal
this.uo_barra=create uo_barra
this.Control[]={this.mdi_1,&
this.lv_1,&
this.uo_1,&
this.uo_2,&
this.tab_principal,&
this.uo_barra}
end on

on w_principal_base.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.lv_1)
destroy(this.uo_1)
destroy(this.uo_2)
destroy(this.tab_principal)
destroy(this.uo_barra)
end on

event resize;event ue_resize()
end event

event open;string ls_usuario
uo_2.event ue_clicked()
timer(60)

ls_usuario = sqlca.userid

uo_barra.st_1.text = 'Usuario: '
uo_barra.st_2.text = gs_usuario
end event

event timer;tab_principal.Control[1].triggerevent('ue_actualizar')
end event

type mdi_1 from mdiclient within w_principal_base
long BackColor=268435456
end type

type lv_1 from listview within w_principal_base
integer x = 4133
integer y = 208
integer width = 713
integer height = 560
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean buttonheader = false
boolean showheader = false
boolean labelwrap = false
boolean hideselection = false
listviewview view = listviewsmallicon!
long largepicturemaskcolor = 536870912
long smallpicturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event constructor;this.visible = false
end event

event losefocus;this.visible =  false
end event

event clicked;this.visible =  false
// abre un tab al hacer doble clic sobre un registro y si ya existe se visualiza el tab
try
	string LnombreObj ,ltitulo
	long i
	if index = -1 then return
	LnombreObj = is_objetos[index]
	if LnombreObj = '' then return
	//Ltitulo = uo_1.get_title(index)
	if not parent.wf_buscar_tab(LnombreObj) then
		UserObject u_data
		tab_principal.OpenTabWithParm(u_data, 'objeto',lnombreObj , 0)
		tab_principal.Selecttab(u_data)
		tab_principal.Control[UpperBound(tab_principal.Control,1)].Text = ltitulo
	end if
catch (runtimeerror er)
	messagebox("Error del Sistema", er.GetMessage())
end try
end event

type uo_1 from uo_menu within w_principal_base
integer y = 204
integer taborder = 30
end type

on uo_1.destroy
call uo_menu::destroy
end on

event constructor;call super::constructor;this.width = 0
end event

event ue_clicked;call super::ue_clicked;// abre un tab al hacer doble clic sobre un registro y si ya existe se visualiza el tab
try
	string LnombreObj ,ltitulo
	long i
	LnombreObj = uo_1.get_object(index)
	if LnombreObj = '' then return
	if not f_permiso(LnombreObj,gs_usu_codigo,0) then return 
	Ltitulo = uo_1.get_title(index)
	wf_reciente(ltitulo,LnombreObj)
	if not parent.wf_buscar_tab(LnombreObj) then
		UserObject u_data
		tab_principal.OpenTabWithParm(u_data, 'objeto',lnombreObj , 0)
		tab_principal.Selecttab(u_data)
		tab_principal.Control[UpperBound(tab_principal.Control,1)].Text = ltitulo
	end if
catch (runtimeerror er)
	messagebox("Error del Sistema", er.GetMessage())
end try

end event

event ue_init;call super::ue_init;uo_1.event ue_clicked(1) //para abrir por default el tab inicio 
end event

event ue_clicked_logout;call super::ue_clicked_logout;close(parent)


end event

type uo_2 from uo_barra_superior within w_principal_base
integer x = 923
integer width = 3918
integer taborder = 10
end type

on uo_2.destroy
call uo_barra_superior::destroy
end on

event ue_clicked;call super::ue_clicked;if uo_1.ib_flag then 
	uo_1.width= 0
	uo_1.ib_flag = false
	//uo_2.x = 0
	uo_2.width = parent.width
	tab_principal.x = 0
else
	uo_1.width = 923
	uo_1.ib_flag = true
	//uo_2.x =  923
	uo_2.width = parent.width - 923
	tab_principal.x = 923
end if
parent.event ue_resize( )
end event

event constructor;call super::constructor;this.x =0
end event

event ue_reciente;call super::ue_reciente;if lv_1.visible then 
	lv_1.visible = false
else 
	lv_1.visible = true
end if
end event

type tab_principal from tab within w_principal_base
event ue_cerrar_tab ( )
integer x = 923
integer y = 208
integer width = 3451
integer height = 2000
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean createondemand = true
tabposition tabposition = tabsonright!
integer selectedtab = 1
end type

event ue_cerrar_tab();integer litab
string ls_tabname
litab= this.selectedtab 
this.closetab(this.control[litab])
this.selectedtab =  litab -1
end event

event constructor;this.x =0
end event

type uo_barra from uo_barra_inferior within w_principal_base
integer y = 2216
integer width = 1915
integer taborder = 20
boolean bringtotop = true
end type

on uo_barra.destroy
call uo_barra_inferior::destroy
end on

