# RappiTest
Realizar la construcción de vistas de un catálogo conformado por una lista de aplicaciones, lo esperado es mostrarlas todas con su respectivo icono y al hacer [tap] abra el detalle.

RappiTest Posee una arquictectura VIPER (view-Interactor-Presentator-Entity-Router) esta tiene implementado una extension para la comunicacion entre la lógica de la applicación y los servicios locales o remotos. DataManager - Service.
Está conformado por un PageController principal el cual permite ingresar con un usuario por defecto para tener servicio del top 20 de las apps free de iTunes. Posee servicio local ya que en la llamada de los datos guarda el response de las app y permite una interación con el usuario posterior al primer login sin servicios de intenet. Igualmente maneja otro ejemplo de data local con la misma libreria POD Real https://realm.io/docs/get-started/ donde se guarda las apps "instaladas por el usuario" en el modelo UserModel.

RappiTest Posee 3 vistas principal (Lista de secciones - Sección - Detalle) en conjunto con otras para una mejor interacción con el usuario y demostración de algunos otros conocimientos. Tambien un conjunto de animaciones de vista y transiciones.

Espero les guste...

#Swift Version 3
En caso de conflicto de con la version de swift, ir a Targets -> RappiTest -> BuildSettings -> User legacy Swift languaje version y marcar NO

#Requerimientos
Presento al poderoso Cocoa Pods https://cocoapods.org/ instalar si aún no lo has usado.

#Instalación
git clone 
cd RappiTest/RappiTest
pod install
Abrir el .xcworkspace
Buil, Run Project.

#iPhone version
![alt tag](https://github.com/jyfercolina/RappiImages/blob/master/RappiTestCapture/Screen%20Shot%202017-01-17%20at%209.24.51%20AM.png) ![alt tag](https://github.com/jyfercolina/RappiImages/blob/master/RappiTestCapture/Screen%20Shot%202017-01-17%20at%209.24.56%20AM.png)
![alt tag](https://github.com/jyfercolina/RappiImages/blob/master/RappiTestCapture/Screen%20Shot%202017-01-17%20at%2010.45.44%20AM.png) ![alt tag](https://github.com/jyfercolina/RappiImages/blob/master/RappiTestCapture/Screen%20Shot%202017-01-17%20at%209.24.00%20AM.png)
![alt tag](https://github.com/jyfercolina/RappiImages/blob/master/RappiTestCapture/Screen%20Shot%202017-01-17%20at%209.24.13%20AM.png) ![alt tag](https://github.com/jyfercolina/RappiImages/blob/master/RappiTestCapture/Screen%20Shot%202017-01-17%20at%2010.46.38%20AM.png)
![alt tag](https://github.com/jyfercolina/RappiImages/blob/master/RappiTestCapture/Screen%20Shot%202017-01-17%20at%209.23.48%20AM.png)
#iPad version
![alt tag](https://github.com/jyfercolina/RappiImages/blob/master/RappiTestCapture/Screen%20Shot%202017-01-17%20at%208.52.13%20AM.png) ![alt tag](https://github.com/jyfercolina/RappiImages/blob/master/RappiTestCapture/Screen%20Shot%202017-01-17%20at%208.43.24%20AM.png)
![alt tag](https://github.com/jyfercolina/RappiImages/blob/master/RappiTestCapture/Screen%20Shot%202017-01-17%20at%208.42.18%20AM.png) ![alt tag](https://github.com/jyfercolina/RappiImages/blob/master/RappiTestCapture/Screen%20Shot%202017-01-17%20at%208.43.01%20AM.png)


#Local Data
![alt tag](https://github.com/jyfercolina/RappiImages/blob/master/RappiTestCapture/Screen%20Shot%202017-01-17%20at%207.52.01%20AM.png) ![alt tag](https://github.com/jyfercolina/RappiImages/blob/master/RappiTestCapture/Screen%20Shot%202017-01-17%20at%2010.45.56%20AM.png)
![alt tag](https://github.com/jyfercolina/RappiImages/blob/master/RappiTestCapture/Screen%20Shot%202017-01-17%20at%209.23.48%20AM.png) 


