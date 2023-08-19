$PBExportHeader$uo_barra_titulo.sru
$PBExportComments$Muesta los titulos de los objetos
forward
global type uo_barra_titulo from userobject
end type
type st_1 from statictext within uo_barra_titulo
end type
end forward

global type uo_barra_titulo from userobject
integer width = 2606
integer height = 164
long backcolor = 134217731
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_1 st_1
end type
global uo_barra_titulo uo_barra_titulo

forward prototypes
public subroutine of_set_titulo (string as_titulo)
end prototypes

public subroutine of_set_titulo (string as_titulo);st_1.text = '⁞⁞ '+ as_titulo +' ⁞⁞'
end subroutine

on uo_barra_titulo.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on uo_barra_titulo.destroy
destroy(this.st_1)
end on

type st_1 from statictext within uo_barra_titulo
integer width = 2533
integer height = 136
integer textsize = -20
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217731
string text = "⁞ Titulo ⁞"
boolean focusrectangle = false
end type

