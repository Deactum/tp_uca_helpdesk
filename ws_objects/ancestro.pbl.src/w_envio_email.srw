$PBExportHeader$w_envio_email.srw
forward
global type w_envio_email from window
end type
type cb_del from commandbutton within w_envio_email
end type
type cb_addfile from commandbutton within w_envio_email
end type
type lb_archivo_adjunto from listbox within w_envio_email
end type
type sle_perfil_contraseña from singlelineedit within w_envio_email
end type
type sle_perfil_nombre from singlelineedit within w_envio_email
end type
type st_perfil_nombre from statictext within w_envio_email
end type
type st_perfil_contraseña from statictext within w_envio_email
end type
type st_destinatario_copia_oculta_email from statictext within w_envio_email
end type
type st_destinatario_copia_email from statictext within w_envio_email
end type
type st_destinatario_copia_oculta_nombre from statictext within w_envio_email
end type
type st_destinatario_copia_nombre from statictext within w_envio_email
end type
type sle_destinatario_copia_oculta_email from singlelineedit within w_envio_email
end type
type sle_destinatario_copia_oculta_nombre from singlelineedit within w_envio_email
end type
type sle_destinatario_copia_email from singlelineedit within w_envio_email
end type
type sle_destinatario_copia_nombre from singlelineedit within w_envio_email
end type
type st_destinatario_nombre from statictext within w_envio_email
end type
type st_destinatario_email from statictext within w_envio_email
end type
type sle_asunto from singlelineedit within w_envio_email
end type
type sle_destinatario_nombre from singlelineedit within w_envio_email
end type
type sle_destinatario_email from singlelineedit within w_envio_email
end type
type cb_enviar_correo from commandbutton within w_envio_email
end type
type gb_asunto from groupbox within w_envio_email
end type
type gb_destinatario_copia_oculta from groupbox within w_envio_email
end type
type gb_destinatario from groupbox within w_envio_email
end type
type gb_destinatario_copia from groupbox within w_envio_email
end type
type gb_perfil_de_correo from groupbox within w_envio_email
end type
type mle_mensaje from multilineedit within w_envio_email
end type
type gb_mensaje from groupbox within w_envio_email
end type
type gb_archivos_adjuntos from groupbox within w_envio_email
end type
end forward

global type w_envio_email from window
integer width = 3515
integer height = 2372
boolean titlebar = true
string title = "PB Email Demo"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_del cb_del
cb_addfile cb_addfile
lb_archivo_adjunto lb_archivo_adjunto
sle_perfil_contraseña sle_perfil_contraseña
sle_perfil_nombre sle_perfil_nombre
st_perfil_nombre st_perfil_nombre
st_perfil_contraseña st_perfil_contraseña
st_destinatario_copia_oculta_email st_destinatario_copia_oculta_email
st_destinatario_copia_email st_destinatario_copia_email
st_destinatario_copia_oculta_nombre st_destinatario_copia_oculta_nombre
st_destinatario_copia_nombre st_destinatario_copia_nombre
sle_destinatario_copia_oculta_email sle_destinatario_copia_oculta_email
sle_destinatario_copia_oculta_nombre sle_destinatario_copia_oculta_nombre
sle_destinatario_copia_email sle_destinatario_copia_email
sle_destinatario_copia_nombre sle_destinatario_copia_nombre
st_destinatario_nombre st_destinatario_nombre
st_destinatario_email st_destinatario_email
sle_asunto sle_asunto
sle_destinatario_nombre sle_destinatario_nombre
sle_destinatario_email sle_destinatario_email
cb_enviar_correo cb_enviar_correo
gb_asunto gb_asunto
gb_destinatario_copia_oculta gb_destinatario_copia_oculta
gb_destinatario gb_destinatario
gb_destinatario_copia gb_destinatario_copia
gb_perfil_de_correo gb_perfil_de_correo
mle_mensaje mle_mensaje
gb_mensaje gb_mensaje
gb_archivos_adjuntos gb_archivos_adjuntos
end type
global w_envio_email w_envio_email

type variables

String Is_Directorio_Actual
String Is_RegKey = "HKEY_CURRENT_USER\Software\DORASISTEMAS\PB_EMAIL"
end variables

forward prototypes
public function string of_getreg (string as_entry, string as_default)
public subroutine of_setreg (string as_entry, string as_value)
public subroutine of_leer_valores ()
public subroutine of_escribir_valores ()
end prototypes

public function string of_getreg (string as_entry, string as_default);
String ls_RegValue

RegistryGet(Is_RegKey, as_Entry, ls_RegValue)

