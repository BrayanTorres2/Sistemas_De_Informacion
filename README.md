# Sistemas_De_Informacion
La inminente necesidad del manejo de los procesos en las organizaciones mediante sistemas de información automatizados requiere de un ingeniero de sistemas que tenga la visión integral del manejo de la información las tecnologías de información y la plataforma tecnológica que soporte las operaciones.
##Comandos avanzados:

# Crear ambiente virtual

 
 conda create --name [nombre_paquete] [paquetes]
Instalar paquete que no esta disponible en el canal principal de conda:

 conda install -c [nombre_canal] [nombre_paquete] 
Enlistar las revisiones del estado del ambiente virtual:

 conda list --revision
Volver al estado de una revisión anterior:

 conda install --revision [nombre_revision]
Crear una descripción del ambiente con todas sus dependencia para compartir:

 conda env export  --no-builds

Crear una descripción del ambiente solo con los paquetes agregados manualmente (tiene la ventaja que permite mayor compatibilidad multiplataforma, daod que conda se encarga de instalar las dependencias especificas para los paquetes en el SO):

conda env export --from-history
Crear un archivo con la descripción(suele ser común en este tipo de archivos el formato .yml):

conda env export --from-history --file nombre_archivo.yml
Instalar ambiente virtual desde archivo:

conda env create --file nombre_archivo.yml
