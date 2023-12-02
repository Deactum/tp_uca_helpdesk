$PBExportHeader$uo_envio_email.sru
forward
global type uo_envio_email from nonvisualobject
end type
end forward

global type uo_envio_email from nonvisualobject
end type
global uo_envio_email uo_envio_email

type variables
String Is_Directorio_Actual
String Is_RegKey = "HKEY_CURRENT_USER\Software\DORASISTEMAS\PB_EMAIL"

private string is_perfil_nombre
private string is_perfil_contrasenia
private string is_destinatario_nombre
private string is_destinatario_email
private string is_destinatario_copia_nombre
private string is_destinatario_copia_email
private string is_destinatario_copia_oculta_nombre
private string is_destinatario_copia_oculta_email
private string is_asunto
private string is_mensaje
private string is_archivo_adjunto[]


end variables
forward prototypes
public function string of_getreg (string as_entry, string as_default)
public subroutine of_leer_valores ()
public subroutine of_setreg (string as_entry, string as_value)
public subroutine of_escribir_valores ()
public subroutine set_perfil_correo (string as_nombre, string as_contrasenia)
public subroutine set_destinatario (string as_nombre, string as_email)
public subroutine set_destinatario_copia (string as_nombre, string as_email)
public subroutine set_destinatario_copia_oculta (string as_nombre, string as_email)
public subroutine set_mensaje (string as_asunto, string as_mensaje)
public subroutine of_agregar_adjunto (string ls_path)
public function string get_perfil_nombre ()
public function string get_perfil_contrasenia ()
public function string get_destinatario_nombre ()
public function string get_destinatario_email ()
public function string get_destinatario_copia_nombre ()
public function string get_destinatario_copia_email ()
public function string get_destinatario_copia_oculta_nombre ()
public function string get_destinatario_copia_oculta_email ()
public function string get_asunto ()
public function string get_mensaje ()
public function string get_archivo_adjunto ()
public subroutine of_enviar ()
end prototypes

public function string of_getreg (string as_entry, string as_default);
String ls_RegValue

RegistryGet(Is_RegKey, as_Entry, ls_RegValue)

IF ls_RegValue = "" THEN
	ls_RegValue = as_Default
END IF

RETURN ls_RegValue

end function

public subroutine of_leer_valores ();is_perfil_nombre                 =of_GetReg("PerfilNombre","")
is_perfil_contrasenia              =of_GetReg("PerfilContraseña","")

is_destinatario_nombre              =of_GetReg("DestinatarioNombre","")
is_destinatario_email               =of_GetReg("DestinatarioEmail","")
                                          
is_destinatario_copia_nombre        =of_GetReg("DestinatarioCopiaNombre","")
is_destinatario_copia_email         =of_GetReg("DestinatarioCopiaEmail","")
                                          
is_destinatario_copia_oculta_nombre =of_GetReg("DestinatarioCopiaOcultaNombre","")
is_destinatario_copia_oculta_email  =of_GetReg("DestinatarioCopiaOcultaEmail","")

                                          
is_asunto                          =of_GetReg("Asunto","")
is_mensaje                         =of_GetReg("Mensaje","")                              


// Los Datos del archivo adjunto al Email
Integer li_max , li_idx, ll_len
String  ls_Nombre_Archivo

li_max                                    =Integer(of_GetReg("Adjuntos","0"))

FOR li_idx = 1 TO li_max
	ls_Nombre_Archivo = of_GetReg("Adjunto"+String(li_idx,"000"),"")  
	//lb_Archivo_Adjunto.AddItem(ls_Nombre_Archivo)
	ll_len = upperbound(is_archivo_adjunto)
	is_archivo_adjunto[ll_len+1] = ls_Nombre_Archivo
NEXT


end subroutine

public subroutine of_setreg (string as_entry, string as_value);RegistrySet(Is_RegKey, as_Entry, as_Value)

end subroutine

public subroutine of_escribir_valores ();Of_SetReg("PerfilNombre", is_perfil_nombre)
Of_SetReg("PerfilContraseña", is_perfil_contrasenia)

Of_SetReg("DestinatarioNombre", is_destinatario_nombre)
Of_SetReg("DestinatarioEmail", is_destinatario_email)	 

Of_SetReg("DestinatarioCopiaNombre", is_destinatario_copia_nombre)
Of_SetReg("DestinatarioCopiaEmail", is_destinatario_copia_email)
  
Of_SetReg("DestinatarioCopiaOcultaNombre", is_destinatario_copia_oculta_nombre) 
Of_SetReg("DestinatarioCopiaOcultaEmail", is_destinatario_copia_oculta_email)

Of_SetReg("Asunto",is_asunto)
Of_SetReg("Mensaje",is_mensaje)

