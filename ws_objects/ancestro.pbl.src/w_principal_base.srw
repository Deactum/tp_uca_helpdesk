$PBExportHeader$w_principal_base.srw
forward
global type w_principal_base from window
end type
type mdi_1 from mdiclient within w_principal_base
end type
type tab_principal from tab within w_principal_base
end type
type tabpage_1 from tab_inicio within tab_principal
end type
type tabpage_1 from tab_inicio within tab_principal
end type
type tab_principal from tab within w_principal_base
tabpage_1 tabpage_1
end type
type uo_1 from uo_menu within w_principal_base
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
tab_principal tab_principal
uo_1 uo_1
uo_barra uo_barra
end type
global w_principal_base w_principal_base

forward prototypes
public function boolean wf_buscar_tab (string as_nombreobj)
end prototypes

event ue_resize();//resize del tab
if this.windowstate = Normal! then 
	uo_barra.y = this.height - 210
	tab_principal.y = 0
	tab_principal.height = this.height 
	tab_principal.width = this.width -tab_principal.x //- 240
else
	uo_barra.y = this.height - 240
	tab_principal.y = 0
	tab_principal.height = this.height -30
	tab_principal.width = this.width -tab_principal.x  - 75
end if
uo_barra.width = this.width
uo_barra.event ue_resize( )
//resize del menu 
uo_1.height = this.height -uo_barra.height +20
uo_1.lv_menu.height =  uo_1.height
uo_1.lv_colapsado.height = uo_1.height

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

on w_principal_base.create
if this.MenuName = "m_menu_invisible" then this.MenuID = create m_menu_invisible
this.mdi_1=create mdi_1
this.tab_principal=create tab_principal
this.uo_1=create uo_1
this.uo_barra=create uo_barra
this.Control[]={this.mdi_1,&
this.tab_principal,&
this.uo_1,&
this.uo_barra}
end on

on w_principal_base.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.tab_principal)
destroy(this.uo_1)
destroy(this.uo_barra)
end on

event resize;event ue_resize()
end event

type mdi_1 from mdiclient within w_principal_base
long BackColor=268435456
end type

type tab_principal from tab within w_principal_base
event ue_cerrar_tab ( )
integer x = 219
integer width = 3296
integer height = 1684
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
tabpage_1 tabpage_1
end type

event ue_cerrar_tab();integer litab
string ls_tabname
litab= this.selectedtab 
this.closetab(this.control[litab])
this.selectedtab =  litab -1
end event

on tab_principal.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_principal.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from tab_inicio within tab_principal
integer x = 18
integer y = 16
integer width = 3141
integer height = 1652
end type

type uo_1 from uo_menu within w_principal_base
integer width = 219
integer height = 2084
integer taborder = 20
boolean bringtotop = true
end type

on uo_1.destroy
call uo_menu::destroy
end on

event ue_resize;call super::ue_resize;choose case this.width
	case 887
		this.width = 219
		this.lv_menu.visible =  false 
		tab_principal.x = this.width
	case 219
		this.width = 887
		this.lv_menu.visible =  true 
		tab_principal.x = this.width
end choose
parent.event ue_resize()

end event

event ue_init;call super::ue_init;this.lv_menu.visible = false
end event

event ue_clicked;call super::ue_clicked;// abre un tab al hacer clic sobre un registro y si ya existe se visualiza el tab
try
	if index = 1 then
		tab_principal.selectedtab = 1
		return
	end if
	string LnombreObj ,ltitulo
	long i
	LnombreObj = this.get_object(index)
	Ltitulo = this.get_title(index)
	if not parent.function  wf_buscar_tab(lnombreObj) then
		UserObject u_data
		tab_principal.OpenTabWithParm(u_data, 'objeto',lnombreObj , 0)
		tab_principal.Selecttab(u_data)
		tab_principal.Control[UpperBound(tab_principal.Control,1)].Text = ltitulo
	end if
		//tab_calendario.event ue_maximizar( false)
		//parent.event ue_reciente(ltitulo)
		
	// hace foco en la categoria princial 
//	wf_setactivarcategoria(rbb_1,'Principal')
	
catch (runtimeerror er)
	messagebox("Error del Sistema", er.GetMessage())
end try

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

