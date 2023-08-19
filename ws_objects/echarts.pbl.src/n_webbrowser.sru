$PBExportHeader$n_webbrowser.sru
forward
global type n_webbrowser from webbrowser
end type
end forward

global type n_webbrowser from webbrowser
integer width = 2011
integer height = 952
string defaulturl = "file:///echarts.html"
boolean contextmenu = false
boolean border = false
event ue_preview ( )
event ue_clicked ( string as_arg )
end type
global n_webbrowser n_webbrowser

type variables
Private:
String is_FileName = "echarts.html"
//Theme:default,light,dark
String is_Theme = "default"
//Style:line,bar,pei,scatter,radar,funnel...
String is_Option = ""
boolean ib_flag = false
String is_SeriesName = "Series1"
//roseType:radius,area
String is_roseType
String is_colors
datastore ids_dato , ids_serie, ids_arg
string  is_datawindow  //,is_titulo

public:
String is_style = "bar"
String is_Title = "Default title"
Boolean ib_ToolBox = True
boolean ib_legend = true
Boolean ib_dataZoom
boolean ib_preview = true
boolean ib_auto_sort = true
boolean ib_sort_asc = true
Long il_Width =300    
Long il_Height =300   


end variables

forward prototypes
public subroutine of_replace (ref string as_string, string as_str1, string as_str2)
public subroutine of_setoption (string as_option)
public function integer of_apply ()
public function integer of_inithtml (string as_filename)
public subroutine of_setcolors (string as_arg)
public subroutine of_setdatazoom (boolean ab_arg)
public subroutine of_setfilename (string as_arg)
public subroutine of_setheight (long al_arg)
public subroutine of_setrosetype (string as_arg)
public subroutine of_setseriesname (string as_arg)
public subroutine of_setstyle (string as_arg)
public subroutine of_settheme (string as_arg)
public subroutine of_settitle (string as_arg)
public subroutine of_settoolbox (boolean ab_arg)
public subroutine of_setwidth (long al_arg)
public function string of_barra ()
public function boolean of_getdatazoom ()
public function long of_getheight ()
public function string of_gettitle ()
public function string of_gettheme ()
public function string of_getstyle ()
public function long of_getwidth ()
public function boolean of_gettoolbox ()
public function string of_getitemstring (ref datawindow adw_1, integer ai_row, integer ai_column)
public function string of_getitemstring (ref datastore ads_1, integer ai_row, integer ai_column)
public function string of_getitemstring (ref datastore ads_1, integer ai_row, string as_column)
public function string of_getitemstring (ref datawindow adw_1, integer ai_row, string as_column)
public subroutine of_setdatawindowsname (string as_datawindow)
public function string of_createoption ()
public subroutine of_applysinc ()
public subroutine of_setdatastore (datastore ads_dato)
public subroutine of_init (datawindow adw_arg)
public function string of_line ()
public function string of_area ()
public function string of_pie ()
public function string of_getrosetype ()
public subroutine of_setlegend (boolean ab_arg)
public function boolean of_getlegend ()
public subroutine of_init (datastore ads_arg)
public function string of_scatter ()
public function string of_horizontalbar ()
public function string of_gauge ()
public subroutine of_selecrow (ref datawindow adw_arg, string as_arg)
end prototypes

event ue_preview();String ls_SeriesName, ls_SeriesName2, ls_Category
Long ll_Row, ll_Row2, ll_j, ll_col, ll_find


ids_dato.dataObject = 'dw_list_datos'

ll_col = long(ids_dato.object.datawindow.column.count)
ll_row = ids_dato.rowcount( )


if ll_col > 2 then
	for ll_j = 1 to ll_row
		ls_seriesName = ids_dato.getItemString(ll_j,1)
		ll_find = ids_serie.find( "series = '"+ls_seriesName+"'",1,ids_serie.rowcount( ) )
		if ll_find = 0 then
			ll_row2 = ids_serie.insertrow(0)
			ids_serie.setItem(ll_row2,1,ls_seriesName)
		end if
	next
end if

ib_flag = true
end event

event ue_clicked(string as_arg);/*
*ejemplo para seleccionar el dato en la dw cuando se hace click 
*
*/

//of_selecrow(datawindow, as_arg)
end event

public subroutine of_replace (ref string as_string, string as_str1, string as_str2);Long 	start_pos

If as_str1 = as_str2 Then Return

start_pos = Pos(as_string, as_str1)
DO WHILE start_pos > 0		
	 as_string = Replace(as_string, start_pos, Len(as_str1), as_str2)
	start_pos = Pos(as_string, as_str1, start_pos + Len(as_str2))						
LOOP
end subroutine

public subroutine of_setoption (string as_option);//SetOption
String ls_Option
ls_Option = as_option
//Replace "
This.of_replace(ls_Option,'"',"")
this.is_Option = ls_Option

end subroutine

public function integer of_apply ();//Apply
String ls_Url, ls_Html, ls_Option, ls_Shares, ls_JS, ls_FileName
Long 	ll_FileOpen
Integer li_return

//Option
ls_Option = is_Option
If Len(ls_Option) <=0 Then
	MessageBox ("Error", "Option is Null!")
	Return -1
End If

//Replace "
This.of_replace(ls_Option,'"',"")

//File
ls_FileName = is_FileName
//This.SetReDraw( False )
If Not FileExists(ls_FileName) Then
	//HTML
	This.of_initHTML(ls_FileName)
	MessageBox ( "Error", "File:" + ls_FileName + " not found! ~r~nplease try again." )
	Return 0
Else
	String ls_Result, ls_Error
	//JavaScript EvaluateJavaScriptSync
	//1.width height
	ls_JS = "document.getElementById('main').style.width = '" + String( il_Width ) + "px'"
	This.EvaluateJavaScriptSync( ls_JS)
	ls_JS = "document.getElementById('main').style.height = '" + String( il_Height ) + "px'"
	This.EvaluateJavaScriptSync( ls_JS)
	//2.myChart.dispose()
	ls_JS = "if(!myChart.isDisposed()){myChart.dispose();}"
	This.EvaluateJavaScriptSync( ls_JS )
	//3.echarts.ini()
	ls_JS = "myChart = echarts.init(document.getElementById('main'),'"+is_Theme+"');"
	This.EvaluateJavaScriptSync( ls_JS )
	//4.option=ls_option
	ls_JS = "option=" + ls_Option
	li_return = This.EvaluateJavaScriptSync( ls_JS, ls_Result, ls_Error)
	If li_Return <> 1 Then
		MessageBox ( "EvaluateJavaScriptSync Error", ls_Error + "~r~nJavaScript:" + ls_JS )
		Return -1
	End If
	//5.myChart.setOption(option)
	ls_JS = "myChart.setOption(option)"
	This.EvaluateJavaScriptSync( ls_JS )
	//6. myChart.on('click')
	ls_JS = "myChart.on('click',function(params){window.webBrowser.ue_clicked('{~"seriesName~":~"' + params.seriesName + '~",~"name~":~"' + params.name + '~",~"value~":~"' + params.value + '~"}');});~r~n"
	This.EvaluateJavaScriptSync( ls_JS )
	//7.Resize
	ls_JS = "resizeCanvas()"
	This.EvaluateJavaScriptSync( ls_JS )

