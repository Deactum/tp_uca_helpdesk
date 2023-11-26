$PBExportHeader$w_imprimir.srw
$PBExportComments$Ventana de impresión.
forward
global type w_imprimir from window
end type
type ddlb_range from dropdownlistbox within w_imprimir
end type
type st_4 from statictext within w_imprimir
end type
type cb_printer from commandbutton within w_imprimir
end type
type cb_cancel from commandbutton within w_imprimir
end type
type cbx_collate from checkbox within w_imprimir
end type
type cbx_print_to_file from checkbox within w_imprimir
end type
type st_3 from statictext within w_imprimir
end type
type sle_page_range from singlelineedit within w_imprimir
end type
type rb_pages from radiobutton within w_imprimir
end type
type rb_current_page from radiobutton within w_imprimir
end type
type rb_all from radiobutton within w_imprimir
end type
type em_copies from editmask within w_imprimir
end type
type st_2 from statictext within w_imprimir
end type
type sle_printer from singlelineedit within w_imprimir
end type
type st_1 from statictext within w_imprimir
end type
type cb_ok from commandbutton within w_imprimir
end type
type gb_1 from groupbox within w_imprimir
end type
end forward

global type w_imprimir from window
integer x = 672
integer y = 268
integer width = 1851
integer height = 932
boolean titlebar = true
string title = "Imprimir - (w_opciones_de_impresion)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
toolbaralignment toolbaralignment = alignatleft!
ddlb_range ddlb_range
st_4 st_4
cb_printer cb_printer
cb_cancel cb_cancel
cbx_collate cbx_collate
cbx_print_to_file cbx_print_to_file
st_3 st_3
sle_page_range sle_page_range
rb_pages rb_pages
rb_current_page rb_current_page
rb_all rb_all
em_copies em_copies
st_2 st_2
sle_printer sle_printer
st_1 st_1
cb_ok cb_ok
gb_1 gb_1
end type
global w_imprimir w_imprimir

type variables
string is_page_range
datawindow idw_dw
int ii_return = -1
end variables
forward prototypes
private subroutine wf_page_range (radiobutton who)
end prototypes

private subroutine wf_page_range (radiobutton who);choose case who
	case rb_all
		sle_page_range.text = ''
		sle_page_range.enabled = false
		is_page_range = 'a'
	case rb_current_page
		sle_page_range.text = ''
		sle_page_range.enabled = false
		is_page_range = 'c'
	case rb_pages		
		sle_page_range.enabled = true
		is_page_range = 'p'
end choose
end subroutine

event open;idw_dw 				= message.powerobjectparm
sle_printer.text  = idw_dw.describe('datawindow.printer')
is_page_range     = 'a'
end event

on w_imprimir.create
this.ddlb_range=create ddlb_range
this.st_4=create st_4
this.cb_printer=create cb_printer
this.cb_cancel=create cb_cancel
this.cbx_collate=create cbx_collate
this.cbx_print_to_file=create cbx_print_to_file
this.st_3=create st_3
this.sle_page_range=create sle_page_range
this.rb_pages=create rb_pages
this.rb_current_page=create rb_current_page
this.rb_all=create rb_all
this.em_copies=create em_copies
this.st_2=create st_2
this.sle_printer=create sle_printer
this.st_1=create st_1
this.cb_ok=create cb_ok
this.gb_1=create gb_1
this.Control[]={this.ddlb_range,&
this.st_4,&
this.cb_printer,&
this.cb_cancel,&
this.cbx_collate,&
this.cbx_print_to_file,&
this.st_3,&
this.sle_page_range,&
this.rb_pages,&
this.rb_current_page,&
this.rb_all,&
this.em_copies,&
this.st_2,&
this.sle_printer,&
this.st_1,&
this.cb_ok,&
this.gb_1}
end on

on w_imprimir.destroy
destroy(this.ddlb_range)
destroy(this.st_4)
destroy(this.cb_printer)
destroy(this.cb_cancel)
destroy(this.cbx_collate)
destroy(this.cbx_print_to_file)
destroy(this.st_3)
destroy(this.sle_page_range)
destroy(this.rb_pages)
destroy(this.rb_current_page)
destroy(this.rb_all)
destroy(this.em_copies)
destroy(this.st_2)
destroy(this.sle_printer)
destroy(this.st_1)
destroy(this.cb_ok)
destroy(this.gb_1)
end on

event close;message.doubleparm = ii_return
end event

