# RutaUIKit
## _Aprendiendo a crear las UI de aplicaciones iOS mediante el storyboard y código._  

> NOTA: 
Por qué aprender UIKit?
En algunas empresas aún se utiliza este framework para el desarrollo de las aplicaciones iOS y en otras se está migrando desde esta, por lo cual aun es importante aprender UIKit como SwiftUI.

Estructura de los `primeros ficheros` creados automáticamente por el proyecto:
- AppDelegate: es el punto de entrada de la aplicación.
- SceneDelegate: sirve para manejar distintas pantallas a la vez en nuestra aplicación. Tiene métodos que se llamaran automáticamente cuando la aplicación esta en segundo plano o cuando se vuelva a abrir. 
- ViewController: es la manera en que controla UIKit las distintas vistas dentro de la aplicación. Es una clase que se encarga del ciclo de vida de las pantallas que mostramos.
- Main: se crea de forma visual las pantallas de la aplicación.
- Assets: carpeta donde se crea y agrega las imágenes, iconos, colores, etc.; para que se usen dentro de la aplicación.
- LaunchScreen: es la vista que aparece mientras esta cargando la aplicación.

Explicación de los algunos métodos de la `ViewController`:
- viewDidLoad: es un método que controla el ciclo de vida del viewcontroller.
- viewWillAppear: es un método que se llama antes de que la vista del viewcontroller aparezca.
- viewWillDisappear: es un método que se llama antes de que desaparezca una vista de la aplicación.

Explicación de lo realizado en el `Main`:
- Constrain: hemos agregado una normas de constrain a los elementos para que cualquier cambio en la vista siempre estén en la misma posición dada.
- ViewController: se conectó la vista con este archivo para poder realizar una acción y cambiar sus propiedades por código.