End If
//This.SetReDraw( True )
This.RegisterEvent("ue_clicked")
Return 1
end function

public function integer of_inithtml (string as_filename);String ls_FileName, ls_HTML
Long 	ll_FileOpen

ls_FileName = as_filename

If Not FileExists(ls_FileName) Then
	//HTML
	ls_Html = "<!DOCTYPE html>~r~n" +&
		"<html>~r~n" +&
		"<head>~r~n" +&
		"    <title>ECharts</title>~r~n" +&
		"    <meta charset=~"UTF-8~">~r~n" +&
		"    <script src=~"http://20.10.67.115/echart/echarts/dist/echarts.min.js~"></script>~r~n" +&
		"</head>~r~n" +&
		"<body>~r~n" +&
		"    <div id=~"main~" style=~"width: 100px;height:100px;~"></div>~r~n" +&
		"    <script type=~"text/javascript~">~r~n" +&
		"	var canvase = document.getElementById(~'main~')~r~n" +&
		"		function resizeCanvas(){~r~n" +&
		"			w=canvase.width=window.innerWidth-20;~r~n" +&
		"			h=canvase.height=window.innerHeight-20;~r~n" +&
		"			myChart.resize({width:w,height:h})~r~n" +&
		"		}~r~n" +&
		"	window.addEventListener(~"resize~",resizeCanvas,false);~r~n" +&
		"    var myChart = echarts.init(document.getElementById(~'main~'));~r~n" +&
		"    </script>~r~n" +&
		" </body>~r~n" +&
		" </html>~r~n"
	//Create File
	ll_FileOpen = FileOpen(ls_FileName,TextMode!,Write!,Shared!,Replace!,EncodingUTF8!)
	FileWriteEx(ll_FileOpen,ls_Html)
	FileClose(ll_FileOpen)
End If

Return 1
end function

public subroutine of_setcolors (string as_arg);this.is_Colors = as_arg
end subroutine

public subroutine of_setdatazoom (boolean ab_arg);//SetToolBox
this.ib_dataZoom = ab_arg
end subroutine

public subroutine of_setfilename (string as_arg);//SetFileName
this.is_FileName = as_arg
//Navigate
This.Navigate("file:///" + is_FileName )
//this.navigate("http://20.10.67.115/echart/")
end subroutine

public subroutine of_setheight (long al_arg);//SetHeight
this.il_Height = al_arg
end subroutine

public subroutine of_setrosetype (string as_arg);//RoseType
this.is_roseType = as_arg
end subroutine

public subroutine of_setseriesname (string as_arg);//SeriesName
this.is_SeriesName = as_arg
end subroutine

public subroutine of_setstyle (string as_arg);//SetStyle
this.is_Style = as_arg
end subroutine

public subroutine of_settheme (string as_arg);//Set Theme
this.is_Theme = as_arg
end subroutine

public subroutine of_settitle (string as_arg);//SetTitle
this.is_Title = as_arg
end subroutine

public subroutine of_settoolbox (boolean ab_arg);//SetToolBox
this.ib_ToolBox = ab_arg
end subroutine

public subroutine of_setwidth (long al_arg);//SetWidth
this.il_Width = al_arg
end subroutine

public function string of_barra ();String ls_Option, ls_SeriesName, ls_cadena
Long 	ll_RowCount, ll_RootObject,ll_ChildObject,  ll_ChildObject1,ll_ChildObject3, ll_ChildArray, ll_ChildArray1, ll_ChildArray3, ll_i, ll_childobject2, ll_childarray2, ll_j
JsonGenerator ljson_Option

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

ll_RowCount = ids_dato.RowCount()

if ib_auto_sort then
	if ib_sort_asc then 
		ids_dato.setsort('#1 a ,#2 a')
	else
		ids_dato.setsort('#1 d ,#2 d')
	end if
end if


//title
ll_childobject = ljson_option.additemobject( ll_rootobject,"title")
		ljson_option.additemstring( ll_childobject,"text","'"+of_gettitle()+"'")
//legend
if of_getlegend() then
	ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
end if
//grid
ll_ChildObject= ljson_option.additemObject(ll_rootobject,"grid")
	ljson_option.additemstring(ll_childObject,"left","'3%'")
	ljson_option.additemstring(ll_childobject,"right","'4%'")
	ljson_option.additemstring(ll_childobject,"bottom","'3%'")
	ljson_option.additemboolean(ll_childobject,"containLabel",true)


//tooltip
ll_childobject = ljson_option.additemobject( ll_rootobject,"tooltip")
	ljson_option.additemstring( ll_childobject,'trigger', "'axis'")
	ll_childobject1 = ljson_option.additemobject( ll_childobject,"axisPointer")
		ljson_option.additemstring( ll_childobject1,"type","'shadow'")
//toolbox
If of_GetToolBox() Then
	ll_ChildObject1 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
	ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildObject1, "feature")
	ll_childobject3 =ljson_Option.AddItemObject(ll_ChildObject2, "saveAsImage")
		ljson_option.additemstring( ll_childobject3,"title","'Guardar como imagen'")
	ll_childobject3 =ljson_Option.AddItemObject(ll_ChildObject2, "dataView")
		ljson_option.additemstring( ll_childobject3,"title","'Ver datos'")
		 ll_ChildArray = ljson_option.additemarray(ll_childobject3,"lang")
		 ljson_option.additemstring( ll_childarray,"'Ver datos'")
		 ljson_option.additemstring( ll_childarray,"'Cerrar'")
		 ljson_option.additemstring( ll_childarray,"'Actualizar'")
	ll_childobject3 =ljson_option.additemobject( ll_childobject2,"restore")
		ljson_option.additemstring( ll_childobject3,"title", "'Restaurar'")
End If
//dataZoom
IF This.of_GetDataZoom() THEN
	ll_childobject = ljson_option.additemarray( ll_rootobject,"dataZoom")
		ll_childobject2 = ljson_option.additemobject(ll_childobject)
			ljson_option.additemstring( ll_childobject2,"type","'inside'")
			ljson_option.additemnumber(ll_childobject2,"start",0)
			ljson_option.additemnumber( ll_childobject2,"end",100)
		ll_childobject2 = ljson_option.additemobject(ll_childobject)
			ljson_option.additemnumber( ll_childobject,"start",0)
			ljson_option.additemnumber( ll_childobject,"end",100)	
END IF

//xaxis
	ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "xAxis")
	ljson_Option.AddItemString(ll_ChildObject, "type","'category'")
	ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
	ls_SeriesName = ids_Serie.GetItemString(1, 1)
	ids_dato.SetFilter("#1='"+ls_SeriesName +"'")
	ids_dato.Filter()
	ids_dato.Sort()
	FOR ll_i = 1 TO ids_dato.RowCount()
		ljson_Option.AddItemString(ll_ChildArray, "'" +of_GetItemString(ids_dato,ll_i, 2) + "'")
	NEXT
