# RutaUIKit
## _Aprendiendo a crear las UI de aplicaciones iOS mediante el storyboard y código._  

`ViewController`: creación de UIImageView, UILabel y UIButton, utilicé el `translatesAutoresizingMaskIntoConstraints` para activar los constrains por código y en el `viewDidLoad` agregue los constrains a las vistas creadas.

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