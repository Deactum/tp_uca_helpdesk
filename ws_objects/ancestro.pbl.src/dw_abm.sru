$PBExportHeader$dw_abm.sru
forward
global type dw_abm from datawindow
end type
end forward

global type dw_abm from datawindow
integer width = 2190
integer height = 588
string title = "none"
string dataobject = "dw_ejemplo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type
global dw_abm dw_abm

event constructor;this.settransobject(sqlca)
this.insertrow(0)
end event

on dw_abm.create
end on

on dw_abm.destroy
end on

