$PBExportHeader$dw_list.sru
forward
global type dw_list from datawindow
end type
end forward

global type dw_list from datawindow
integer width = 1911
integer height = 1612
string title = "none"
string dataobject = "dw_list_datos3"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type
global dw_list dw_list

event itemchanged;//colorea la fila seleccionada 
IF row > 0 THEN
this.SelectRow(0, FALSE)
this.SelectRow(row, TRUE)
END If

end event

event rowfocuschanged;//colorea la fila selccionada
INTEGER li_row
li_row = this.GetRow()
IF li_row > 0 THEN
SelectRow(this, 0, FALSE)
SelectRow(this, li_row, TRUE)
END IF 

end event

event constructor;this.settransobject(SQLCA)
end event

on dw_list.create
end on

on dw_list.destroy
end on

