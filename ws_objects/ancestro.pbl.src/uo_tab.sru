$PBExportHeader$uo_tab.sru
forward
global type uo_tab from userobject
end type
end forward

global type uo_tab from userobject
integer width = 2661
integer height = 1288
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_init ( )
event ue_resize pbm_size
end type
global uo_tab uo_tab

event ue_init();// para iniciar cosas
end event

event ue_resize;//para acomodar los objetos 
end event

event constructor;post event ue_init()
end event

on uo_tab.create
end on

on uo_tab.destroy
end on