//yaxis
ll_childobject = ljson_option.additemobject( ll_rootobject,"yAxis")
ljson_option.additemstring( ll_childobject,"type", "'value'")
	ll_childobject2= ljson_option.additemarray(ll_childobject,"boundaryGap")
	ljson_option.additemnumber( ll_childobject2,0)
	ljson_option.additemnumber( ll_childobject2,0.01)
	
//series
ll_childarray = ljson_option.additemarray(ll_rootobject,"series")
FOR ll_i = 1 TO ids_Serie.RowCount()
		ls_SeriesName = ids_Serie.GetItemString(ll_i,1)
		ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
		ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")
		ljson_Option.AddItemString(ll_ChildObject2, "type","'bar'")
		ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
		ids_dato.SetFilter("#1='"+ls_SeriesName +"'")
		ids_dato.Filter()
		ids_dato.Sort()
		FOR ll_j = 1 TO ids_dato.RowCount()
			ljson_Option.AddItemNumber(ll_ChildArray2, ids_dato.GetItemNumber(ll_j, 3 ))
		NEXT
NEXT

ls_option = ljson_option.getjsonstring( )
if isvalid (ljson_option ) then destroy (ljson_option)



return ls_option
end function

public function boolean of_getdatazoom ();//GetToolBox
Return this.ib_dataZoom
end function

public function long of_getheight ();//GetHeight
Return this.il_Height
end function

public function string of_gettitle ();//GetTitle
of_replace(this.is_Title,"'","^")
Return this.is_Title
end function

public function string of_gettheme ();//GetTheme
Return this.is_Theme
end function

public function string of_getstyle ();//GetStyle
Return this.is_Style
end function

public function long of_getwidth ();//GetWidth
Return this.il_Width
end function

public function boolean of_gettoolbox ();//GetToolBox
Return this.ib_ToolBox
end function

public function string of_getitemstring (ref datawindow adw_1, integer ai_row, integer ai_column);
If adw_1.RowCount() <= 0 Then Return ""
If adw_1.RowCount() < ai_row Then Return ""

String ls_String, ls_Type
ls_Type = adw_1.Describe("#" + String(ai_column) +".ColType")
Choose Case Upper(Left(ls_Type,3))
	Case "DAT"
		If Upper(ls_Type) = "DATE" Then
			ls_String = String(adw_1.GetItemDate(ai_row,ai_column))
		Else
			ls_String = String(adw_1.GetItemDateTime(ai_row,ai_column))
		End If
	Case "TIM"
		ls_String = String(adw_1.GetItemTime(ai_row,ai_column))
	Case "STR","CHA","VAR"
		ls_String = String(adw_1.GetItemString(ai_row,ai_column))
	Case "DEC"
		ls_String = String(adw_1.GetItemDecimal(ai_row,ai_column))
	Case "NUM","INT","LON","REA"
		ls_String = String(adw_1.GetItemNumber(ai_row,ai_column))
	Case "!","?"
		Return ""
	Case Else
		MessageBox ( "Tip", ls_Type + " is Not Match." ) 
End Choose

If IsNull ( ls_String) Then ls_String = "Null"

Return ls_String


end function

public function string of_getitemstring (ref datastore ads_1, integer ai_row, integer ai_column);
If ads_1.RowCount() <= 0 Then Return ""
If ads_1.RowCount() < ai_row Then Return ""

String ls_String, ls_Type
ls_Type = ads_1.Describe("#" + String(ai_column) +".ColType")
Choose Case Upper(Left(ls_Type,3))
	Case "DAT"
		If Upper(ls_Type) = "DATE" Then
			ls_String = String(ads_1.GetItemDate(ai_row,ai_column))
		Else
			ls_String = String(ads_1.GetItemDateTime(ai_row,ai_column))
		End If
	Case "TIM"
		ls_String = String(ads_1.GetItemTime(ai_row,ai_column))
	Case "STR","CHA","VAR"
		ls_String = String(ads_1.GetItemString(ai_row,ai_column))
	Case "DEC"
		ls_String = String(ads_1.GetItemDecimal(ai_row,ai_column))
	Case "NUM","INT","LON","REA"
		ls_String = String(ads_1.GetItemNumber(ai_row,ai_column))
	Case "!","?"
		Return ""
	Case Else
		MessageBox ( "Tip", ls_Type + " is Not Match." ) 
End Choose

If IsNull ( ls_String) Then ls_String = "Null"

Return ls_String


end function

public function string of_getitemstring (ref datastore ads_1, integer ai_row, string as_column);
If ads_1.RowCount() <= 0 Then Return ""
If ads_1.RowCount() < ai_row Then Return ""

String ls_String, ls_Type
ls_Type = ads_1.Describe( as_column +".ColType")
Choose Case Upper(Left(ls_Type,3))
	Case "DAT"
		If Upper(ls_Type) = "DATE" Then
			ls_String = String(ads_1.GetItemDate(ai_row,as_column))
		Else
			ls_String = String(ads_1.GetItemDateTime(ai_row,as_column))
		End If
	Case "TIM"
		ls_String = String(ads_1.GetItemTime(ai_row,as_column))
	Case "STR","CHA","VAR"
		ls_String = String(ads_1.GetItemString(ai_row,as_column))
	Case "DEC"
		ls_String = String(ads_1.GetItemDecimal(ai_row,as_column))
	Case "NUM","INT","LON","REA"
		ls_String = String(ads_1.GetItemNumber(ai_row,as_column))
	Case "!","?"
		Return ""
	Case Else
		MessageBox ( "Tip", ls_Type + " is Not Match." ) 
End Choose

If IsNull ( ls_String) Then ls_String = "Null"

Return ls_String


end function

public function string of_getitemstring (ref datawindow adw_1, integer ai_row, string as_column);
If adw_1.RowCount() <= 0 Then Return ""
If adw_1.RowCount() < ai_row Then Return ""

String ls_String, ls_Type
ls_Type = adw_1.Describe(as_column +".ColType")
Choose Case Upper(Left(ls_Type,3))
	Case "DAT"
		If Upper(ls_Type) = "DATE" Then
			ls_String = String(adw_1.GetItemDate(ai_row,as_column))
		Else
			ls_String = String(adw_1.GetItemDateTime(ai_row,as_column))
		End If
	Case "TIM"
		ls_String = String(adw_1.GetItemTime(ai_row,as_column))
	Case "STR","CHA","VAR"
		ls_String = String(adw_1.GetItemString(ai_row,as_column))
	Case "DEC"
		ls_String = String(adw_1.GetItemDecimal(ai_row,as_column))
	Case "NUM","INT","LON","REA"
		ls_String = String(adw_1.GetItemNumber(ai_row,as_column))
	Case "!","?"
		Return ""
	Case Else
		MessageBox ( "Tip", ls_Type + " is Not Match." ) 
End Choose

