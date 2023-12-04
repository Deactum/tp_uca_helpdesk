$PBExportHeader$tab_inicio.sru
forward
global type tab_inicio from uo_tab
end type
type uo_2 from tarjet_trabajando within tab_inicio
end type
type wb_3 from n_webbrowser within tab_inicio
end type
type uo_1 from tarjet_concretados within tab_inicio
end type
type dw_1 from dw_list within tab_inicio
end type
type wb_1 from n_webbrowser within tab_inicio
end type
type uo_pendientes from tarjet_pendientes within tab_inicio
end type
end forward

global type tab_inicio from uo_tab
integer width = 4297
integer height = 2252
string text = "Inicio"
string picturename = ".\iconos\1x\baseline_home_black_18dp.png"
event ue_actualizar ( )
uo_2 uo_2
wb_3 wb_3
uo_1 uo_1
dw_1 dw_1
wb_1 wb_1
uo_pendientes uo_pendientes
end type
global tab_inicio tab_inicio

type variables
eon_appeon_resize  ieon_resize

datastore ids_datos1,ids_datos2,ids_datos3

end variables

forward prototypes
public subroutine of_actualizar_graficos ()
end prototypes

event ue_actualizar();of_actualizar_graficos()
end event

public subroutine of_actualizar_graficos ();ids_datos1.retrieve()
wb_1.of_init(ids_datos1)
end subroutine

on tab_inicio.create
int iCurrent
call super::create
this.uo_2=create uo_2
this.wb_3=create wb_3
this.uo_1=create uo_1
this.dw_1=create dw_1
this.wb_1=create wb_1
this.uo_pendientes=create uo_pendientes
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_2
this.Control[iCurrent+2]=this.wb_3
this.Control[iCurrent+3]=this.uo_1
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.wb_1
this.Control[iCurrent+6]=this.uo_pendientes
end on

on tab_inicio.destroy
call super::destroy
destroy(this.uo_2)
destroy(this.wb_3)
destroy(this.uo_1)
destroy(this.dw_1)
destroy(this.wb_1)
destroy(this.uo_pendientes)
end on

event ue_resize;call super::ue_resize;if not isvalid(ieon_resize) then
	return
end if

ieon_resize.of_resize(this,newwidth,newheight,true)
end event

event ue_init;call super::ue_init;environment lenv
decimal  ldec_width, ldc_Height
long ll_h, ll_w
getenvironment(lenv)
ll_w = lenv.screenwidth
ll_h = lenv.screenheight
ldc_Height = round(lenv.screenheight/ll_h*This.height,2)
ldec_width = round(lenv.screenwidth/ll_w*This.width,2)
ieon_resize = create eon_appeon_resize
ieon_resize.of_init(this,true)
ieon_resize.of_fontresize(true,3)
ieon_resize.of_zoom( true, 3)
This.Resize( ldec_width, ldc_Height )


ids_datos1 = create datastore
ids_datos1.dataobject = 'gr_pendientes'
ids_datos1.settransobject(SQLCA)


of_actualizar_graficos()

end event

type uo_2 from tarjet_trabajando within tab_inicio
integer x = 1509
integer taborder = 40
end type

on uo_2.destroy
call tarjet_trabajando::destroy
end on

type wb_3 from n_webbrowser within tab_inicio
integer x = 2194
integer y = 392
integer width = 2057
integer height = 820
string is_style = "pie"
string is_title = ""
boolean ib_toolbox = false
boolean ib_legend = false
long il_width = 100
long il_height = 100
end type

type uo_1 from tarjet_concretados within tab_inicio
integer x = 2885
integer taborder = 30
end type

on uo_1.destroy
call tarjet_concretados::destroy
end on

type dw_1 from dw_list within tab_inicio
integer x = 133
integer y = 1236
integer width = 4119
integer height = 968
integer taborder = 20
string dataobject = "dw_dsb_estados_rep"
end type

type wb_1 from n_webbrowser within tab_inicio
integer x = 133
integer y = 388
integer width = 2057
integer height = 820
string is_style = "horizontalbar"
string is_title = ""
boolean ib_toolbox = false
boolean ib_legend = false
boolean ib_preview = false
long il_width = 100
long il_height = 100
end type

type uo_pendientes from tarjet_pendientes within tab_inicio
integer x = 133
integer taborder = 20
end type

on uo_pendientes.destroy
call tarjet_pendientes::destroy
end on

