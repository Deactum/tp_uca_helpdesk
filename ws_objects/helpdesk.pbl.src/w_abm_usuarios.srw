$PBExportHeader$w_abm_usuarios.srw
forward
global type w_abm_usuarios from w_abm_base
end type
type cb_3 from commandbutton within w_abm_usuarios
end type
end forward

global type w_abm_usuarios from w_abm_base
integer width = 2514
integer height = 1100
cb_3 cb_3
end type
global w_abm_usuarios w_abm_usuarios

on w_abm_usuarios.create
int iCurrent
call super::create
this.cb_3=create cb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
end on

on w_abm_usuarios.destroy
call super::destroy
destroy(this.cb_3)
end on

type cb_cancelar  from w_abm_base`cb_cancelar within w_abm_usuarios
integer x = 1655
integer y = 872
integer taborder = 10
end type

type cb_aceptar from w_abm_base`cb_aceptar within w_abm_usuarios
integer x = 2053
integer y = 872
integer taborder = 30
end type

type dw_datos from w_abm_base`dw_datos within w_abm_usuarios
integer y = 40
integer width = 2459
integer height = 820
integer taborder = 20
string dataobject = "dw_abm_usuarios"
end type

event dw_datos::clicked;call super::clicked;
choose case dwo.name 
	case 'p_1'
		messagebox('','img')
	case 'p_2'
		this.modify("p_2.file_name='.\iconos\1x\baseline_visibility_black_24dp.png'")
	case 'b_subir'
		messagebox('','subir')
end choose
end event

type cb_3 from commandbutton within w_abm_usuarios
integer x = 37
integer y = 872
integer width = 402
integer height = 112
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Dar de Baja"
end type