If IsNull ( ls_String) Then ls_String = "Null"

Return ls_String


end function

public subroutine of_setdatawindowsname (string as_datawindow);is_datawindow = as_datawindow 
end subroutine

public function string of_createoption ();string ls_option
choose case is_style
	case 'bar'
	 	ls_option = of_barra()
	case 'line'
		ls_option = of_line()
	case 'area'
		ls_option = of_area()
	case 'pie'
		ls_option = of_pie()
	case 'scatter'
		ls_option = of_scatter()
	case 'horizontalbar'
		ls_option = of_horizontalbar()
	case 'gauge'
		ls_option = of_gauge()
end choose
return ls_option

end function

public subroutine of_applysinc ();string ls_option
ls_option = of_createoption()
of_setoption(ls_option)
of_apply()
end subroutine

public subroutine of_setdatastore (datastore ads_dato);ids_dato = ads_dato
//ids_serie = ads_serie
end subroutine

public subroutine of_init (datawindow adw_arg);String ls_SeriesName, ls_SeriesName2, ls_Category
Long ll_Row, ll_Row2, ll_j, ll_col, ll_find
//datastore ids_arg
//ids_arg = create datastore
ids_arg.dataobject = adw_arg.dataobject
adw_arg.sharedata(ids_arg)

ll_col = long(ids_arg.object.datawindow.column.count)
ll_row = ids_arg.rowcount( )
ids_serie.reset( )
if ll_col > 2 then
	ids_dato = ids_arg
	for ll_j = 1 to ll_row
		ls_seriesName = ids_dato.getItemString(ll_j,1)
		ll_find = ids_serie.find( "series = '"+ls_seriesName+"'",1,ids_serie.rowcount( ) )
		if ll_find = 0 then
			ll_row2 = ids_serie.insertrow(0)
			ids_serie.setItem(ll_row2,1,ls_seriesName)
		end if
	next
else
	ids_dato.dataobject = 'dw_list_datos'
	ids_dato.reset()
	ll_row2 = ids_serie.insertrow(0)
	ids_serie.setitem( ll_row2,1,'serie1')
	for ll_j = 1 to ll_row
		//ll_row2 = ids_serie.insertrow(0)
		//ids_serie.setitem( ll_row2,1,'serie1')
		ll_row2= ids_dato.insertrow(0)
		ids_dato.setitem(ll_row2,1,'serie1')
		ids_dato.setitem(ll_row2,2,ids_arg.getitemstring(ll_j,1))
		ids_dato.setitem(ll_row2,3,ids_arg.getitemnumber(ll_j,2))
	next
end if


ib_flag = true
this.refresh( )

end subroutine

public function string of_line ();String ls_Option, ls_SeriesName, ls_cadena
Long 	ll_RowCount, ll_RootObject,ll_ChildObject,  ll_ChildObject1,ll_ChildObject3, ll_ChildArray, ll_ChildArray1, ll_ChildArray3, ll_i, ll_childobject2, ll_childarray2, ll_j
JsonGenerator ljson_Option

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

ll_RowCount = ids_dato.RowCount()

if ib_auto_sort then
	if ib_sort_asc then 
		ids_dato.setsort('#1 a ,#2 a')
	else
		ids_dato.setsort('#1 d ,#2 d')
	end if
end if


//title
ll_childobject = ljson_option.additemobject( ll_rootobject,"title")
		ljson_option.additemstring( ll_childobject,"text","'"+of_gettitle()+"'")
//legend
if of_getlegend() then
	ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
end if
//grid
ll_ChildObject= ljson_option.additemObject(ll_rootobject,"grid")
	ljson_option.additemstring(ll_childObject,"left","'3%'")
	ljson_option.additemstring(ll_childobject,"right","'4%'")
	ljson_option.additemstring(ll_childobject,"bottom","'3%'")
	ljson_option.additemboolean(ll_childobject,"containLabel",true)


//tooltip
ll_childobject = ljson_option.additemobject( ll_rootobject,"tooltip")
	ljson_option.additemstring( ll_childobject,'trigger', "'axis'")
	ll_childobject1 = ljson_option.additemobject( ll_childobject,"axisPointer")
		ljson_option.additemstring( ll_childobject1,"type","'shadow'")
//toolbox
If of_GetToolBox() Then
	ll_ChildObject1 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
	ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildObject1, "feature")
	ll_childobject3 =ljson_Option.AddItemObject(ll_ChildObject2, "saveAsImage")
		ljson_option.additemstring( ll_childobject3,"title","'Guardar como imagen'")
	ll_childobject3 =ljson_Option.AddItemObject(ll_ChildObject2, "dataView")
		ljson_option.additemstring( ll_childobject3,"title","'Ver datos'")
		 ll_ChildArray = ljson_option.additemarray(ll_childobject3,"lang")
		 ljson_option.additemstring( ll_childarray,"'Ver datos'")
		 ljson_option.additemstring( ll_childarray,"'Cerrar'")
		 ljson_option.additemstring( ll_childarray,"'Actualizar'")
	ll_childobject3 =ljson_option.additemobject( ll_childobject2,"restore")
		ljson_option.additemstring( ll_childobject3,"title", "'Restaurar'")
End If
//dataZoom
IF This.of_GetDataZoom() THEN
	ll_childobject = ljson_option.additemarray( ll_rootobject,"dataZoom")
		ll_childobject2 = ljson_option.additemobject(ll_childobject)
			ljson_option.additemstring( ll_childobject2,"type","'inside'")
			ljson_option.additemnumber(ll_childobject2,"start",0)
			ljson_option.additemnumber( ll_childobject2,"end",100)
		ll_childobject2 = ljson_option.additemobject(ll_childobject)
			ljson_option.additemnumber( ll_childobject,"start",0)
			ljson_option.additemnumber( ll_childobject,"end",100)	
END IF

//xaxis
	ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "xAxis")
	ljson_Option.AddItemString(ll_ChildObject, "type","'category'")
	ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
	ls_SeriesName = ids_Serie.GetItemString(1, 1)
	ids_dato.SetFilter("#1='"+ls_SeriesName +"'")
	ids_dato.Filter()
	ids_dato.Sort()
	FOR ll_i = 1 TO ids_dato.RowCount()
		ljson_Option.AddItemString(ll_ChildArray, "'" +of_GetItemString(ids_dato,ll_i, 2) + "'")
	NEXT
//yaxis
ll_childobject = ljson_option.additemobject( ll_rootobject,"yAxis")
ljson_option.additemstring( ll_childobject,"type", "'value'")
	ll_childobject2= ljson_option.additemarray(ll_childobject,"boundaryGap")
	ljson_option.additemnumber( ll_childobject2,0)
	ljson_option.additemnumber( ll_childobject2,0.01)
	
