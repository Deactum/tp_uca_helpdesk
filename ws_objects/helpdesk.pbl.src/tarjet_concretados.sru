$PBExportHeader$tarjet_concretados.sru
forward
global type tarjet_concretados from uo_tarjet_base
end type
end forward

global type tarjet_concretados from uo_tarjet_base
end type
global tarjet_concretados tarjet_concretados

on tarjet_concretados.create
call super::create
end on

on tarjet_concretados.destroy
call super::destroy
end on

type st_2 from uo_tarjet_base`st_2 within tarjet_concretados
end type

type st_1 from uo_tarjet_base`st_1 within tarjet_concretados
string text = "Concretados"
end type

type p_1 from uo_tarjet_base`p_1 within tarjet_concretados
string picturename = ".\iconos\2x\baseline_task_alt_white_48dp.png"
end type