IF ls_RegValue = "" THEN
	ls_RegValue = as_Default
END IF

RETURN ls_RegValue

end function

public subroutine of_setreg (string as_entry, string as_value);
RegistrySet(Is_RegKey, as_Entry, as_Value)

end subroutine

public subroutine of_leer_valores ();                                          

sle_Perfil_Nombre.text                 =of_GetReg("PerfilNombre","")
sle_Perfil_Contraseña.text              =of_GetReg("PerfilContraseña","")

sle_Destinatario_Nombre.text              =of_GetReg("DestinatarioNombre","")
sle_Destinatario_Email.text               =of_GetReg("DestinatarioEmail","")
                                          
sle_Destinatario_Copia_Nombre.text        =of_GetReg("DestinatarioCopiaNombre","")
sle_Destinatario_Copia_Email.text         =of_GetReg("DestinatarioCopiaEmail","")
                                          
sle_Destinatario_Copia_Oculta_Nombre.text =of_GetReg("DestinatarioCopiaOcultaNombre","")
sle_Destinatario_Copia_Oculta_Email.text  =of_GetReg("DestinatarioCopiaOcultaEmail","")

                                          
sle_Asunto.text                           =of_GetReg("Asunto","")
mle_Mensaje.text                          =of_GetReg("Mensaje","")                              


// Los Datos del archivo adjunto al Email
Integer li_max , li_idx
String  ls_Nombre_Archivo

li_max                                    =Integer(of_GetReg("Adjuntos","0"))

FOR li_idx = 1 TO li_max
	ls_Nombre_Archivo = of_GetReg("Adjunto"+String(li_idx,"000"),"")  
	lb_Archivo_Adjunto.AddItem(ls_Nombre_Archivo)
NEXT

end subroutine

public subroutine of_escribir_valores ();
Of_SetReg("PerfilNombre", sle_Perfil_Nombre.text)
Of_SetReg("PerfilContraseña", sle_Perfil_Contraseña.text)

Of_SetReg("DestinatarioNombre", sle_Destinatario_Nombre.text)
Of_SetReg("DestinatarioEmail", sle_Destinatario_Email.text)	 

Of_SetReg("DestinatarioCopiaNombre", sle_Destinatario_Copia_Nombre.text)
Of_SetReg("DestinatarioCopiaEmail", sle_Destinatario_Copia_Email.text)
  
Of_SetReg("DestinatarioCopiaOcultaNombre", sle_Destinatario_Copia_Oculta_Nombre.text) 
Of_SetReg("DestinatarioCopiaOcultaEmail", sle_Destinatario_Copia_Oculta_Email.text)

Of_SetReg("Asunto", sle_Asunto.text)
Of_SetReg("Mensaje", mle_Mensaje.text)

// Los Datos del archivo adjunto al Email
Integer li_max , li_idx
String  ls_Nombre_Archivo

li_max = lb_Archivo_Adjunto.TotalItems()

Of_SetReg("Adjuntos", String(li_max) )

FOR li_idx = 1 TO li_max
	 ls_Nombre_Archivo = lb_Archivo_Adjunto.Text(li_idx)
	 Of_SetReg("Adjunto"+String(li_idx,"000"), ls_Nombre_Archivo )
NEXT

end subroutine