//series
ll_childarray = ljson_option.additemarray(ll_rootobject,"series")
FOR ll_i = 1 TO ids_Serie.RowCount()
		ls_SeriesName = ids_Serie.GetItemString(ll_i,1)
		ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
		ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")
		ljson_Option.AddItemString(ll_ChildObject2, "type","'line'")
		ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
		ids_dato.SetFilter("#1='"+ls_SeriesName +"'")
		ids_dato.Filter()
		ids_dato.Sort()
		FOR ll_j = 1 TO ids_dato.RowCount()
			ljson_Option.AddItemNumber(ll_ChildArray2, ids_dato.GetItemNumber(ll_j, 3 ))
		NEXT
NEXT

ls_option = ljson_option.getjsonstring( )
if isvalid (ljson_option ) then destroy (ljson_option)



return ls_option
end function

public function string of_area ();String ls_Option, ls_SeriesName, ls_cadena
Long 	ll_RowCount, ll_RootObject,ll_ChildObject,  ll_ChildObject1,ll_ChildObject3, ll_ChildArray, ll_ChildArray1, ll_ChildArray3, ll_i, ll_childobject2, ll_childarray2, ll_j
JsonGenerator ljson_Option

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

ll_RowCount = ids_dato.RowCount()

if ib_auto_sort then
	if ib_sort_asc then 
		ids_dato.setsort('#1 a ,#2 a')
	else
		ids_dato.setsort('#1 d ,#2 d')
	end if
end if

//title
ll_childobject = ljson_option.additemobject( ll_rootobject,"title")
		ljson_option.additemstring( ll_childobject,"text","'"+of_gettitle()+"'")
//legend
if of_getlegend() then
	ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
end if
//grid
ll_ChildObject= ljson_option.additemObject(ll_rootobject,"grid")
	ljson_option.additemstring(ll_childObject,"left","'3%'")
	ljson_option.additemstring(ll_childobject,"right","'4%'")
	ljson_option.additemstring(ll_childobject,"bottom","'3%'")
	ljson_option.additemboolean(ll_childobject,"containLabel",true)


//tooltip
ll_childobject = ljson_option.additemobject( ll_rootobject,"tooltip")
	ljson_option.additemstring( ll_childobject,'trigger', "'axis'")
	ll_childobject1 = ljson_option.additemobject( ll_childobject,"axisPointer")
		ljson_option.additemstring( ll_childobject1,"type","'shadow'")
//toolbox
If of_GetToolBox() Then
	ll_ChildObject1 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
	ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildObject1, "feature")
	ll_childobject3 =ljson_Option.AddItemObject(ll_ChildObject2, "saveAsImage")
		ljson_option.additemstring( ll_childobject3,"title","'Guardar como imagen'")
	ll_childobject3 =ljson_Option.AddItemObject(ll_ChildObject2, "dataView")
		ljson_option.additemstring( ll_childobject3,"title","'Ver datos'")
		 ll_ChildArray = ljson_option.additemarray(ll_childobject3,"lang")
		 ljson_option.additemstring( ll_childarray,"'Ver datos'")
		 ljson_option.additemstring( ll_childarray,"'Cerrar'")
		 ljson_option.additemstring( ll_childarray,"'Actualizar'")
	ll_childobject3 =ljson_option.additemobject( ll_childobject2,"restore")
		ljson_option.additemstring( ll_childobject3,"title", "'Restaurar'")
End If
//dataZoom
IF This.of_GetDataZoom() THEN
	ll_childobject = ljson_option.additemarray( ll_rootobject,"dataZoom")
		ll_childobject2 = ljson_option.additemobject(ll_childobject)
			ljson_option.additemstring( ll_childobject2,"type","'inside'")
			ljson_option.additemnumber(ll_childobject2,"start",0)
			ljson_option.additemnumber( ll_childobject2,"end",100)
		ll_childobject2 = ljson_option.additemobject(ll_childobject)
			ljson_option.additemnumber( ll_childobject,"start",0)
			ljson_option.additemnumber( ll_childobject,"end",100)	
END IF

//xaxis
	ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "xAxis")
	ljson_Option.AddItemString(ll_ChildObject, "type","'category'")
	ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
	ls_SeriesName = ids_Serie.GetItemString(1, 1)
	ids_dato.SetFilter("#1='"+ls_SeriesName +"'")
	ids_dato.Filter()
	ids_dato.Sort()
	FOR ll_i = 1 TO ids_dato.RowCount()
		ljson_Option.AddItemString(ll_ChildArray, "'" +of_GetItemString(ids_dato,ll_i, 2) + "'")
	NEXT
//yaxis
ll_childobject = ljson_option.additemobject( ll_rootobject,"yAxis")
ljson_option.additemstring( ll_childobject,"type", "'value'")
	ll_childobject2= ljson_option.additemarray(ll_childobject,"boundaryGap")
	ljson_option.additemnumber( ll_childobject2,0)
	ljson_option.additemnumber( ll_childobject2,0.01)
	
//series
ll_childarray = ljson_option.additemarray(ll_rootobject,"series")
FOR ll_i = 1 TO ids_Serie.RowCount()
		ls_SeriesName = ids_Serie.GetItemString(ll_i,1)
		ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
		ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")
		ljson_Option.AddItemString(ll_ChildObject2, "type","'line'")
		ljson_option.additemobject(ll_childobject2,"areaStyle")
		ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
		ids_dato.SetFilter("#1='"+ls_SeriesName +"'")
		ids_dato.Filter()
		ids_dato.Sort()
		FOR ll_j = 1 TO ids_dato.RowCount()
			ljson_Option.AddItemNumber(ll_ChildArray2, ids_dato.GetItemNumber(ll_j, 3 ))
		NEXT
NEXT

ls_option = ljson_option.getjsonstring( )
if isvalid (ljson_option ) then destroy (ljson_option)



return ls_option
end function

public function string of_pie ();String ls_Option, ls_SeriesName, ls_cadena
Long 	ll_RowCount, ll_RootObject,ll_ChildObject,  ll_ChildObject1,ll_ChildObject3, ll_ChildArray, ll_ChildArray1, ll_ChildArray3, ll_i, ll_childobject2, ll_childarray2, ll_j
JsonGenerator ljson_Option

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

ll_RowCount = ids_dato.RowCount()

if ib_auto_sort then
	if ib_sort_asc then 
		ids_dato.setsort('#1 a ,#2 a')
	else
		ids_dato.setsort('#1 d ,#2 d')
	end if
end if


//title
ll_childobject = ljson_option.additemobject( ll_rootobject,"title")
		ljson_option.additemstring( ll_childobject,"text","'"+of_gettitle()+"'")
//legend
if of_getlegend() then
	ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
		ljson_option.additemstring(ll_childobject,"orient","'vertical'")
		ljson_option.additemstring(ll_childobject,"left","'left'")
end if
//tooltip
ll_childobject = ljson_option.additemobject( ll_rootobject,"tooltip")
	ljson_option.additemstring( ll_childobject,'trigger', "'item'")
