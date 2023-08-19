$PBExportHeader$w_principal_base.srw
forward
global type w_principal_base from window
end type
type mdi_1 from mdiclient within w_principal_base
end type
type uo_2 from uo_barra_titulo within w_principal_base
end type
type uo_barra from uo_barra_inferior within w_principal_base
end type
type tab_principal from tab within w_principal_base
end type
type tabpage_1 from userobject within tab_principal
end type
type tabpage_1 from userobject within tab_principal
end type
type tabpage_2 from uo_tab_base_abm within tab_principal
end type
type tabpage_2 from uo_tab_base_abm within tab_principal
end type
type tab_principal from tab within w_principal_base
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type uo_1 from uo_menu within w_principal_base
end type
end forward

global type w_principal_base from window
integer width = 5294
integer height = 2512
boolean titlebar = true
string title = "HelpDesk"
string menuname = "m_menu_invisible"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdi!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mdi_1 mdi_1
uo_2 uo_2
uo_barra uo_barra
tab_principal tab_principal
uo_1 uo_1
end type
global w_principal_base w_principal_base

on w_principal_base.create
if this.MenuName = "m_menu_invisible" then this.MenuID = create m_menu_invisible
this.mdi_1=create mdi_1
this.uo_2=create uo_2
this.uo_barra=create uo_barra
this.tab_principal=create tab_principal
this.uo_1=create uo_1
this.Control[]={this.mdi_1,&
this.uo_2,&
this.uo_barra,&
this.tab_principal,&
this.uo_1}
end on

on w_principal_base.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.uo_2)
destroy(this.uo_barra)
destroy(this.tab_principal)
destroy(this.uo_1)
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
tab_principal.y = 0
tab_principal.height = this.height
tab_principal.width = this.width - 100
tab_principal.tabpage_1.width = tab_principal.width -500
//resize del titulo
uo_2.width = newwidth
end event

type mdi_1 from mdiclient within w_principal_base
long BackColor=268435456
end type

type uo_2 from uo_barra_titulo within w_principal_base
integer x = 219
integer taborder = 20
end type

on uo_2.destroy
call uo_barra_titulo::destroy
end on

type uo_barra from uo_barra_inferior within w_principal_base
integer y = 2216
integer width = 1915
integer taborder = 20
end type

on uo_barra.destroy
call uo_barra_inferior::destroy
end on

type tab_principal from tab within w_principal_base
integer x = 219
integer y = 168
integer width = 4553
integer height = 2056
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
tabposition tabposition = tabsontopandbottom!
integer selectedtab = 2
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

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
integer y = 144
integer width = 4517
integer height = 1768
long backcolor = 67108864
string text = "Alta de usuarios"
long tabtextcolor = 33554432
string picturename = "D:\Archivos\trabajo practico\dev\iconos\1x\baseline_person_add_black_24dp.png"
long picturemaskcolor = 536870912
end type

type tabpage_2 from uo_tab_base_abm within tab_principal
integer x = 18
integer y = 144
integer width = 4517
integer height = 1768
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
	case 1193
		this.width = 219
		this.lv_menu.visible =  false 
	case 219
		this.width = 1193
		this.lv_menu.visible =  true 
end choose

end event

event ue_init;call super::ue_init;this.lv_menu.visible = false
end event

