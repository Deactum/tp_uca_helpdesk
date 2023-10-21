$PBExportHeader$w_principal_base.srw
forward
global type w_principal_base from window
end type
type mdi_1 from mdiclient within w_principal_base
end type
type tab_principal from tab within w_principal_base
end type
type tabpage_1 from userobject within tab_principal
end type
type tabpage_1 from userobject within tab_principal
end type
type tabpage_2 from tab_orders within tab_principal
end type
type tabpage_2 from tab_orders within tab_principal
end type
type tab_principal from tab within w_principal_base
tabpage_1 tabpage_1
tabpage_2 tabpage_2
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
mdi_1 mdi_1
tab_principal tab_principal
uo_1 uo_1
uo_barra uo_barra
end type
global w_principal_base w_principal_base

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

event resize;//resize barra inferior
if this.windowstate =  maximized! then
	uo_barra.y = this.height - 240
else 
	uo_barra.y = this.height -210
end if
uo_barra.width = newwidth
uo_barra.event ue_resize( )
//resize del menu
uo_1.height = newheight -uo_barra.height +20
uo_1.lv_menu.height =  uo_1.height


//resize del tab
if this.windowstate = Normal! then 
	tab_principal.y = 0
	tab_principal.height = this.height 
	tab_principal.width = this.width - 300
else
	tab_principal.y = 0
	tab_principal.height = this.height -30
	tab_principal.width = this.width - 300
end if
//tab_principal.tabpage_1.width = tab_principal.width -500


end event

type mdi_1 from mdiclient within w_principal_base
long BackColor=268435456
end type

type tab_principal from tab within w_principal_base
event ue_cerrar_tab ( )
integer x = 219
integer y = 44
integer width = 2304
integer height = 1056
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
tabposition tabposition = tabsonright!
integer selectedtab = 2
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

event ue_cerrar_tab();integer litab
string ls_tabname
litab= this.selectedtab 
this.closetab(this.control[litab])

end event

on tab_principal.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_principal.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_principal
integer x = 18
integer y = 16
integer width = 2153
integer height = 1024
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type tabpage_2 from tab_orders within tab_principal
integer x = 18
integer y = 16
integer width = 2153
integer height = 1024
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
	case 219
		this.width = 887
		this.lv_menu.visible =  true 
end choose

end event

event ue_init;call super::ue_init;this.lv_menu.visible = false
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