//toolbox
If of_GetToolBox() Then
	ll_ChildObject1 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
	ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildObject1, "feature")
	ll_childobject3 =ljson_Option.AddItemObject(ll_ChildObject2, "saveAsImage")
		ljson_option.additemstring( ll_childobject3,"title","'Guardar como imagen'")
	ll_childobject3 =ljson_Option.AddItemObject(ll_ChildObject2, "dataView")
		ljson_option.additemstring( ll_childobject3,"title","'Ver datos'")
		 ll_ChildArray = ljson_option.additemarray(ll_childobject3,"lang")
		 ljson_option.additemstring( ll_childarray,"'Ver datos'")
		 ljson_option.additemstring( ll_childarray,"'Cerrar'")
		 ljson_option.additemstring( ll_childarray,"'Actualizar'")
	ll_childobject3 =ljson_option.additemobject( ll_childobject2,"restore")
		ljson_option.additemstring( ll_childobject3,"title", "'Restaurar'")
End If
//series
ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
	FOR ll_i = 1 TO ids_Serie.RowCount()
			ls_SeriesName = ids_Serie.GetItemString(ll_i,1)
			ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
			ljson_Option.AddItemString(ll_ChildObject2, "type","'pie'")
			ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")			
			ljson_Option.AddItemString(ll_ChildObject2, "radius","['" + String (((ll_i - 1) / ids_Serie.RowCount() * 100) - 10 ) + "%','" +  String ( ((ll_i) / ids_Serie.RowCount() * 100) - 10 ) + "%']")
			ljson_Option.AddItemString(ll_ChildObject2, "center","['50%','50%']")
			If Len ( This.of_GetRoseType()) > 0 Then //roseType
				ljson_Option.AddItemString(ll_ChildObject2, "roseType","'" + This.of_GetRoseType() + "'")
			End If
			ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
			ids_dato.SetFilter("#1='"+ ls_SeriesName+"'")
			ids_dato.Filter()
			ids_dato.Sort()
			FOR ll_j = 1 TO ids_dato.RowCount()
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildArray2)
				ljson_Option.AddItemString(ll_ChildObject3, "name", "'" + This.of_GetItemString( ids_dato,ll_j, 2) + "'")
				ljson_Option.AddItemNumber(ll_ChildObject3, "value",ids_dato.GetItemNumber(ll_j, 3))
			NEXT
						
	NEXT

ls_option = ljson_option.getjsonstring( )
if isvalid (ljson_option ) then destroy (ljson_option)



return ls_option
end function

public function string of_getrosetype ();return is_roseType	
end function

public subroutine of_setlegend (boolean ab_arg);ib_legend = ab_arg
end subroutine

public function boolean of_getlegend ();return ib_legend
end function

public subroutine of_init (datastore ads_arg);String ls_SeriesName, ls_SeriesName2, ls_Category
Long ll_Row, ll_Row2, ll_j, ll_col, ll_find


ll_col = long(ads_arg.object.datawindow.column.count)
ll_row = ads_arg.rowcount( )
ids_serie.reset( )
if ll_col > 2 then
	ids_dato = ads_arg
	for ll_j = 1 to ll_row
		ls_seriesName = ids_dato.getItemString(ll_j,1)
		ll_find = ids_serie.find( "series = '"+ls_seriesName+"'",1,ids_serie.rowcount( ) )
		if ll_find = 0 then
			ll_row2 = ids_serie.insertrow(0)
			ids_serie.setItem(ll_row2,1,ls_seriesName)
		end if
	next
else
	ids_dato.dataobject = 'dw_list_datos'
	ids_dato.reset()
	ll_row2 = ids_serie.insertrow(0)
	ids_serie.setitem( ll_row2,1,'serie1')
	for ll_j = 1 to ll_row
		ll_row2= ids_dato.insertrow(0)
		ids_dato.setitem(ll_row2,1,'serie1')
		ids_dato.setitem(ll_row2,2,ads_arg.getitemstring(ll_j,1))
		ids_dato.setitem(ll_row2,3,ads_arg.getitemnumber(ll_j,2))
	next
end if


ib_flag = true
this.refresh( )
end subroutine

public function string of_scatter ();String ls_Option, ls_SeriesName, ls_cadena
Long 	ll_RowCount, ll_RootObject,ll_ChildObject,  ll_ChildObject1,ll_ChildObject3, ll_ChildArray, ll_ChildArray1, ll_ChildArray3, ll_i, ll_childobject2, ll_childarray2, ll_j
JsonGenerator ljson_Option

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

ll_RowCount = ids_dato.RowCount()

if ib_auto_sort then
	if ib_sort_asc then 
		ids_dato.setsort('#1 a ,#2 a')
	else
		ids_dato.setsort('#1 d ,#2 d')
	end if
end if


//title
ll_childobject = ljson_option.additemobject( ll_rootobject,"title")
		ljson_option.additemstring( ll_childobject,"text","'"+of_gettitle()+"'")
//legend
if of_getlegend() then
	ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
end if
//grid
ll_ChildObject= ljson_option.additemObject(ll_rootobject,"grid")
	ljson_option.additemstring(ll_childObject,"left","'3%'")
	ljson_option.additemstring(ll_childobject,"right","'4%'")
	ljson_option.additemstring(ll_childobject,"bottom","'3%'")
	ljson_option.additemboolean(ll_childobject,"containLabel",true)


//tooltip
ll_childobject = ljson_option.additemobject( ll_rootobject,"tooltip")
	ljson_option.additemstring( ll_childobject,'trigger', "'axis'")
	ll_childobject1 = ljson_option.additemobject( ll_childobject,"axisPointer")
		ljson_option.additemstring( ll_childobject1,"type","'shadow'")
//toolbox
If of_GetToolBox() Then
	ll_ChildObject1 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
	ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildObject1, "feature")
	ll_childobject3 =ljson_Option.AddItemObject(ll_ChildObject2, "saveAsImage")
		ljson_option.additemstring( ll_childobject3,"title","'Guardar como imagen'")
	ll_childobject3 =ljson_Option.AddItemObject(ll_ChildObject2, "dataView")
		ljson_option.additemstring( ll_childobject3,"title","'Ver datos'")
		 ll_ChildArray = ljson_option.additemarray(ll_childobject3,"lang")
		 ljson_option.additemstring( ll_childarray,"'Ver datos'")
		 ljson_option.additemstring( ll_childarray,"'Cerrar'")
		 ljson_option.additemstring( ll_childarray,"'Actualizar'")
	ll_childobject3 =ljson_option.additemobject( ll_childobject2,"restore")
		ljson_option.additemstring( ll_childobject3,"title", "'Restaurar'")
End If
//dataZoom
IF This.of_GetDataZoom() THEN
	ll_childobject = ljson_option.additemarray( ll_rootobject,"dataZoom")
		ll_childobject2 = ljson_option.additemobject(ll_childobject)
			ljson_option.additemstring( ll_childobject2,"type","'inside'")
			ljson_option.additemnumber(ll_childobject2,"start",0)
			ljson_option.additemnumber( ll_childobject2,"end",100)
		ll_childobject2 = ljson_option.additemobject(ll_childobject)
			ljson_option.additemnumber( ll_childobject,"start",0)
			ljson_option.additemnumber( ll_childobject,"end",100)	
