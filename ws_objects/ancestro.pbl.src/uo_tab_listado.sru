$PBExportHeader$uo_tab_listado.sru
forward
global type uo_tab_listado from userobject
end type
type dw_1 from dw_list within uo_tab_listado
end type
end forward

global type uo_tab_listado from userobject
integer width = 3607
integer height = 1848
long backcolor = 67108864
string text = "Listado"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_1 dw_1
end type
global uo_tab_listado uo_tab_listado

on uo_tab_listado.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on uo_tab_listado.destroy
destroy(this.dw_1)
end on

type dw_1 from dw_list within uo_tab_listado
integer taborder = 10
end type

