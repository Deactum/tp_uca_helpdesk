$PBExportHeader$w_abm_usuarios.srw
forward
global type w_abm_usuarios from w_abm_base
end type
type cb_3 from commandbutton within w_abm_usuarios
end type
type p_imagen from picture within w_abm_usuarios
end type
type cb_imagen from commandbutton within w_abm_usuarios
end type
end forward

global type w_abm_usuarios from w_abm_base
integer width = 2510
integer height = 956
cb_3 cb_3
p_imagen p_imagen
cb_imagen cb_imagen
end type
global w_abm_usuarios w_abm_usuarios

type variables
blob iblob_imagen
string  is_codigo
end variables

forward prototypes
public subroutine wf_setpic ()
end prototypes

public subroutine wf_setpic ();if p_imagen.setpicture(iblob_imagen) <> 1 then
	p_imagen.PictureName = '.\iconos\2x\baseline_person_black_48dp.png'
end if 
end subroutine

on w_abm_usuarios.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.p_imagen=create p_imagen
this.cb_imagen=create cb_imagen
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.p_imagen
this.Control[iCurrent+3]=this.cb_imagen
end on

on w_abm_usuarios.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.p_imagen)
destroy(this.cb_imagen)
end on

event open;// Ancestro anulado
long ll_codigo

is_codigo = message.stringparm
ll_codigo = message.doubleparm

if ll_codigo >0 then 
	dw_datos.retrieve( ll_codigo)
	
elseif len(is_codigo) > 0 then 
	dw_datos.retrieve(is_codigo)
	
	if isNull(is_codigo) or is_codigo = '' then return
	
	selectblob usuarios_foto
	into :iblob_imagen
	from usuarios
	where usuarios_codigo = :is_codigo;
	
	commit using sqlca;
	
	wf_setpic()
		
end if
end event

type cb_cancelar from w_abm_base`cb_cancelar within w_abm_usuarios
integer x = 823
integer y = 704
integer taborder = 10
end type

type cb_aceptar from w_abm_base`cb_aceptar within w_abm_usuarios
integer x = 1221
integer y = 704
integer taborder = 30
end type

event cb_aceptar::clicked;// Ancestro anulado
if f_validacion(dw_datos) = 1 then return 
if f_grabar(dw_datos) >0 then 
	
	is_codigo = dw_datos.GetItemString(1, 'usuarios_codigo')
	
	if isNull(is_codigo) or is_codigo = '' then return

	updateblob usuarios
	set usuarios_foto = :iblob_imagen
	where usuarios_codigo = :is_codigo;
			
	commit using sqlca;
	
	close(parent)
end if


end event

type dw_datos from w_abm_base`dw_datos within w_abm_usuarios
integer y = 40
integer width = 1646
integer height = 632
integer taborder = 20
string dataobject = "dw_abm_usuarios"
end type

event dw_datos::clicked;call super::clicked;string ls_pathname, ls_filename
integer i_getfileopenname, i_fileopen
string ls_defaulttext = 'bmp'
string ls_filtro = 'Archivo JPEG(*.jpeg),*.jpeg, Archivos GIFs(*.gif), *.gif, Mapa de Bits(*.bmp), *.bmp, todos, *.*'

string ls_setting

choose case dwo.name 
		
	case 'p_pass'
		
		ls_setting = this.describe("usuarios_contrasena.Edit.Password")
		
		if ls_setting = "yes" then
			this.modify("usuarios_contrasena.Edit.Password=No")
		else 
			this.modify("usuarios_contrasena.Edit.Password=Yes")
		end if 
	
		
		// -------------------------------- Manejo de imagen -------------------------------- //
	case 'b_subir'
		
			i_getfileopenname = getfileopenname('abrir mapa de bits', ls_pathname, ls_filename,ls_defaulttext,ls_filtro)
		
		if i_getfileopenname = 1 then
			i_fileopen = fileopen(ls_pathname,streammode!)
			if i_fileopen <> -1 then
				filereadex(i_fileopen, iblob_imagen)
				if IsNull(iblob_imagen) then messagebox('Advertencia', 'Blob nulo')
				dw_datos.object.p_imagen.setpicture(iblob_imagen)
				fileclose(i_fileopen)
			else 
				messagebox('error', 'error al leer el fichero', Stopsign!)
			end if
		else 
			if i_getfileopenname = -1 then
				messagebox('error', 'getfileopenname=-1', Stopsign!)
			end if
		end if 

end choose
end event

type cb_3 from commandbutton within w_abm_usuarios
integer x = 32
integer y = 704
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

type p_imagen from picture within w_abm_usuarios
integer x = 1673
integer y = 40
integer width = 768
integer height = 644
boolean bringtotop = true
string picturename = ".\iconos\2x\baseline_person_black_48dp.png"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_imagen from commandbutton within w_abm_usuarios
integer x = 1746
integer y = 704
integer width = 626
integer height = 112
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Subir imagen"
end type

event clicked;ContextKeyword lcx_key
string ls_values[]
string ls_pathname, ls_filename, ls_desktop
integer i_getfileopenname, i_fileopen
string ls_defaulttext = 'bmp'
string ls_filtro = 'Archivo JPEG(*.jpeg),*.jpeg, Archivos GIFs(*.gif), *.gif, Mapa de Bits(*.bmp), *.bmp, Todos, *.*'

// obtiene el path del escritorio
GetContextService ('Keyword', lcx_key)
lcx_key.GetContextKeywords ('USERPROFILE', ls_values)
ls_desktop = ls_values[1] + '\Desktop'

ChangeDirectory(ls_desktop)

i_getfileopenname = getfileopenname('abrir mapa de bits', ls_pathname, ls_filename,ls_defaulttext,ls_filtro)

if i_getfileopenname = 1 then
	i_fileopen = fileopen(ls_pathname,streammode!)
	if i_fileopen <> -1 then
		filereadex(i_fileopen, iblob_imagen)
		if IsNull(iblob_imagen) then messagebox('Advertencia', 'Blob nulo')
		wf_setpic()
		fileclose(i_fileopen)
	else 
		messagebox('error', 'error al leer el fichero', Stopsign!)
	end if
else 
	if i_getfileopenname = -1 then
		messagebox('error', 'getfileopenname=-1', Stopsign!)
	end if
end if 
ChangeDirectory ( _path )

end event

