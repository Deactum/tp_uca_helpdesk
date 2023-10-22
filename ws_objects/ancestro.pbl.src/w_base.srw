$PBExportHeader$w_base.srw
$PBExportComments$ancestro de ventana
forward
global type w_base from window
end type
end forward

global type w_base from window
integer width = 2674
integer height = 1048
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean clientedge = true
boolean center = true
end type
global w_base w_base

on w_base.create
end on

on w_base.destroy
end on

