$PBExportHeader$tarjet_trabajando.sru
forward
global type tarjet_trabajando from uo_tarjet_base
end type
end forward

global type tarjet_trabajando from uo_tarjet_base
end type
global tarjet_trabajando tarjet_trabajando

forward prototypes
public subroutine of_refresh ()
end prototypes

public subroutine of_refresh ();long ll_ret

select count(*)
into :ll_ret
from REPARACIONES_ESTADOS re
where re.ESTADOS_CODIGO in(4,6);
st_2.text = string(ll_ret)
end subroutine

on tarjet_trabajando.create
call super::create
end on

on tarjet_trabajando.destroy
call super::destroy
end on

type st_2 from uo_tarjet_base`st_2 within tarjet_trabajando
end type

type st_1 from uo_tarjet_base`st_1 within tarjet_trabajando
string text = "Trabajando"
end type

type p_1 from uo_tarjet_base`p_1 within tarjet_trabajando
string picturename = ".\iconos\2x\baseline_construction_white_48dp.png"
end type

