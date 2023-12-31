﻿$PBExportHeader$n_connectservice.sru
$PBExportComments$Generated Database Connection Service
forward
global type n_connectservice from nonvisualobject
end type
end forward

global type n_connectservice from nonvisualobject
end type
global n_connectservice n_connectservice

type variables
string is_connectfrom = "1"

CONSTANT string IS_USE_INIFILE 	= "1"
CONSTANT string IS_USE_REGISTRY	= "2"
CONSTANT string IS_USE_SCRIPT 	= "3"

//usuarios  y contraseñas por default 
string is_user
string is_pass
end variables

forward prototypes
public function integer of_getconnectioninfo (ref string as_dbms, ref string as_database, ref string as_userid, ref string as_dbpass, ref string as_logid, ref string as_logpass, ref string as_server, ref string as_dbparm, ref string as_lock, ref string as_autocommit)
public function integer of_connectdb ()
public function integer of_disconnectdb ()
end prototypes

public function integer of_getconnectioninfo (ref string as_dbms, ref string as_database, ref string as_userid, ref string as_dbpass, ref string as_logid, ref string as_logpass, ref string as_server, ref string as_dbparm, ref string as_lock, ref string as_autocommit);//*--------------------------------------------------------*/
//*  The source of connection information can be changed by
//*  altering the value of the 'is_connectfrom' variable.
//*--------------------------------------------------------*/
Choose Case is_connectfrom
		
	Case IS_USE_INIFILE						/*  Populate Database Connection from INI file  */
		string ls_inifile = "./conexion.ini"
		
		as_dbms			= ProfileString ( ls_inifile, "Database", "DBMS", "SNC SQL Native Client(OLE DB)")
		as_database		= ProfileString ( ls_inifile, "Database", "Database", "")
		as_userid		= ProfileString ( ls_inifile, "Database", "UserID", "")
		as_dbpass		= ProfileString ( ls_inifile, "Database", "DBPass", "")
		as_logid			= ProfileString ( ls_inifile, "Database", "LogID", "") //sa
		as_logpass		= ProfileString ( ls_inifile, "Database", "LogPassword","") //123
		as_server		= ProfileString ( ls_inifile, "Database", "Servername", "192.168.100.200")
		as_dbparm		= ProfileString ( ls_inifile, "Database", "DBParm", "Database='bd_helpdesk'")
		as_lock			= ProfileString ( ls_inifile, "Database", "Lock", "")
		as_autocommit	= ProfileString ( ls_inifile, "Database", "AutoCommit",	"false")

	Case IS_USE_REGISTRY						/*  Populate Database Connection from Registry  */
		string ls_registrykey = "" + "\DataBase"
		
		If RegistryGet ( ls_registrykey, "DBMS", 		RegString!, as_dbms ) <> 1 Then
			RegistrySet ( ls_registrykey, "DBMS", 		RegString!, "SNC SQL Native Client(OLE DB)" )
			RegistryGet ( ls_registrykey, "DBMS", 		RegString!, as_dbms )
		End If
		If RegistryGet ( ls_registrykey, "Database", 	RegString!, as_database ) <> 1 Then
			RegistrySet ( ls_registrykey, "Database", 	RegString!, "" )
			RegistryGet ( ls_registrykey, "Database", 	RegString!, as_database )
		End If
		If RegistryGet ( ls_registrykey, "UserID", 		RegString!, as_userid ) <> 1 Then
			RegistrySet ( ls_registrykey, "UserID", 		RegString!, "" )
			RegistryGet ( ls_registrykey, "UserID", 		RegString!, as_userid )
		End If
		If RegistryGet ( ls_registrykey, "DBPass", 		RegString!, as_dbpass ) <> 1 Then
			RegistrySet ( ls_registrykey, "DBPass", 		RegString!, "" )
			RegistryGet ( ls_registrykey, "DBPass", 		RegString!, as_dbpass )
		End If
		If RegistryGet ( ls_registrykey, "LogID", 		RegString!, as_logid ) <> 1 Then
			RegistrySet ( ls_registrykey, "LogID", 		RegString!, "sa" )
			RegistryGet ( ls_registrykey, "LogID", 		RegString!, as_logid )
		End If
		If RegistryGet ( ls_registrykey, "LogPassword", RegString!, as_logpass ) <> 1 Then
			RegistrySet ( ls_registrykey, "LogPassword", RegString!, "123" )
			RegistryGet ( ls_registrykey, "LogPassword", RegString!, as_logpass )
		End If
		If RegistryGet ( ls_registrykey, "Servername", 	RegString!, as_server ) <> 1 Then
			RegistrySet ( ls_registrykey, "Servername", 	RegString!, "192.168.100.200" )
			RegistryGet ( ls_registrykey, "Servername", 	RegString!, as_server )
		End If
		If RegistryGet ( ls_registrykey, "DBParm", 		RegString!, as_dbparm ) <> 1 Then
			RegistrySet ( ls_registrykey, "DBParm", 		RegString!, "Database='bd_helpdesk'" )
			RegistryGet ( ls_registrykey, "DBParm", 		RegString!, as_dbparm )
		End If
		If RegistryGet ( ls_registrykey, "Lock", 			RegString!, as_lock ) <> 1 Then
			RegistrySet ( ls_registrykey, "Lock", 			RegString!, "" )
			RegistryGet ( ls_registrykey, "Lock", 			RegString!, as_lock )
		End If
		If RegistryGet ( ls_registrykey, "AutoCommit", 	RegString!, as_autocommit ) <> 1 Then
			RegistrySet ( ls_registrykey, "AutoCommit", 	RegString!, "false" )
			RegistryGet ( ls_registrykey, "AutoCommit", 	RegString!, as_autocommit )
		End If

	Case IS_USE_SCRIPT							/*  Populate Database Connection from Script  */
		as_dbms			= "SNC SQL Native Client(OLE DB)"
		as_database		= ""
		as_userid		= ""
		as_dbpass		= ""
		as_logid			= "dba"
		as_logpass		= "123"
		as_server		= "192.168.100.200"
		as_dbparm		= "Database='bd_helpdesk'"
		as_lock			= ""
		as_autocommit	= "false"

		
	Case Else
		
		Return -1
		
