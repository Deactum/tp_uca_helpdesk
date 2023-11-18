$PBExportHeader$w_login.srw
$PBExportComments$ventana de login
forward
global type w_login from window
end type
type p_pass from picture within w_login
end type
type p_user from picture within w_login
end type
type cb_1 from commandbutton within w_login
end type
type sle_2 from singlelineedit within w_login
end type
type p_2 from picture within w_login
end type
type sle_1 from singlelineedit within w_login
end type
type ln_1 from line within w_login
end type
type ln_2 from line within w_login
end type
type r_1 from rectangle within w_login
end type
end forward

global type w_login from window
integer width = 1513
integer height = 860
boolean titlebar = true
string title = "Login"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
p_pass p_pass
p_user p_user
cb_1 cb_1
sle_2 sle_2
p_2 p_2
sle_1 sle_1
ln_1 ln_1
ln_2 ln_2
r_1 r_1
end type
global w_login w_login

type variables
long il_return = -1
end variables

on w_login.create
this.p_pass=create p_pass
this.p_user=create p_user
this.cb_1=create cb_1
this.sle_2=create sle_2
this.p_2=create p_2
this.sle_1=create sle_1
this.ln_1=create ln_1
this.ln_2=create ln_2
this.r_1=create r_1
this.Control[]={this.p_pass,&
this.p_user,&
this.cb_1,&
this.sle_2,&
this.p_2,&
this.sle_1,&
this.ln_1,&
this.ln_2,&
this.r_1}
end on

on w_login.destroy
destroy(this.p_pass)
destroy(this.p_user)
destroy(this.cb_1)
destroy(this.sle_2)
destroy(this.p_2)
destroy(this.sle_1)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.r_1)
end on

event open;r_1.fillcolor = rgb(17, 51, 85) 

end event

event closequery;message.longparm = il_return
end event

type p_pass from picture within w_login
boolean visible = false
integer x = 174
integer y = 456
integer width = 119
integer height = 104
string picturename = ".\iconos\png\dialogerror_92823.png"
boolean focusrectangle = false
string powertiptext = "Debe ingresar la contraseña "
end type

type p_user from picture within w_login
boolean visible = false
integer x = 174
integer y = 276
integer width = 119
integer height = 104
string picturename = ".\iconos\png\dialogerror_92823.png"
boolean focusrectangle = false
string powertiptext = "Debe ingresar un nombre de usuario"
end type

type cb_1 from commandbutton within w_login
integer x = 297
integer y = 604
integer width = 869
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ingresar"
end type

event clicked;string ls_user, ls_pass

ls_user = sle_1.text
ls_pass = sle_2.text

if ls_user = '' then 
	p_user.visible = true
	return
else
	p_user.visible = false
end if

if ls_pass = '' then 
	p_pass.visible = true
	return
else
	p_pass.visible = false
end if

SELECT CASE
				WHEN USUARIOS_CONTRASENA = :ls_pass THEN 0
			ELSE 1
			END AS OK_PASS
INTO :il_return
FROM USUARIOS
WHERE USUARIOS_CODIGO = :ls_user
COMMIT USING SQLCA;

if il_return <> 0 then 
	messagebox('Error de acceso', "Usuario o Password no son válidos, verifique si los ingresó correctamente e intente de nuevo. Si el error persiste consulte con administracion del sistema")
	return
end if 

close(parent)

end event

type sle_2 from singlelineedit within w_login
integer x = 297
integer y = 452
integer width = 869
integer height = 112
integer taborder = 20
integer transparency = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean border = false
boolean password = true
borderstyle borderstyle = stylelowered!
string placeholder = "Contraseña"
end type

type p_2 from picture within w_login
integer x = 1179
integer y = 460
integer width = 110
integer height = 96
integer transparency = 50
boolean originalsize = true
string picturename = ".\iconos\1x\baseline_visibility_off_black_24dp.png"
boolean focusrectangle = false
end type

event clicked;//cambia el icono y muestra el contenido de la contraseña 
choose case this.picturename
	case '.\iconos\1x\baseline_visibility_off_black_24dp.png' //visible
		this.picturename = '.\iconos\1x\baseline_visibility_black_24dp.png'
		sle_2.password = false
	case '.\iconos\1x\baseline_visibility_black_24dp.png'
		this.picturename = '.\iconos\1x\baseline_visibility_off_black_24dp.png'
		sle_2.password = true
end choose

end event

type sle_1 from singlelineedit within w_login
integer x = 297
integer y = 272
integer width = 869
integer height = 112
integer taborder = 10
integer transparency = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean border = false
borderstyle borderstyle = stylelowered!
string placeholder = "Usuario"
end type

type ln_1 from line within w_login
long linecolor = 33554432
integer linethickness = 4
integer beginx = 320
integer beginy = 564
integer endx = 1157
integer endy = 564
end type

type ln_2 from line within w_login
long linecolor = 33554432
integer linethickness = 4
integer beginx = 320
integer beginy = 384
integer endx = 1147
integer endy = 384
end type

type r_1 from rectangle within w_login
long linecolor = 134217748
linestyle linestyle = transparent!
integer linethickness = 4
long fillcolor = 134217741
integer x = -18
integer width = 1536
integer height = 200
end type

