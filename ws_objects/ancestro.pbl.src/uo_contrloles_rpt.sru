$PBExportHeader$uo_contrloles_rpt.sru
forward
global type uo_contrloles_rpt from userobject
end type
type p_4 from picture within uo_contrloles_rpt
end type
type p_2 from picture within uo_contrloles_rpt
end type
type p_1 from picture within uo_contrloles_rpt
end type
type p_3 from picture within uo_contrloles_rpt
end type
end forward

global type uo_contrloles_rpt from userobject
integer width = 891
integer height = 196
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_click_actualizar ( )
event ue_click_exportar ( )
event ue_click_imprimir ( )
event ue_click_salir ( )
p_4 p_4
p_2 p_2
p_1 p_1
p_3 p_3
end type
global uo_contrloles_rpt uo_contrloles_rpt

on uo_contrloles_rpt.create
this.p_4=create p_4
this.p_2=create p_2
this.p_1=create p_1
this.p_3=create p_3
this.Control[]={this.p_4,&
this.p_2,&
this.p_1,&
this.p_3}
end on

on uo_contrloles_rpt.destroy
destroy(this.p_4)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.p_3)
end on

type p_4 from picture within uo_contrloles_rpt
integer width = 219
integer height = 192
string picturename = ".\iconos\png\actualizar.png"
boolean border = true
borderstyle borderstyle = styleraised!
end type

event clicked;event ue_click_actualizar()
end event

type p_2 from picture within uo_contrloles_rpt
integer x = 439
integer width = 219
integer height = 192
integer transparency = 20
boolean originalsize = true
string picturename = ".\iconos\1x\baseline_print_black_48dp.png"
boolean border = true
borderstyle borderstyle = styleraised!
end type

event clicked;event ue_click_imprimir()
end event

type p_1 from picture within uo_contrloles_rpt
integer x = 658
integer width = 219
integer height = 192
integer transparency = 20
boolean originalsize = true
string picturename = "D:\Archivos\UCA\ingenieria del software\DEV\iconos\1x\baseline_logout_black_48dp.png"
boolean border = true
borderstyle borderstyle = styleraised!
end type

event clicked;event ue_click_salir()
end event

type p_3 from picture within uo_contrloles_rpt
integer x = 219
integer width = 219
integer height = 192
integer transparency = 20
boolean originalsize = true
string picturename = ".\iconos\1x\baseline_file_download_black_48dp.png"
boolean border = true
borderstyle borderstyle = styleraised!
end type

event clicked;event ue_click_exportar()
end event

