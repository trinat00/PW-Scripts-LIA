# PW-Scrpits-LIA

Página web que aloja los scripts que automatizan la creación de servidor LAMP, está enfocada en redes de sensores del LIA 

## Comenzando

Estas instrucciones te permitirán añadir entradas al menú desplegable, es decir el dropdown
### Pre-requisitos

* Conocimientos básicos de HTML
* Editor de texto de su preferencia

### ¿Como añadir o cambiar las entradas en el Dropdown (menú desplegable)? 🔧

Abre el archivo **index.html** con un editor de texto de tu preferencia, este se encuentra en la raíz del proyecto.
Entre las líneas 51-55 veras el contenido del dropdown, en la variable **value** se encuentra el archivo que se va a descargar, como se puede ver a continuación se descargara el archivo **Docker.sh**:

```
<option value="Docker.sh">Instala Docker para el funcionamiento de los Scripts</option>
```
#### **Cambiar**
En el caso en el que desee cambiar el documento a descargar se tendrá que dirigir a la carpeta **scripts** que se encuentra en la raís del proyecto y añadir lo que se desee descargar (una imagen otro archivo, script) y se cambiara en la línea el nombre del archivo añadido, ejemplo a continuación:

#### *Ejemplo:*
Se añade imagen y se desea descargar, esta se llama **icono.png**, por lo tanto, quedaría así:

```
<option value="icono.png">Icono ejemplo</option>
```
Y la descripción puede cambiar modificando el contenido después del **>** y antes del **<** como en el anterior ejemplo **Icono ejemplo** o en el primer recuadro de codigo donde dice **Instala Docker para el funcionamiento de los Scripts**

#### **Añadir**
Si lo que quieres es añadir una nueva opción al dropdown (menú desplegabe), debes copiar otra línea como la siguiente:

```
<option value="Docker.sh">Instala Docker para el funcionamiento de los Scripts</option>
```
Y lo que debes hacer es añadir el archivo a la carpeta **scripts** que se encuentra en la raís del proyecto y volviendo a la línea copeada cambias el valor de value por el nombre del archivo, ejemplo a continuación:

#### *Ejemplo:*
Se añade archivo **tarea.pdf** a la carpeta **/scripts** y se desea añadir, por lo tanto, debes copear la línea de las opciones como a continuación:

```
<option value="tarea.pdf">PDF de la tarea</option>
<option value="Docker.sh">Instala Docker para el funcionamiento de los Scripts</option>
```
En este caso se verá en el desplegable como la primera opción, ya que está hasta arriba

## Autores

* **Tristán Huerta** - *Sistema Web* - [trinat00](https://github.com/trinat00)
* **Ricardo Gomez** - *Creación del script* - [Ricardo-Gomez-4-113](https://github.com/Ricardo-Gomez-4-113)

## Créditos

 **Jaqueline Garcia** & **Yatziri Amparo** - *Conocimientos de diseño de páginas* - [Jaqueline16](https://github.com/jaqueline16) & [YatziEs224](https://github.com/yatziEs224)