on w_envio_email.create
this.cb_del=create cb_del
this.cb_addfile=create cb_addfile
this.lb_archivo_adjunto=create lb_archivo_adjunto
this.sle_perfil_contraseña=create sle_perfil_contraseña
this.sle_perfil_nombre=create sle_perfil_nombre
this.st_perfil_nombre=create st_perfil_nombre
this.st_perfil_contraseña=create st_perfil_contraseña
this.st_destinatario_copia_oculta_email=create st_destinatario_copia_oculta_email
this.st_destinatario_copia_email=create st_destinatario_copia_email
this.st_destinatario_copia_oculta_nombre=create st_destinatario_copia_oculta_nombre
this.st_destinatario_copia_nombre=create st_destinatario_copia_nombre
this.sle_destinatario_copia_oculta_email=create sle_destinatario_copia_oculta_email
this.sle_destinatario_copia_oculta_nombre=create sle_destinatario_copia_oculta_nombre
this.sle_destinatario_copia_email=create sle_destinatario_copia_email
this.sle_destinatario_copia_nombre=create sle_destinatario_copia_nombre
this.st_destinatario_nombre=create st_destinatario_nombre
this.st_destinatario_email=create st_destinatario_email
this.sle_asunto=create sle_asunto
this.sle_destinatario_nombre=create sle_destinatario_nombre
this.sle_destinatario_email=create sle_destinatario_email
this.cb_enviar_correo=create cb_enviar_correo
this.gb_asunto=create gb_asunto
this.gb_destinatario_copia_oculta=create gb_destinatario_copia_oculta
this.gb_destinatario=create gb_destinatario
this.gb_destinatario_copia=create gb_destinatario_copia
this.gb_perfil_de_correo=create gb_perfil_de_correo
this.mle_mensaje=create mle_mensaje
this.gb_mensaje=create gb_mensaje
this.gb_archivos_adjuntos=create gb_archivos_adjuntos
this.Control[]={this.cb_del,&
this.cb_addfile,&
this.lb_archivo_adjunto,&
this.sle_perfil_contraseña,&
this.sle_perfil_nombre,&
this.st_perfil_nombre,&
this.st_perfil_contraseña,&
this.st_destinatario_copia_oculta_email,&
this.st_destinatario_copia_email,&
this.st_destinatario_copia_oculta_nombre,&
this.st_destinatario_copia_nombre,&
this.sle_destinatario_copia_oculta_email,&
this.sle_destinatario_copia_oculta_nombre,&
this.sle_destinatario_copia_email,&
this.sle_destinatario_copia_nombre,&
this.st_destinatario_nombre,&
this.st_destinatario_email,&
this.sle_asunto,&
this.sle_destinatario_nombre,&
this.sle_destinatario_email,&
this.cb_enviar_correo,&
this.gb_asunto,&
this.gb_destinatario_copia_oculta,&
this.gb_destinatario,&
this.gb_destinatario_copia,&
this.gb_perfil_de_correo,&
this.mle_mensaje,&
this.gb_mensaje,&
this.gb_archivos_adjuntos}
end on

on w_envio_email.destroy
destroy(this.cb_del)
destroy(this.cb_addfile)
destroy(this.lb_archivo_adjunto)
destroy(this.sle_perfil_contraseña)
destroy(this.sle_perfil_nombre)
destroy(this.st_perfil_nombre)
destroy(this.st_perfil_contraseña)
destroy(this.st_destinatario_copia_oculta_email)
destroy(this.st_destinatario_copia_email)
destroy(this.st_destinatario_copia_oculta_nombre)
destroy(this.st_destinatario_copia_nombre)
destroy(this.sle_destinatario_copia_oculta_email)
destroy(this.sle_destinatario_copia_oculta_nombre)
destroy(this.sle_destinatario_copia_email)
destroy(this.sle_destinatario_copia_nombre)
destroy(this.st_destinatario_nombre)
destroy(this.st_destinatario_email)
destroy(this.sle_asunto)
destroy(this.sle_destinatario_nombre)
destroy(this.sle_destinatario_email)
destroy(this.cb_enviar_correo)
destroy(this.gb_asunto)
destroy(this.gb_destinatario_copia_oculta)
destroy(this.gb_destinatario)
destroy(this.gb_destinatario_copia)
destroy(this.gb_perfil_de_correo)
destroy(this.mle_mensaje)
destroy(this.gb_mensaje)
destroy(this.gb_archivos_adjuntos)
end on

event open;
Of_Leer_Valores()
end event

event close; 
Of_Escribir_Valores()
end event

type cb_del from commandbutton within w_envio_email
integer x = 50
integer y = 1804
integer width = 261
integer height = 100
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Eliminar"
end type

event clicked;// delete attachment

Integer li_Fila

li_Fila = lb_Archivo_Adjunto.SelectedIndex()
If li_Fila > 0 Then
	lb_Archivo_Adjunto.DeleteItem(li_Fila)
End If

end event

type cb_addfile from commandbutton within w_envio_email
integer x = 50
integer y = 1696
integer width = 261
integer height = 100
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Agregar"
end type

event clicked;
String ls_Nombre_Ruta, ls_Nombre_Archivo[], ls_Filtro, ls_Archivo
Integer li_rc, li_Contador, li_Indice

ls_Filtro = "Todos los archivos,*.*"

li_rc = GetFileOpenName  ( "Seleccione Archivo(s) para Adjuntar", ls_Nombre_Ruta, ls_Nombre_Archivo[] , "", ls_Filtro)
IF li_rc = 1 THEN
	li_Contador = UpperBound ( ls_Nombre_Archivo[] )
	IF li_Contador >1 THEN
		FOR li_Indice = 1 TO li_Contador
			ls_Archivo = "" 
			ls_Archivo = ls_Nombre_Ruta + '\' + ls_Nombre_Archivo[li_Indice]
			lb_Archivo_Adjunto.AddItem(ls_Archivo)
		NEXT
	ELSE
		lb_Archivo_Adjunto.AddItem(ls_Nombre_Ruta)
	END IF