End Choose

Return 1
end function

public function integer of_connectdb ();//*--------------------------------------------------------*/
//*  Make a connection to the database
//*--------------------------------------------------------*/
/*  Actual DB connection */
string lmsj
Connect using SQLCA;

if SQLCA.SQLCODE <> 0 then
	lmsj = 'No se pudo conectar a la base de datos: ' +  SQLCA.SQLErrText + '  ' + string(SQLCA.SQLDBCODE)
	if SQLCA.SQLDBCODE = 999 then lmsj = "Base de datos no encontrada, solicite al con administracion del sistema"
	if SQLCA.SQLDBCODE = -99 then lmsj = "Conexión a la Base de datos no especificada o deshabilitada, solicite configuración con administracion del sistema"
	if SQLCA.SQLDBCODE = 18456 then lmsj = "Usuario o Password no son válidos, verifique si los ingresó correctamente e intente de nuevo. Si el error persiste consulte con administracion del sistema"
	if SQLCA.SQLDBCODE = -104 then lmsj = "Usuario o Password no son válidos para el modulo, verifique si los ingresó correctamente e intente de nuevo. Si el error persiste consulte con administracion del sistema"
	if SQLCA.SQLDBCODE = -105 then lmsj = "Base de datos no está activa, por favor avise a Administracion del Sistema"
	if SQLCA.SQLDBCODE = -1074 then lmsj = "Usuario y Contraseña en blanco,Completar Usuario y Contraseña"
	messagebox('Error de conexion',lmsj)
	
End If

Return SQLCA.SQLCode
end function

public function integer of_disconnectdb ();//*--------------------------------------------------------*/
//*  Disconnect from database
//*--------------------------------------------------------*/
/*  Actual DB disconnection */
Disconnect using SQLCA;

If SQLCA.SQLCode <> 0 Then
	//MessageBox ("No se pudo desconectar", SQLCA.SQLErrText)
End If

Return SQLCA.SQLCode
end function

event constructor;//*--------------------------------------------------------*/
//*  Connection Information is obtained from either:
//*			- An INI File
//*			- The Windows Registry
//*			- Script
//*
//*  The source of connection information can be changed by
//*  altering the value of the 'is_connectfrom' variable.
//*--------------------------------------------------------*/
string ls_dbms, ls_database, ls_userid, ls_dbpass, ls_logid, ls_logpass
string ls_server, ls_dbparm, ls_lock, ls_autocommit

If of_GetConnectionInfo ( ls_dbms, ls_database, ls_userid, ls_dbpass, ls_logid, ls_logpass, ls_server, ls_dbparm, ls_lock, ls_autocommit ) = 1 Then
	
	SQLCA.DBMS			= ls_dbms
	SQLCA.Database		= ls_database
	SQLCA.UserID			= ls_userid
	SQLCA.DBPass			= ls_dbpass
	//SQLCA.LogID			= ls_logid
	//SQLCA.LogPass			= ls_logpass
	SQLCA.ServerName	= ls_server
	SQLCA.DBParm			= ls_dbparm
	SQLCA.Lock				= ls_lock
	Choose Case Lower ( ls_autocommit ) 
		Case "1", "true", "on", "yes"
			SQLCA.AutoCommit	= True
		Case "0", "false", "off", "no"
			SQLCA.AutoCommit	= False
		Case Else
			SQLCA.AutoCommit	= False
	End Choose
	
End If
end event

on n_connectservice.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_connectservice.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

