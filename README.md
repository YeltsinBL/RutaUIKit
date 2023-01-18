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