type ddlb_range from dropdownlistbox within w_imprimir
integer x = 366
integer y = 728
integer width = 1061
integer height = 288
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "All Pages In Range"
boolean sorted = false
string item[] = {"All Pages in Range","Even Numbered Pages","Odd Numbered Pages"}
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_imprimir
integer x = 50
integer y = 724
integer width = 297
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "Imp&rimir sólo:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_printer from commandbutton within w_imprimir
integer x = 1399
integer y = 288
integer width = 338
integer height = 84
integer taborder = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Impresora ..."
end type

on clicked;printsetup()
sle_printer.text = idw_dw.describe('datawindow.printer')
end on

type cb_cancel from commandbutton within w_imprimir
integer x = 1403
integer y = 180
integer width = 334
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cance&lar"
boolean cancel = true
end type

event clicked;closewithreturn(parent,ii_return)
end event

type cbx_collate from checkbox within w_imprimir
integer x = 1317
integer y = 620
integer width = 507
integer height = 68
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "Intercalar copias"
boolean checked = true
end type

type cbx_print_to_file from checkbox within w_imprimir
integer x = 1317
integer y = 524
integer width = 846
integer height = 68
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "A un &archivo"
end type

type st_3 from statictext within w_imprimir
integer x = 78
integer y = 556
integer width = 974
integer height = 112
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "Escriba números de página e/o intérvalos separados por comas. Ejemplo 1, 3, 5-12, 14."
boolean focusrectangle = false
end type

type sle_page_range from singlelineedit within w_imprimir
integer x = 352
integer y = 448
integer width = 878
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type rb_pages from radiobutton within w_imprimir
integer x = 78
integer y = 460
integer width = 293
integer height = 68
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "Pági&nas:"
end type

on clicked;wf_page_range(this)
end on

type rb_current_page from radiobutton within w_imprimir
integer x = 78
integer y = 388
integer width = 457
integer height = 68
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "&Página actual"
end type

on clicked;wf_page_range(this)
end on

type rb_all from radiobutton within w_imprimir
integer x = 78
integer y = 324
integer width = 238
integer height = 68
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "&Todo"
boolean checked = true
end type

on clicked;wf_page_range(this)
end on

type em_copies from editmask within w_imprimir
integer x = 366
integer y = 148
integer width = 238
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "1"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#####"
end type

type st_2 from statictext within w_imprimir
integer x = 50
integer y = 164
integer width = 334
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "Nº de &Copias:"
boolean focusrectangle = false
end type

type sle_printer from singlelineedit within w_imprimir
integer x = 293
integer y = 52
integer width = 864
integer height = 84
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
boolean border = false
boolean autohscroll = false
end type

type st_1 from statictext within w_imprimir
integer x = 50
integer y = 52
integer width = 270
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "&Impresora:"
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_imprimir
integer x = 1403
integer y = 68
integer width = 334
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Ac&eptar"
boolean default = true
end type

event clicked;string tmp, command, docname, named
long row 
int	value

choose case lower(left(ddlb_range.text,1)) // determina si se seleccionaron todas, pares o impares
	case 'a' // todas
		tmp = '0'
	case 'e' // pares
		tmp = '0'//'1'
	case 'o' // impares
		tmp = '2'
end choose
command = 'datawindow.print.page.rangeinclude = '+tmp
if cbx_collate.checked then 
	command = command +  " datawindow.print.collate = yes" // páginas intercaladas
else
	command = command +  " datawindow.print.collate = no"
end if
choose case is_page_range // selección
	case 'a'  // all
		tmp = ''
	case 'c' // current page?
		row = idw_dw.getrow()
		tmp = idw_dw.describe("evaluate('page()',"+string(row)+")")
	case 'p' // a range?
		tmp = sle_page_range.text
end choose		
if len(tmp) > 0 then command = command +  " datawindow.print.page.range = '"+tmp+"'"

// number of copies ?
if len(em_copies.text) > 0 then command = command +  " datawindow.print.copies = "+em_copies.text

if cbx_print_to_file.checked then // print to file ?
	value = GetFileSaveName("Imprimir a un archivo", docname, named, "PRN", "Print (*.PRN),*.PRN")
	if value = 1 then 
		command = command + " datawindow.print.filename = '"+docname+"'"
	else // they canceled out of the dialog so quit completely
		return
	end if
end if

// now alter the datawindow
tmp = idw_dw.modify(command)

if len(tmp) > 0 then // if error the display the 
	messagebox('Error en seteo de impresora','Mensaje de error = ' + tmp + '~r~nCommand = ' + command)
	return
end if
ii_return = 1
closewithreturn(parent,ii_return)


end event

type gb_1 from groupbox within w_imprimir
integer x = 46
integer y = 260
integer width = 1225
integer height = 424
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "Intérvalo de páginas"
end type

