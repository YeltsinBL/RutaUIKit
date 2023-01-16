# RutaUIKit
## _Aprendiendo a crear las UI de aplicaciones iOS mediante el storyboard y código._  

`ViewController`: creación de UIImageView, UILabel y UIButton, utilicé el `translatesAutoresizingMaskIntoConstraints` para activar los constrains por código y en el `viewDidLoad` agregue los constrains a las vistas creadas.

`OnBoardingView`: se creó para poder quitar la responsabilidad de crear la vista en `ViewController` por lo que queda el código mas limpio.

`ButtonView`: se creó este fichero donde contiene sólo la creación de botones con sus propiedades y constrains.

`LabelView`: se creó este fichero donde contiene sólo la creación de labels con sus propiedades y constrains; para las propiedades se hizo de 2 formas: una normal y otra con un diccionario que contiene una key 'el texto' y los atributos. 

`ImageView`: se creó este fichero donde contiene sólo la creación de imágenes con sus propiedades y constrains; para sus propiedades agregamos un borde circular que, si la imagen sobrepasa el circulo, esta se recorta ajustándose al diseño.