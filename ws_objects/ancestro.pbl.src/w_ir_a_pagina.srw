$PBExportHeader$w_ir_a_pagina.srw
forward
global type w_ir_a_pagina from window
end type
type ddlb_1 from dropdownlistbox within w_ir_a_pagina
end type
type cb_1 from commandbutton within w_ir_a_pagina
end type
end forward

global type w_ir_a_pagina from window
integer width = 1093
integer height = 632
boolean titlebar = true
string title = "Ir a la pagina"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
ddlb_1 ddlb_1
cb_1 cb_1
end type
global w_ir_a_pagina w_ir_a_pagina

on w_ir_a_pagina.create
this.ddlb_1=create ddlb_1
this.cb_1=create cb_1
this.Control[]={this.ddlb_1,&
this.cb_1}
end on

on w_ir_a_pagina.destroy
destroy(this.ddlb_1)
destroy(this.cb_1)
end on

event open;long  ll_i
double ll_ret
ll_ret = message.doubleparm
ll_ret += 1

for ll_i = 1 to ll_ret
	ddlb_1.additem(string(ll_i))
next 

ddlb_1.selectitem(1)
end event

type ddlb_1 from dropdownlistbox within w_ir_a_pagina
integer x = 283
integer y = 168
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean autohscroll = true
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_ir_a_pagina
integer x = 320
integer y = 316
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Aceptar"
end type

event clicked;double ll_ret
ll_ret = double(ddlb_1.text)
closewithreturn(parent,ll_ret)
end event

