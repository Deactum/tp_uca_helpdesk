$PBExportHeader$p_toggle_button.sru
forward
global type p_toggle_button from picture
end type
end forward

global type p_toggle_button from picture
integer width = 329
integer height = 288
integer transparency = 50
boolean originalsize = true
string picturename = ".\iconos\2x\baseline_toggle_on_black_36dp.png"
boolean focusrectangle = false
end type
global p_toggle_button p_toggle_button

type variables
// 0 apagado, 1 prendido
long il_flag = 0
end variables

on p_toggle_button.create
end on

on p_toggle_button.destroy
end on

event clicked;if il_flag = 0 then
	il_flag =1
	this.picturename = '.\iconos\2x\baseline_toggle_on_black_36dp.png'
else 
	il_flag = 0
	this.picturename = '.\iconos\2x\baseline_toggle_off_black_36dp.png'
end if
end event