// Los Datos del archivo adjunto al Email
Integer li_max , li_idx
String  ls_Nombre_Archivo

li_max = upperbound(is_archivo_adjunto)
Of_SetReg("Adjuntos", String(li_max) )

FOR li_idx = 1 TO li_max
	 ls_Nombre_Archivo = is_archivo_adjunto[li_idx]
	 Of_SetReg("Adjunto"+String(li_idx,"000"), ls_Nombre_Archivo )
NEXT


end subroutine

public subroutine set_perfil_correo (string as_nombre, string as_contrasenia);is_perfil_nombre = as_nombre
is_perfil_contrasenia = as_contrasenia
end subroutine

public subroutine set_destinatario (string as_nombre, string as_email);is_destinatario_nombre = as_nombre
is_destinatario_email = as_email
end subroutine

public subroutine set_destinatario_copia (string as_nombre, string as_email);is_destinatario_copia_nombre = as_nombre
is_destinatario_copia_email =  as_email
end subroutine

public subroutine set_destinatario_copia_oculta (string as_nombre, string as_email);is_destinatario_copia_oculta_nombre = as_nombre
is_destinatario_copia_oculta_email = as_email
end subroutine

public subroutine set_mensaje (string as_asunto, string as_mensaje);is_asunto = as_asunto
is_mensaje = as_mensaje
end subroutine

public subroutine of_agregar_adjunto (string ls_path);long ll_len
ll_len = upperbound(is_archivo_adjunto)
is_archivo_adjunto[ll_len+1] = ls_path
end subroutine

public function string get_perfil_nombre ();return is_perfil_nombre
end function

public function string get_perfil_contrasenia ();return is_perfil_contrasenia
end function

public function string get_destinatario_nombre ();return is_destinatario_nombre
end function

public function string get_destinatario_email ();return is_destinatario_email
end function

public function string get_destinatario_copia_nombre ();return is_destinatario_copia_nombre
end function

public function string get_destinatario_copia_email ();return is_destinatario_copia_email
end function

public function string get_destinatario_copia_oculta_nombre ();return is_destinatario_copia_oculta_nombre
end function

public function string get_destinatario_copia_oculta_email ();return is_destinatario_copia_oculta_email
end function

public function string get_asunto ();return is_asunto
end function

public function string get_mensaje ();return is_mensaje
end function

public function string get_archivo_adjunto ();return ''
end function

public subroutine of_enviar ();
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
	ls_Perfil = TRIM(is_perfil_nombre)
	ls_Contraseña = TRIM(is_perfil_contrasenia)
	
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
	IF is_destinatario_email <> '' THEN
		lmr_Recipient.Address = is_destinatario_email
		lmr_Recipient.Name = '"' + is_destinatario_nombre + '"' + ' <' + lmr_Recipient.Address + '>'
		lmr_Recipient.RecipientType = MailTo!
		lmm_Message.Recipient[UpperBound(lmm_Message.Recipient) + 1 ] = lmr_Recipient
	END IF
	
	// Los Datos del Destinatario en Copia
	IF is_destinatario_copia_email <> '' THEN		
		lmr_Recipient.Address = is_destinatario_copia_email
		lmr_Recipient.Name = '"' + is_destinatario_copia_nombre + '"' + ' <' + lmr_Recipient.Address + '>'		
		lmr_Recipient.RecipientType = MailCC!
		lmm_Message.Recipient[UpperBound(lmm_Message.Recipient) + 1 ] = lmr_Recipient		
	END IF
	
	// Los Datos del Destinatario en Copia Oculta
	IF is_destinatario_copia_oculta_email <> '' THEN
		lmr_Recipient.Address = is_destinatario_copia_oculta_email
		lmr_Recipient.Name = '"' + is_destinatario_copia_oculta_nombre + '"' + ' <' + lmr_Recipient.Address + '>'				
		lmr_Recipient.RecipientType = MailBCC!
		lmm_Message.Recipient[UpperBound(lmm_Message.Recipient) + 1 ] = lmr_Recipient				
	END IF
	
	// Los Datos del Asunto
	lmm_Message.Subject = is_asunto 
	
	// Los Datos del Mensaje
	lmm_Message.NoteText =   is_mensaje
	
	// Los Datos del archivo adjunto al EMail
	//li_max = lb_Archivo_Adjunto.TotalItems()
	li_max = upperbound(is_archivo_adjunto)
	FOR li_idx = 1 TO li_max
		ls_Nombre_Archivo = is_archivo_adjunto[li_idx] 
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
		MessageBox ( 'Enviar Correo', "Mensaje Enviado" )
	ELSE
		MessageBox ('Enviar Correo', "Error: Mensaje no puedo ser enviado" , StopSign!)
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
end subroutine

on uo_envio_email.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_envio_email.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