END IF


end event

type lb_archivo_adjunto from listbox within w_envio_email
integer x = 343
integer y = 1696
integer width = 3063
integer height = 496
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type sle_perfil_contraseña from singlelineedit within w_envio_email
integer x = 270
integer y = 192
integer width = 818
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type sle_perfil_nombre from singlelineedit within w_envio_email
integer x = 270
integer y = 88
integer width = 818
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_perfil_nombre from statictext within w_envio_email
integer x = 23
integer y = 100
integer width = 233
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Perfil:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_perfil_contraseña from statictext within w_envio_email
integer x = 32
integer y = 200
integer width = 224
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Clave:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_destinatario_copia_oculta_email from statictext within w_envio_email
integer x = 2363
integer y = 516
integer width = 224
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Email:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_destinatario_copia_email from statictext within w_envio_email
integer x = 1198
integer y = 516
integer width = 224
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Email:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_destinatario_copia_oculta_nombre from statictext within w_envio_email
integer x = 2363
integer y = 420
integer width = 224
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nombre:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_destinatario_copia_nombre from statictext within w_envio_email
integer x = 1198
integer y = 420
integer width = 224
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nombre:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_destinatario_copia_oculta_email from singlelineedit within w_envio_email
integer x = 2597
integer y = 504
integer width = 818
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_destinatario_copia_oculta_nombre from singlelineedit within w_envio_email
integer x = 2597
integer y = 408
integer width = 818
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_destinatario_copia_email from singlelineedit within w_envio_email
integer x = 1435
integer y = 504
integer width = 818
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_destinatario_copia_nombre from singlelineedit within w_envio_email
integer x = 1435
integer y = 408
integer width = 818
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_destinatario_nombre from statictext within w_envio_email
integer x = 32
integer y = 420
integer width = 224
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nombre:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_destinatario_email from statictext within w_envio_email
integer x = 32
integer y = 516
integer width = 224
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Email:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_asunto from singlelineedit within w_envio_email
integer x = 50
integer y = 696
integer width = 3360
integer height = 80
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "PB Envio de Correo"
borderstyle borderstyle = stylelowered!
end type

type sle_destinatario_nombre from singlelineedit within w_envio_email
integer x = 270
integer y = 408
integer width = 818
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_destinatario_email from singlelineedit within w_envio_email
integer x = 270
integer y = 504
integer width = 818
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_enviar_correo from commandbutton within w_envio_email
integer x = 2816
integer y = 832
integer width = 626
integer height = 192
integer taborder = 170
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Enviar correo"
end type

event clicked;
//Variables Locales a ser usadas 
String		ls_Perfil
String		ls_Contraseña
String     ls_Nombre_Archivo 
String     ls_Archivo
Integer   li_max
Integer   li_idx
MailSession lms_session
MailReturnCode lmrc_ReturnCode
MailRecipient lmr_Recipient
MailMessage lmm_Message
MailFileDescription lmfd_FileDescription

//Cambiar al Directorio Actual
ChangeDirectory ( Is_Directorio_Actual )

