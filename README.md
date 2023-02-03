# RutaUIKit
## _Aprendiendo a crear las UI de aplicaciones iOS mediante el storyboard y código._  

`ViewController`: creación de UIImageView, UILabel y UIButton, utilicé el `translatesAutoresizingMaskIntoConstraints` para activar los constrains por código y en el `viewDidLoad` agregué los constrains a las vistas creadas.

`OnBoardingView`: se creó para poder quitar la responsabilidad de crear la vista en `ViewController` por lo que queda el código mas limpio.

`ButtonView`: se creó este fichero donde contiene sólo la creación de botones con sus propiedades y constrains.

`LabelView`: se creó este fichero donde contiene sólo la creación de labels con sus propiedades y constrains; para las propiedades se hizo de 2 formas: una normal y otra con un diccionario que contiene una key 'el texto' y los atributos. 

`ImageView`: se creó este fichero donde contiene sólo la creación de imágenes con sus propiedades y constrains; para sus propiedades agregamos un borde circular que, si la imagen sobrepasa el circulo, esta se recorta ajustándose al diseño.

`TableView`: creamos una TableView y le registramos una celda con su identificador que servirá para agregarlo en uno de los métodos necesarios de Xcode para que se pueda visualizar las celdas por la cantidad de elementos de un array. 
- TablleViewDataSourece: Agregamos el 'UITableViewDataSource' para conectar los datos del array con la vista.
-- Primero debemos de indicar la cantidad de elementos a mostrar en la tabla.
-- Luego, para mostrar los datos en al celda, debemos de obtener el indice del array, después configuramos los datos y lo añadimos a la celda.
-- Para agregar un título a las secciones de la Tabla se utiliza el 'titleForHeaderInSection' y cambiamos las configuraciones para adaptarlos a un array de arrays, porque cada array será una sección diferente.
- TableViewDelegate: Agregamos el 'UITableViewDelegate' para realizar acciones y cambiar propiedades de la tabla

`CustomTableViewCell`: creamos este fichero desde un 'Cocoa Touch Class' para crear las celdas. Para utilizarlo y pasar los datos:
- Debemos de registrar la celda en la TableView con su identificador.
- Agregar el identificador en el método que mostrará la celda en la table.
- Después de agregar el identificador, lo casteamos a la celda creada para que lo tome como referencia y poder acceder al método que la llenará con los datos.

`StackView`: creamos esta vista, porque nos permite agregar subvistas una encima de otra o a los costados, también a las subvistas agregadas les asignas un constrains, lo cual nos ahorra código.

`CollectionView`:  es parecido a la creación de una TableView, solo que la diferencia es al agregara las celdas al CollectionView, para ello utilizamos el 'UICollectionViewFlowLayout' porque sin esto no se visualizará las celdas.
- Modern: se utilizó la nueva api para optimizar el código que la versión anterior, para ello:
-- Utilizamos el 'UICollectionLayoutListConfiguration' para la configuración que utilizará el layout 'UICollectionViewCompositionalLayout' y este lo agregamos al 'CollectionView'
-- Para conectar la vista con los datos utilizamos el 'UICollectionViewDiffableDataSource' que recibe la sección y el modelo de datos.
--Luego de configurar la celda, utilizamos 'UICollectionViewDiffableDataSource' para mostrar la celda en el CollectionView
--Para pasar los datos al dataSource, se debe especificar cuantas secciones hay mediante el 'appendSections' y el modelo con su sección respectiva por el 'appendItems', al final aplicamos los cambios con 'apply'.

`Navigation`: se realizara el modo 'Modal' y Push:
- Modal: muestra una vista encima de otra, utilizamos directamente el 'ViewController' para poder mostrar una vista 'Sheet' que utiliza obligatoriamente el 'UIViewController' por el cual no lo hice en una UIView como los demás.
- Push: se puede avanzar y retroceder en las vistas, en esta ocasión cree un nuevo 'storyboard' para 'MainA' para agregar un NavigationController.
-- Se agregó una vista Modal dentro de una de las vista porque estas utilizan UIViewController y permite hacerlo.
-- También se agregó la interacción de regresar a la vista inicial desde cualquier vista y la de regresar a la vista anterior.

`Sheet`: es parecido al agregar una navegacion modal, pero se diferencia en la configuracion de la vista y el llamado por la instancia.

`Delegation Pattern`: realizamos una petición http y al querer recibir la información en la vista:
- Utilizamos el 'Delegate' mediante un protocolo que se crea en la clase 'ApiClient'.
- Lo llamamos en la vista mediante una extensión indicando que conformara el protocolo anterior.
- Indicamos que la vista sera el delegate del ApiClient.
- Retain Cycles: si no manejamos bien las instancias de código en la aplicación hará que esta crashee y nunca dejará de usar memoria. Ocurre cuando existe 2 instancias fuertes entre ellas. Para hacer una referencia débil se asigna al protocolo el tipo 'AnyObject' y a la propiedad de esta se agrega 'weak'.

