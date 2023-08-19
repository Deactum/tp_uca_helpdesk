$PBExportHeader$uo_tab_base_abm.sru
forward
global type uo_tab_base_abm from userobject
end type
type dw_1 from dw_abm within uo_tab_base_abm
end type
type rbb_1 from rb_menu_abm_base within uo_tab_base_abm
end type
end forward

global type uo_tab_base_abm from userobject
integer width = 3712
integer height = 1684
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_1 dw_1
rbb_1 rbb_1
end type
global uo_tab_base_abm uo_tab_base_abm

on uo_tab_base_abm.create
this.dw_1=create dw_1
this.rbb_1=create rbb_1
this.Control[]={this.dw_1,&
this.rbb_1}
end on

on uo_tab_base_abm.destroy
destroy(this.dw_1)
destroy(this.rbb_1)
end on

type dw_1 from dw_abm within uo_tab_base_abm
integer y = 196
integer taborder = 10
boolean border = false
end type

type rbb_1 from rb_menu_abm_base within uo_tab_base_abm
integer height = 176
end type

event buttonaceptarclicked;call super::buttonaceptarclicked;f_grabar(dw_1)
end event

event buttoncancelarclicked;call super::buttoncancelarclicked;dw_1.reset( )
dw_1.insertrow(0)
end event

event buttonsalirclicked;call super::buttonsalirclicked;closeuserobject(parent)
end event

