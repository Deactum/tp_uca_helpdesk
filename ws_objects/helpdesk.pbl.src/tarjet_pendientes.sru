$PBExportHeader$tarjet_pendientes.sru
forward
global type tarjet_pendientes from uo_tarjet_base
end type
end forward

global type tarjet_pendientes from uo_tarjet_base
end type
global tarjet_pendientes tarjet_pendientes

forward prototypes
public subroutine of_refresh ()
end prototypes

public subroutine of_refresh ();long ll_ret
select count(*)
into :ll_ret
from REPARACIONES_ESTADOS re
where re.ESTADOS_CODIGO in(1,2,3);
this.st_2.text =  string(ll_ret)
end subroutine

on tarjet_pendientes.create
call super::create
end on

on tarjet_pendientes.destroy
call super::destroy
end on

type st_2 from uo_tarjet_base`st_2 within tarjet_pendientes
end type

type st_1 from uo_tarjet_base`st_1 within tarjet_pendientes
string text = "Pendientes"
end type

type p_1 from uo_tarjet_base`p_1 within tarjet_pendientes
string picturename = ".\iconos\2x\baseline_task_white_48dp.png"
end type