TRY
	SetPointer ( HourGlass! )
	
	// Crear el Objeto Mailsession
	lms_session = CREATE MailSession
	 
	// Establece una session segun el perfil 
	ls_Perfil = TRIM(sle_Perfil_Nombre.text)
	ls_Contraseña = TRIM(sle_Perfil_Contraseña.text)
	
	IF ls_Perfil = "" OR IsNull(ls_Perfil)  THEN
		lmrc_ReturnCode = lms_session.MailLogon(MailNewSessionWithDownLoad!)		
	ELSE
		lmrc_ReturnCode = lms_session.MailLogon(ls_Perfil , ls_Contraseña ,MailNewSessionWithDownLoad!)		
	END IF

	IF lmrc_ReturnCode <> MailReturnSuccess! THEN
		 MessageBox("Correo", 'Logueo Fallido.')
		 RETURN
	END IF

	//Concatena los Valores que Necesita
	// Los Datos del Destinatario
	IF sle_Destinatario_EMail.text <> '' THEN
		lmr_Recipient.Address = sle_Destinatario_EMail.text
		lmr_Recipient.Name = '"' + sle_Destinatario_Nombre.text + '"' + ' <' + lmr_Recipient.Address + '>'
		lmr_Recipient.RecipientType = MailTo!
		lmm_Message.Recipient[UpperBound(lmm_Message.Recipient) + 1 ] = lmr_Recipient
	END IF
	
	// Los Datos del Destinatario en Copia
	IF sle_Destinatario_Copia_EMail.text <> '' THEN		
		lmr_Recipient.Address = sle_Destinatario_Copia_EMail.text
		lmr_Recipient.Name = '"' + sle_Destinatario_Copia_Nombre.text + '"' + ' <' + lmr_Recipient.Address + '>'		
		lmr_Recipient.RecipientType = MailCC!
		lmm_Message.Recipient[UpperBound(lmm_Message.Recipient) + 1 ] = lmr_Recipient		
	END IF
	
	// Los Datos del Destinatario en Copia Oculta
	IF sle_Destinatario_Copia_Oculta_EMail.text <> '' THEN
		lmr_Recipient.Address = sle_Destinatario_Copia_Oculta_EMail.text
		lmr_Recipient.Name = '"' + sle_Destinatario_Copia_Oculta_Nombre.text + '"' + ' <' + lmr_Recipient.Address + '>'				
		lmr_Recipient.RecipientType = MailBCC!
		lmm_Message.Recipient[UpperBound(lmm_Message.Recipient) + 1 ] = lmr_Recipient				
	END IF
	
	// Los Datos del Asunto
	lmm_Message.Subject = sle_Asunto.text 
	
	// Los Datos del Mensaje
	lmm_Message.NoteText =   mle_Mensaje.text
	
	// Los Datos del archivo adjunto al EMail
	li_max = lb_Archivo_Adjunto.TotalItems()
	FOR li_idx = 1 TO li_max
		ls_Nombre_Archivo = lb_Archivo_Adjunto.Text(li_idx)
		ls_Archivo =  Mid(ls_Nombre_Archivo, LastPos(ls_Nombre_Archivo, "\") +1 )
		lmfd_FileDescription.FileType = MailAttach!
		lmfd_FileDescription.Filename = ls_Archivo
		lmfd_FileDescription.Pathname = ls_Nombre_Archivo
		lmfd_FileDescription.Position = li_idx
		lmm_Message.AttachmentFile[li_idx] = lmfd_FileDescription
	NEXT

	// Enviar el Correo
	lmrc_ReturnCode = lms_session.MailSend(lmm_Message)
	
	//Verificar si Funciono
	IF lmrc_ReturnCode = MailReturnSuccess!  THEN 
		MessageBox ( THIS.Text, "Mensaje Enviado" )
	ELSE
		MessageBox ( THIS.text, "Error: Mensaje no puedo ser enviado" , StopSign!)
	END IF
	
CATCH (Exception ce)
  MessageBox( " Exception", ce.getMessage() )
CATCH ( PBXRuntimeError pbxre )
	MessageBox( "PBX Exception", pbxre.getMessage() )
CATCH ( NullObjectError noe )
	MessageBox( "Null Object Exception", noe.getMessage() )	
CATCH (RunTimeError er)
 MessageBox( "Run Time Error Exception", er.getMessage() )	
CATCH ( Throwable oe )
	MessageBox( "Other Exception", oe.getMessage() )	
FINALLY
	// Al Finalizar desconectarse y destruir el Objeto MailSession
	lms_session.MailLogoff()
	DESTROY lms_session
END TRY

Of_Escribir_Valores()

RETURN

end event

type gb_asunto from groupbox within w_envio_email
integer x = 14
integer y = 632
integer width = 3424
integer height = 192
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Asunto"
end type

type gb_destinatario_copia_oculta from groupbox within w_envio_email
integer x = 2341
integer y = 336
integer width = 1102
integer height = 292
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Con Copia Oculta"
end type

type gb_destinatario from groupbox within w_envio_email
integer x = 14
integer y = 336
integer width = 1102
integer height = 292
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Para"
end type

type gb_destinatario_copia from groupbox within w_envio_email
integer x = 1179
integer y = 336
integer width = 1102
integer height = 292
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Con Copia"
end type

type gb_perfil_de_correo from groupbox within w_envio_email
integer x = 14
integer y = 24
integer width = 1102
integer height = 292
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Perfil de Correo"
end type

type mle_mensaje from multilineedit within w_envio_email
integer x = 50
integer y = 1088
integer width = 3360
integer height = 496
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "Hola, estas es una prueba genial DORA SISTEMAS PERU"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_mensaje from groupbox within w_envio_email
integer x = 14
integer y = 1024
integer width = 3433
integer height = 608
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mensaje"
end type

type gb_archivos_adjuntos from groupbox within w_envio_email
integer x = 14
integer y = 1632
integer width = 3433
integer height = 608
integer taborder = 170
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Archivos Adjuntos"
end type

