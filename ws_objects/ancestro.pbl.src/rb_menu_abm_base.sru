$PBExportHeader$rb_menu_abm_base.sru
$PBExportComments$menu estilo hamburguesa
forward
global type rb_menu_abm_base from ribbonbar
end type
end forward

global type rb_menu_abm_base from ribbonbar
string tag = "MenuResponseBase.xml"
integer width = 2885
integer height = 212
long backcolor = 15132390
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean hidetabheader = true
boolean autosizeheight = false
event ue_init ( )
event buttonaceptarclicked ( integer itemhandle )
event buttoncancelarclicked ( integer itemhandle )
event buttonsalirclicked ( integer itemhandle )
end type
global rb_menu_abm_base rb_menu_abm_base

event ue_init();this.importfromxmlfile('.\'+ this.tag )
end event

event constructor;post event ue_init()
end event

on rb_menu_abm_base.create
end on

on rb_menu_abm_base.destroy
end on

