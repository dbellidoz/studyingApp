
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miprimeraapp/screens/home_screen.dart';

void main() {
  runApp(MyApp()); // Ejecuta la app
}

///StatelessWidget: indica que no camobia nada por sí mismo después de construirse 
///StatefulWidget: indica que puede cambiar como un contador, un texto que aparece y desaparece
/// actualizar UI con datos,...
class MyApp extends StatelessWidget {

  ///Sobreescribir el método del padre
  ///build -> es el método obligatorio que devuelve los widgets que se van
  ///a mostrar en pantalla
  ///context-> es un objeto que contiene información sobre la ubicación del 
  ///widget en el arbol del widgets. Se puede usar para:
  ///   - Acceder a temas y estilos (Theme.of(context))
  ///   - Acceder a otros widgets padre como Provider
  ///   - Navegar a otra pantalla (Navigator.of(context))
  @override
  Widget build(BuildContext context) {
    ///MateriaLApp -> es un widget que envuelve toda la app. Proporciona:
    ///   - Tema de la app (theme)
    ///   - Pantalla inicial(home)
    ///   - Navegación entre pantallas (routes)
    ///   - Soporte para cosas de Material Design (botones, app bars, snackbars)
    return MaterialApp(
      ///Scaffold -> es el esqueleto principal de la pantalla. Permite definir las
      ///partes principales de la pantalla de una app como:
      /// - Barra superior (appBar)
      /// - Cuerpo (body)
      /// - Botones flotantes (floatingActionButton)
      /// - Menú lateral (drawer)
      /// - Barra inferior de navegación (bottomNavigationBar)
      /// - Color de fondo de pantalla (backgroundColor)
      /// - Panel inferior que aparece encima del body (bottomSheet)
      /// - Si la pantalla se ajusta al teclado al aparecer (resizeToAvoidBottomInset)
      /// - ...
      /*home: Scaffold(
        appBar: AppBar(
          title: Text('Mi Primera App'),
          backgroundColor: Color.fromARGB(255, 13, 214, 221),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hola, Daniel'),
              Text('Bienvenido a Flutter'),
            ],
          ),
        ),
      ),*/
      home: MicontenedorCentrado(),
    );
  }
}