END IF

//xaxis
	ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "xAxis")
	ljson_Option.AddItemString(ll_ChildObject, "type","'category'")
	ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
	ls_SeriesName = ids_Serie.GetItemString(1, 1)
	ids_dato.SetFilter("#1='"+ls_SeriesName +"'")
	ids_dato.Filter()
	ids_dato.Sort()
	FOR ll_i = 1 TO ids_dato.RowCount()
		ljson_Option.AddItemString(ll_ChildArray, "'" +of_GetItemString(ids_dato,ll_i, 2) + "'")
	NEXT
//yaxis
ll_childobject = ljson_option.additemobject( ll_rootobject,"yAxis")
ljson_option.additemstring( ll_childobject,"type", "'value'")
	ll_childobject2= ljson_option.additemarray(ll_childobject,"boundaryGap")
	ljson_option.additemnumber( ll_childobject2,0)
	ljson_option.additemnumber( ll_childobject2,0.01)
	
//series
ll_childarray = ljson_option.additemarray(ll_rootobject,"series")
FOR ll_i = 1 TO ids_Serie.RowCount()
		ls_SeriesName = ids_Serie.GetItemString(ll_i,1)
		ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
		ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")
		ljson_Option.AddItemString(ll_ChildObject2, "type","'scatter'")
		ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
		ids_dato.SetFilter("#1='"+ls_SeriesName +"'")
		ids_dato.Filter()
		ids_dato.Sort()
		FOR ll_j = 1 TO ids_dato.RowCount()
			ljson_Option.AddItemNumber(ll_ChildArray2, ids_dato.GetItemNumber(ll_j, 3 ))
		NEXT
NEXT

ls_option = ljson_option.getjsonstring( )
if isvalid (ljson_option ) then destroy (ljson_option)



return ls_option
end function

public function string of_horizontalbar ();String ls_Option, ls_SeriesName, ls_cadena
Long 	ll_RowCount, ll_RootObject,ll_ChildObject,  ll_ChildObject1,ll_ChildObject3, ll_ChildArray, ll_ChildArray1, ll_ChildArray3, ll_i, ll_childobject2, ll_childarray2, ll_j
JsonGenerator ljson_Option

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

ll_RowCount = ids_dato.RowCount()

if ib_auto_sort then ids_dato.setsort('#1 d ,#2 d')

//title
ll_childobject = ljson_option.additemobject( ll_rootobject,"title")
		ljson_option.additemstring( ll_childobject,"text","'"+of_gettitle()+"'")
//legend
if of_getlegend() then
	ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
end if
//grid
ll_ChildObject= ljson_option.additemObject(ll_rootobject,"grid")
	ljson_option.additemstring(ll_childObject,"left","'3%'")
	ljson_option.additemstring(ll_childobject,"right","'4%'")
	ljson_option.additemstring(ll_childobject,"bottom","'3%'")
	ljson_option.additemboolean(ll_childobject,"containLabel",true)


//tooltip
ll_childobject = ljson_option.additemobject( ll_rootobject,"tooltip")
	ljson_option.additemstring( ll_childobject,'trigger', "'axis'")
	ll_childobject1 = ljson_option.additemobject( ll_childobject,"axisPointer")
		ljson_option.additemstring( ll_childobject1,"type","'shadow'")
//toolbox
If of_GetToolBox() Then
	ll_ChildObject1 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
	ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildObject1, "feature")
	ll_childobject3 =ljson_Option.AddItemObject(ll_ChildObject2, "saveAsImage")
		ljson_option.additemstring( ll_childobject3,"title","'Guardar como imagen'")
	ll_childobject3 =ljson_Option.AddItemObject(ll_ChildObject2, "dataView")
		ljson_option.additemstring( ll_childobject3,"title","'Ver datos'")
		 ll_ChildArray = ljson_option.additemarray(ll_childobject3,"lang")
		 ljson_option.additemstring( ll_childarray,"'Ver datos'")
		 ljson_option.additemstring( ll_childarray,"'Cerrar'")
		 ljson_option.additemstring( ll_childarray,"'Actualizar'")
	ll_childobject3 =ljson_option.additemobject( ll_childobject2,"restore")
		ljson_option.additemstring( ll_childobject3,"title", "'Restaurar'")
End If
//dataZoom
IF This.of_GetDataZoom() THEN
	ll_childobject = ljson_option.additemarray( ll_rootobject,"dataZoom")
		ll_childobject2 = ljson_option.additemobject(ll_childobject)
			ljson_option.additemstring( ll_childobject2,"type","'inside'")
			ljson_option.additemnumber(ll_childobject2,"start",0)
			ljson_option.additemnumber( ll_childobject2,"end",100)
			ljson_option.additemnumber( ll_childobject2,"yAxisIndex",0)
		ll_childobject2 = ljson_option.additemobject(ll_childobject)
			ljson_option.additemnumber( ll_childobject,"start",0)
			ljson_option.additemnumber( ll_childobject,"end",100)	
			ljson_option.additemnumber( ll_childobject2,"yAxisIndex",0)
END IF

//xaxis
ll_childobject= ljson_option.additemobject(ll_rootobject,"xAxis")
	ljson_option.additemstring(ll_childobject,"type","'value'")

//yAxis
ll_childobject = ljson_option.additemObject(ll_rootObject,"yAxis")
	ljson_option.additemstring( ll_childobject,"type","'category'")
	ll_childarray = ljson_option.additemarray( ll_childobject,"data")
	ls_seriesname = ids_serie.getItemString( 1,1)
	ids_dato.SetFilter("#1='"+ls_SeriesName +"'")
	ids_dato.Filter()
	ids_dato.Sort( )
	FOR ll_i = 1 TO ids_dato.RowCount()
			ljson_Option.AddItemString(ll_ChildArray, "'" +of_getitemstring(ids_dato,ll_i,2)+ "'")
	NEXT
	
//series
	ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series"  )
		FOR ll_i = 1 TO ids_Serie.RowCount()
				ls_SeriesName = ids_Serie.GetItemString(ll_i,1)
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
				ljson_option.addItemString( ll_childObject2,"name","'"+ ls_seriesName +"'")
				ljson_option.addItemString( ll_childObject2,"type","'bar'")
				ljson_Option.additemstring( ll_childobject2,"stack","'total'")
				ll_childobject3 = ljson_option.additemobject(ll_childObject2,"label")
					ljson_option.additemboolean( ll_childobject3,"show",true)
				ll_childobject3 = ljson_option.additemobject(ll_childobject2,"emphasis")
					ljson_option.additemstring(ll_childobject3,"focus","'series'")
				ll_ChildArray2 = ljson_Option.addItemArray(ll_ChildObject2,"data")
				ids_dato.SetFilter("#1='"+ls_SeriesName +"'")
				ids_dato.Filter()
				ids_dato.Sort( )
				FOR ll_j = 1 TO ids_dato.RowCount()
					ljson_Option.AddItemNumber(ll_ChildArray2, ids_dato.GetItemNumber(ll_j, 3 ))
				NEXT
		NEXT


