# Biblia-Ejemplos-Lazarus-Free-Pascal
Todo free pascal en castellano. Curso de ejemplos completos.






01. Laz_FileExplorer

- Versión 0.50 alfa

             -  Diversas correciones en el código.
 
             -  Añadido Auto-Detección de unidades nueva.

             -  Activado restaurar y guardar configuraciones del programa.

             -  Añadido control por teclado al TreeView.

             -  Añadido modulo de encriptacion de archivos.

             -  .







- Versión 0.20 alfa.

             -  Diversas correciones en el código.

 	- Cambiado TKIcon por TIcon para no depender del paquete kcontrols. TIcon de Lazarus, por alguna razon desconocida daba fondo negro y ahora no, (por la inclusion o el posicionamiento de alguna unidad en Uses).

 	-  Sustituido TShellTreeView por TTreeView, entre otras cosas este último es mas versatil, mas facil en la programacion en cuestion de iconos y admite mas tamaños de iconos.
             -  Añadido Crear enlace de una pagina web.

             -  Ahora en nombres de ficheros y directorios distinguimos entre nombres reales que el  sistema da y los nombres mostrados (alias), los primeros los da el programador y los segundos son exclusivos del idioma en el que trabajemos.

	 -  Sustituido ShellExecute por OpenUrl, este último interactua con el sistema operativo y te abre cualquier cosa, (necesita nombres reales).



 
   - Versión 0.10 alfa, vesion inicial 

	- TTreeView, TListView (Icon, List, Report,small-icon).
	- TKIcon del paquete kcontrols (TIcon de Lazarus da fondo negro).
	- Mostrar(Hint) Items mas largos en ListBox.
	- ShellApi para copiar, mover, borrar, Atributos ... Archivos y carpetas.
	- Mover a la papelera.
	- Coger Info e iconos(SHGetFileInfo) de archivos y carpetas.
	- ImageList Coger sus iconos, Tres tamaños de Iconos 16x16, 24x24, 32x32. 
	- Arrastrar Archivos y carpetas dentro de ListBox.
	- Arrastrar Archivos y carpetas de una ventana a otra.
	- Directorios especiales de windows.
	- IniPropStorage (Inifiles) Guardar configuracion del programa.
	- Idiomas español para componentes usados en la aplicacion (2ª forma).
	- Versión windows.
	- Cantidad de menoria (usada sin usar).

	- Anadido funciones extras:
               .Dividir - unir archivo (Stream).
               .Camuflar - Descamuflar un archivo en una Imagen (Stream).
               .Asociar la extenxion de un archivo  a este. 
               .Crear acceso directo de un archivo.
               .Descargar Codigo html con 3 metodos, fphttpClient, Syanpse, urlmon.dll.
               .IP externa de la conexion a internet.

	- Doble click en TListView para abrir los diferentes formatos de archivos (una forma)
          ( Execute y .. ). 


	



02. spell- ortografia	--> dicio
	-  Corrector de ortografia para castellano (se puede adaptar a otros idiomas)
	-
	-
	-




03. LazZipper    --> Archivos comprimidos  
	- compatibles con Zip, totalmente nativo de lazarus free pascal
	-
	- Curso lazplanet --> Curso Lazarus mio -->  lazarus-br (Programas Lazarus)



04. RichEditor  (RichTextEditor)
        - Creado con el componente RichMemo de lazarus
	- Clipboard.
	- Cambiar tamaño de Imagenes (se ha usado ImageList para ello).
	- uso de .RichMemo1MouseWheelUp y .RichMemo1MouseWheelDown para incrementar la velocidad
de movimiento en scrollbar.
	-
	-



05. Gestion de Almacen compras y ventas
	- Inifile (guarda la configuracion del programa).
	- Bases de datos con Record Type.
	- Idiomas español para componentes usados en la aplicacion (1ª forma)
	- Control de variable tipo integer, real, ..  en los edit.
	- TStringList como archivo inifile en compras y ventas.
	- Uso de la funcion Val() para control de errores y try ...  Except ... Finally end;
	- Version de compilacion (uno de los métodos)
	-
	-
	-





06.  LazSplitFile  --> divide - une archivos
	- Control del nombre de salida de un archivo ( que no lo sobreescriva dandole otro nombre añadiendole 1, 2, etc)
	- Tamaño de un fichero 
	- Formato de un numero real o entero con coma decimal y puntos para los miles
           Label_Bytes.Caption:=FormatFloat('###,###,###.## Bytes', a);  //  redonea pero no rellena de ceros 
                                                            '###,###,###.00' redondea y rellena los huecos de ceros
	- Uso de Stream.







07.   LazWinServiceMgr_Sp

	- Instala - Desinstala demonios (Procesos en memoria).
	- 





08.  LazKamuflage  --> camufla archivos dentro de imagenes

	- Main routines programmed by Emil Beli, ebeli@varnus.com. 
	- Unidad para crear variables globales y otra para crear funciones y procedimientos globales usadas por otras unidades. 
	- Procedimiento para crear mensages de error "procedure RaiseResult(ARes:byte);".
	- Uso de TStringList como Tinifiles para guardar variables de configuración. (corregido por mi).
	- Uso de Stream.





09. DragDrop Demo por Michael Köcher (six1) 2017

	- Componente DragDrop
	- TListView (Icon, List, Report,small-icon).
	- TIcon de Lazarus parece funcionar con la version 2.0.10 de lazarus.
	- ShellApi para copiar, mover, borrar, Atributos ... Archivos y carpetas.
	- Doble click en TListView para abrir los diferentes formatos de archivos (otra forma)
          ( OpenURL( test_path +PathDelim + ListView1.Selected.Caption);  ).   
 
	- Coger Info e iconos(SHGetFileInfo) de archivos y carpetas.
	- ImageList Coger sus iconos, Tres tamaños de Iconos 16x16, 24x24, 32x32. 
	- Arrastrar Archivos y carpetas dentro de ListBox.
	- 
	- 
	- 
	- Idiomas español para componentes usados en la aplicacion (Otra forma).
	- 
	- 




10.
