$PBExportHeader$uo_lista_objetos.sru
$PBExportComments$contiene la lista de los objetos
forward
global type uo_lista_objetos from nonvisualobject
end type
end forward

global type uo_lista_objetos from nonvisualobject
end type
global uo_lista_objetos uo_lista_objetos

type variables
long il_row =0
string is_objetos[100,3]
end variables

forward prototypes
public function integer of_set_objetos (string as_titulo, string as_objeto, string as_icono)
end prototypes

public function integer of_set_objetos (string as_titulo, string as_objeto, string as_icono);long ll_len
il_row +=1 
is_objetos[il_row,1] = as_titulo
is_objetos[il_row,2] = as_objeto
is_objetos[il_row,3] = as_icono


return 1
end function

on uo_lista_objetos.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_lista_objetos.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;of_set_objetos('Tab principal','uo_tab_base_abm','.\iconos\1x\baseline_dashboard_white_48dp.png')
of_set_objetos('tab secundario','uo_tab_base_abm','.\iconos\1x\outline_check_circle_white_48dp.png')

end event

