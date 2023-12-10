$PBExportHeader$tarjet_concretados.sru
forward
global type tarjet_concretados from uo_tarjet_base
end type
end forward

global type tarjet_concretados from uo_tarjet_base
end type
global tarjet_concretados tarjet_concretados

forward prototypes
public subroutine of_refresh ()
end prototypes

public subroutine of_refresh ();long ll_ret
select count(*)
into :ll_ret
from (SELECT 
R.REPARACIONES_CODIGO,
C.CLIENTES_NOMBRE +' '+ C.CLIENTES_APELLIDO AS CLIENTE,
EQ.EQUIPOS_DESCRIPCION,
e.ESTADOS_CODIGO,
E.ESTADOS_NOMBRE,
MAX(RE.REPA_ESTA_FECHA) as fecha
FROM REPARACIONES R
JOIN REPARACIONES_ESTADOS RE ON R.REPARACIONES_CODIGO = RE.REPARACIONES_CODIGO
JOIN ESTADOS E ON RE.ESTADOS_CODIGO = E.ESTADOS_CODIGO
JOIN CLIENTES C ON R.CLIENTES_CODIGO = C.CLIENTES_CODIGO
JOIN EQUIPOS EQ ON R.EQUIPOS_CODIGO = EQ.EQUIPOS_CODIGO
WHERE ISNULL(R.REPARACIONES_FIN,'1977-01-01') ='1977-01-01'
AND E.ESTADOS_CODIGO <> 9
GROUP BY 
R.REPARACIONES_CODIGO,
C.CLIENTES_NOMBRE +' '+ C.CLIENTES_APELLIDO,
EQ.EQUIPOS_DESCRIPCION,
e.ESTADOS_CODIGO,
E.ESTADOS_NOMBRE
HAVING MAX(RE.REPA_ESTA_FECHA) = (SELECT MAX(E2.REPA_ESTA_FECHA) FROM REPARACIONES_ESTADOS E2
WHERE E2.REPARACIONES_CODIGO = R.REPARACIONES_CODIGO)
) as temp
where temp.ESTADOS_CODIGO = 8;
this.st_2.text =  string(ll_ret)
end subroutine

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

