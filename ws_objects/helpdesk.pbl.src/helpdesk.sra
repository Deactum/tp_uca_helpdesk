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

end variables
global type helpdesk from application
string appname = "helpdesk"
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 19.0\IDE\theme"
string themename = "Do Not Use Themes"
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

//aplica el tema azul 
applytheme('.\theme190\Flat Design Blue')

//abre la ventana de inicio de sesión 
openwithparm(w_login,0)
l_ret = message.longparm
if l_ret = 1 then 
	n_connectservice lnv_connectserv
	lnv_connectserv = Create using "n_connectservice"
	
	If lnv_connectserv.of_ConnectDB ( ) = 0 Then
		open(w_principal_base)
	else
		messagebox('','No Conectado...',stopsign!)
	End if
	
	Destroy lnv_connectserv
end if
//--------------------------------------------------------------------------------------
end event

event close;//*-----------------------------------------------------------------*/
//*    close:  Application Close Script:
//*            1) Instantiate a connection object
//*            2) Disconnect from the database
//*-----------------------------------------------------------------*/
n_connectservice lnv_connectserv

lnv_connectserv = Create using "n_connectservice"

lnv_connectserv.of_DisconnectDB ( )

Destroy lnv_connectserv
end event