ls_option = ljson_option.getjsonstring( )
if isvalid (ljson_option ) then destroy (ljson_option)



return ls_option
end function

public function string of_gauge ();String ls_Option, ls_SeriesName, ls_cadena
Long 	ll_RowCount, ll_RootObject,ll_ChildObject,  ll_ChildObject1,ll_ChildObject3, ll_ChildArray, ll_ChildArray1, ll_ChildArray3, ll_i, ll_childobject2, ll_childarray2, ll_j
JsonGenerator ljson_Option

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

ll_RowCount = ids_dato.RowCount()

if ib_auto_sort then
	if ib_sort_asc then 
		ids_dato.setsort('#1 a ,#2 a')
	else
		ids_dato.setsort('#1 d ,#2 d')
	end if
end if


//title
ll_childobject = ljson_option.additemobject( ll_rootobject,"title")
		ljson_option.additemstring( ll_childobject,"text","'"+of_gettitle()+"'")
		
//tooltip
ll_childobject = ljson_option.additemobject(ll_rootobject,"tooltip")
	ljson_option.additemstring(ll_childobject,"formatter","'{a} </br> {b} : {c}%'")
	
//toolbox
If of_GetToolBox() Then
	ll_ChildObject1 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
	ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildObject1, "feature")
	ll_childobject3 =ljson_Option.AddItemObject(ll_ChildObject2, "saveAsImage")
		ljson_option.additemstring( ll_childobject3,"title","'Guardar como imagen'")
	ll_childobject3 =ljson_Option.AddItemObject(ll_ChildObject2, "dataView")
		ljson_option.additemstring( ll_childobject3,"title","'Ver datos'")
		 ll_ChildArray = ljson_option.additemarray(ll_childobject3,"lang")
		 ljson_option.additemstring( ll_childarray,"'Ver datos'")
		 ljson_option.additemstring( ll_childarray,"'Cerrar'")
		 ljson_option.additemstring( ll_childarray,"'Actualizar'")
	ll_childobject3 =ljson_option.additemobject( ll_childobject2,"restore")
		ljson_option.additemstring( ll_childobject3,"title", "'Restaurar'")
End If

//series
ll_childArray = ljson_option.additemarray( ll_rootObject,"series")
	ll_childobject1 = ljson_option.additemobject(ll_childarray)
	ljson_option.additemString( ll_childobject1,"name","'"+of_gettitle()+"'")
	ljson_option.additemString(ll_childobject1,"type","'gauge'")
		ll_childobject2 = ljson_option.additemobject(ll_childobject1,"progress")
			ljson_option.additemboolean( ll_childobject2,"show",true)
		ll_childobject2 = ljson_option.additemobject(ll_childobject1,"detail")
			ljson_option.additemboolean(ll_childobject2,"valueAnimation",true)
			ljson_option.additemstring( ll_childobject2,"formatter","'{value}'")
		ll_childarray1 = ljson_option.additemarray(ll_childobject1,"data")
			ll_childObject2 = ljson_option.additemobject( ll_childarray1)
			ljson_option.additemnumber( ll_childObject2,"value",ids_dato.getitemnumber( 1,3) )
			ljson_option.additemstring(ll_childobject2,"name","'" + ids_dato.getitemstring( 1, 2) +"'" )

ls_option = ljson_option.getjsonstring( )
if isvalid (ljson_option ) then destroy (ljson_option)



return ls_option
end function

public subroutine of_selecrow (ref datawindow adw_arg, string as_arg);/*
*ejemplo para seleccionar el dato en la dw cuando se hace click 
*
*/


JsonParser lnv_JsonParser
Long 		ll_RootObject, ll_Find, ll_I, ll_col
String 	ls_Name, ls_column

lnv_JsonParser = Create JsonParser

lnv_JsonParser.LoadString(as_arg)
ll_RootObject = lnv_JsonParser.GetRootItem()
ls_Name = lnv_JsonParser.GetItemString( ll_RootObject, "name" )

ll_col = long(adw_arg.object.datawindow.column.count)
if ll_col = 2 then
	ls_column= adw_arg.describe('#1' + '.name')
else
	ls_column= adw_arg.describe('#2' + '.name')
end if

ll_Find = adw_arg.Find(  ls_column +" = '" + ls_Name + "'", 1, adw_arg.RowCount()  )

If ll_Find > 0 Then
	adw_arg.SetRedraw(False)
	adw_arg.ScrollToRow(adw_arg.RowCount())
	adw_arg.ScrollToRow(ll_Find)
	adw_arg.selectrow( 0, False )
	adw_arg.selectrow( ll_Find, True )
	adw_arg.SetRedraw(True)
End If

If IsValid ( lnv_JsonParser ) Then Destroy ( lnv_JsonParser )

end subroutine

event downloadingstart;string ls_img ,ls_path
long ll_ret, ll_gf
boolean lb_exist
ls_img = 'img'
ls_path = filename
ll_gf = GetFileSaveName ( 'Guardar', ls_path, ls_img,'png','imagen(.png),*.png,All Files (*.*),*.*')

if ll_gf = 1 then
	lb_exist = fileExists(ls_img)
	if lb_exist then
		ll_ret = messagebox('Guardar','¿Desea sobrescribir el archivo existente?',Question!,YesNo!)
		if ll_ret = 1 then
			ll_ret = FileCopy ( filename,ls_path,true)
		end if
	else
		ll_ret = FileCopy ( filename,ls_path,true)
	end if
end if
end event

event evaluatejavascriptfinished;If Len ( ErrorMessage ) > 0 Then
	MessageBox ( "EvaluateJavaScriptFinished Error", ErrorMessage )
End If
end event

on n_webbrowser.create
end on

on n_webbrowser.destroy
end on

event navigationprogressindex;/*dynamic load echarts.html and generate echarts*/
IF progressindex  = 100 THEN
	IF ib_flag THEN
		ib_flag = false
		of_applysinc()
	END IF
END IF
end event

event constructor;/*############################################
*Para iniciar un gráfico* 
Se debe usar la función of_init() que usa como parámetro una datawindow o datastore. 
El datawindow debe constar de dos columnas (categoría, valor) o tres columnas (serie, categoría, valor)
ob: por el momento no acepta numerico en la columna de serie, debe ser varchar 

*Usar las instancias para configurar:*
is_style: ‘bar’,’line’,’area’, ‘pie’,’scatter’,’ horizontalbar’,’ gauge’
is_title: ‘Titulo para Mostar’

*Usar las variables booleanas para añadir funciones a los gráficos como el zoom o para poder guardar*
ib_toolbox: 
ib_legend:
ib_datazoom:
ib_preview: (true para mostrar la vista previa del grafico,  false para dejar de mostrar) 
il_width:
il_height :
#############################################*/

ids_dato  = create datastore
ids_serie = create datastore
ids_arg = create datastore
ids_serie.dataObject = 'd_dw_series'

if ib_preview then
	post event ue_preview()
end if
end event