`StoryBoard`: Creación de las vistas y funcionalidad utilizando el storyboard
- User Defined Runtime Attribute: se puede actualizar las propiedades de una vista pero se mostrará al ejecutar la aplicación, cabe recalcar que si se agrega una propiedad que no exista se mostrará por consola un error.
- Utilización de '@IBDesignable' en una clase 'UIVIew' para actualizar los atributos de una vista.
- Utilización de '@IBInspectable' para mostrar los atributos creados en la vista en el Inspector de Atributos.
- Se navegó de un Storyboard a otro mediante un 'Storyboard Reference'.

`XIBs`: otra forma de hacer vistas en XCode, antes de utilizar Storyboard se hacían de esta forma las vistas.
- Se hizo una navegación entre un Storyboard de inicio hacia un XIBs.
- Se creo una vista utilizando el 'UINib; para visualizarla en un XIBs y Storyboard pero esta no se muestra en el IB sino al compilar en un simulador.
- Se hizo la navegación de un Xib a otro Xib.

> Nota: cuando se trabaja desde el IB (interface builder) y modificamos la vista, estamos trabajando con el 'chips'; pero cuando entramos al codigo hace referencia a los 'nibs'.

`Animation`: creamos animaciones a las vistas.
- Animación por código sin constrains: utilizamos el frame para darle un lugar y tamaño especifica a la vista. Utilizamos: 
-- Delay: tiempo que debe pasar para que empiece la animación.
-- UsingSpringWithDamping: amortiguamiento para la animación (rebote), mientras mas cercano al cero hará que oscile mas rápido.
-- InitialSpringVelocity: velocidad inicial de la animación.
-- Options: mascaras de opciones, si queremos que la animación sea mas rápida al inicio o final, etc.
-- Completion: se ejecuta cuando la animación ha finalizado
- Animación por código con constrains: agregamos las constrains como se venia haciendo por código pero algunos los hacemos con variables para actualizar su valor en la animación.
-- Utilizamos el 'DispatchQueue.main.asyncAfter' para que actualice la vista en tiempo de ejecución.
-- Creamos una función donde se hará las modificaciones a la vista y se agrega 'self.view.layoutIfNeeded()' para formazar la animación.
- Animación utilizando el Storyboard y sus constrains: agregué una vista con sus constrains, las cuales los conecté al controller y realice el mismo procedimiento que la Animación con Constrains.

`Child`: para agregar un ViewController dentro de otro ViewController.
- Mostrar el ViewController Secundario en el ViewController Principal:
-- Agregamos la vista del ViewController secundario al Viewcontroller principal 'view.addSubview(ViewControllerSecundario.view)'.
-- Utilizamos el 'addChild' para agregar al ViewController secundario como hijo del ViewController principal 'addChild(ViewControllerSecundario)'.
-- Notificamos al ViewController secundario que se movido la vista la ViewController principal 'ViewControllerSecundario.didMove(toParent: self)'.
- Eliminar el ViewController Secundario del ViewController Principal:
-- Indicamos al ViewCotroller secundario que será eliminado del principal con el 'ViewControllerSecundario.willMove(toParent: self)'.
-- Eliminamos el ViewController Secundario del ViewController Principal 'ViewControllerSecundario.removeFromParent()'.
-- Eliminamos la vista del ViewController secundario del ViewController Principal 'ViewControllerSecundario.view.removeFromSuperview()'.

### Ciclo de Vida de los ViewController
Los métodos que se llaman al cargar el ViewController, cuando está por presentarse o se ha cargado y está  por eliminarse o se ha eliminado, son:
1. `viewDidLoad`: se llama para notificar al 'ViewController' que su vista se ha cargado en memoria. 
  1. Dentro de este método podemos añadir lógica, subvistas, constrains, etc.
1. `viewWillAppear`: se llama cuando la vista esta preparada y se va a mostrar en el 'ViewController'
1. `viewWillLayoutSubviews`: se llama para notificar al 'ViewController' que la vista esta apunto de posicionar sus subvistas.
  1. Cuando rotamos la vista del dispositivo de horizontal a vertical y; las vistas se tienen que redibujar y distribuir por la vista padre, es en ese momento que se llama este método.
1. `viewDidLayoutSubviews`: se llama para notificar al 'ViewController' de que la vista acaba de posicionar todas sus subvistas.
  1. Ocurre después del `viewWillLayoutSubviews`
1. `viewDidAppear`: se llama cuando la vista ya se ha cargado en el 'ViewController' y se esté mostrando al usuario.
1. `viewWillDisappear`: se llama para notificar al 'ViewController' de que la vista está apunto de ser eliminada de la jerarquía de vistas.
1. `viewDidDisappear`: se llama para notificar al 'ViewController' de que la vista a sido eliminada de la jerarquía de vistas.

> Nota: los métodos `viewWillDisappear` y `viewDidDisappear` no se pueden ejecutar en el root principal del 'ViewController', para poder utilizarlos deberíamos crear otro 'ViewController' y dismissearlo.

### Migración de UIKit a SwiftUI
- UIHostingController: creamos una instancia de este tipo que espera la 'rootView' de la nueva vista de SwiftUI.
- UIHostingConfiguration: creamos una vista en SwiftUI y la podemos utilizar como celdas de una 'UITableView'
