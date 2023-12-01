$PBExportHeader$helpdesk.sra
$PBExportComments$Generated MDI Application Object
forward
global type helpdesk from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
powerobject g_object

string gs_usu_codigo
string _path

boolean gb_gerente = False
boolean gb_encargado_tienda = False
boolean gb_tecnico_supervisor = False
boolean gb_tecnico = False

end variables
global type helpdesk from application
string appname = "helpdesk"
string themepath = ".\theme190"
string themename = "Flat Design Blue"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 2
long richtexteditx64type = 3
long richtexteditversion = 1
string richtexteditkey = ""
string appicon = ".\iconos\ico\pricipal.ico"
string appruntimeversion = "19.2.0.2703"
end type
global helpdesk helpdesk

type variables

end variables

on helpdesk.create
appname="helpdesk"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on helpdesk.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;long l_ret 
string ls_inifile = "./conexion.ini"

//aplica el tema azul 
applytheme('.\theme190\Flat Design Blue')

// se conecta a la base
n_connectservice lnv_connectserv
lnv_connectserv = Create using "n_connectservice"

sqlca.logid = ProfileString ( ls_inifile, "Database", "LogID", "")
sqlca.logpass = ProfileString ( ls_inifile, "Database", "LogPassword","")

If lnv_connectserv.of_ConnectDB ( ) = 0 Then
	
	//abre la ventana de inicio de sesión 
	openwithparm(w_login,0)
	
	l_ret = message.longparm
	
	if l_ret = 0 then 
		open(w_principal_base)
	end if 

End if


Destroy lnv_connectserv
_path = getcurrentdirectory()
//--------------------------------------------------------------------------------------
end event

event close;//*-----------------------------------------------------------------*/
//*    close:  Application Close Script:
//*            1) Instantiate a connection object
//*            2) Disconnect from the database
//*-----------------------------------------------------------------*/
n_connectservice lnv_connectserv

UPDATE USUARIOS
SET USUARIOS_SESION = 0
WHERE USUARIOS_CODIGO = :gs_usu_codigo
COMMIT USING SQLCA;

lnv_connectserv = Create using "n_connectservice"

lnv_connectserv.of_DisconnectDB ( )

Destroy lnv_connectserv
end event

