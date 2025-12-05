import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

class MicontenedorCentrado extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("contador"),
        backgroundColor: Color.fromARGB(255, 13, 214, 221),
      ),
      body: Center(
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MiContador(),
            MiCronomero()
          ],
        ),
      )
    );
  }
}




///Seria la carcasa, un elemento de la página cuyo UI se puede cambia
/// pero no hace nada
class MiContador extends StatefulWidget{
  ///flutter necesita saber qué clase contiene el estado de este widget
  ///MiContador() --> llamar a createState --> _MiContadorState() <-- esto crea la parte que si guarda variables y cambia
  @override
  _MiContadorState createState() => _MiContadorState();
}

///Se declara la parte que guarda valores de Statefulwidget MiContador
class _MiContadorState extends State<MiContador>{
  int contador = 0;


  //Este método se ejecuta cada vez que flutter tiene que imprimir algo de la UI
  @override
  Widget build(BuildContext context) {
    print("build llamado");
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Contador: $contador",
              style: GoogleFonts.lato(),
            ),
            SizedBox(height: 20),
            Text("Aqui podrían ir más widgets"),
            CupertinoButton(
              child: Icon(Icons.add), 
              onPressed: () {
                setState(() {
                  contador++;
                });
              })
          ],
        );
      
  }

}

class MiCronomero extends StatefulWidget{
  @override
  _MiCronometroState createState() => _MiCronometroState();
}

class _MiCronometroState extends State<MiCronomero>{
  late Timer _timer; 
  int horas = 0;
  int minutos = 0;
  int segundos = 0;

  @override
  void initState() {
    super.initState();
    print("initState llamado");
    ///Ejemplo de recurso que necesita ser cerrado
    iniciarTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies llamado");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivated llamado");
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    print("dispose llamado");
  }

  @override void didUpdateWidget(covariant MiCronomero oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget llamado");
  }

  @override 
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(228, 248, 244, 244),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.brown,
            blurRadius: 8,
            offset: Offset(0, 4)
          )
        ]
      ),
      child:Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text("El tiempo: "),
          Row(children: [
            AnimatedSwitcher(
                duration: Duration(microseconds: 900),
                transitionBuilder: (Widget child, Animation<double> animation){
                  return SlideTransition(
                    position: Tween(
                      begin: Offset(0, -3),
                      end: Offset(0, 0),
                    ).animate(animation),
                    child: child,
                  );
                },
                child: Text(
                  "${segundos.toString().padLeft(2,'0')}",
                  key: ValueKey<int>(segundos),
                  style: GoogleFonts.lato(
                    fontSize: 32
                  ),
                ),
              )
          ],),
          Text("${horas.toString().padLeft(2,'0')} : ${minutos.toString().padLeft(2,'0')} : ${segundos.toString().padLeft(2,'0')}"),
          Row(
            children: [
              CupertinoButton(
                child: Text("Parar"), 
                onPressed: (){
                   _timer.cancel();
                }
              ),
              CupertinoButton(
                child: Text("volver a 0"), 
                onPressed: (){
                  _timer.cancel();
                  setState(() {
                    horas = 0;
                    minutos = 0;
                    segundos = 0;  
                  });
                  
                })
            ],
          ),
          Row(
            children: [
              CupertinoButton(
                child: Text("Reiniciar"), 
                onPressed: (){
                  _timer.cancel();
                  _timer = Timer.periodic(Duration(seconds: 1), (t) => iniciarCronometro());

                }),
                CupertinoButton(
                  child: Text("Empezar"),
                  onPressed: () {
                    _timer.cancel();
                    iniciarTimer();
                  },
                )
            ],
          )
        ]
      
      )
    );
  }

  void iniciarCronometro(){
    setState(() {
      if (minutos > 59){
        horas++;
        minutos = 0;
        segundos = 0;
      }else if (segundos > 59){
        minutos++;
        segundos = 0;
      }else{
        segundos++;
      }  
    });
  }

  void iniciarTimer(){
      _timer = Timer.periodic(Duration(seconds: 1), (t){
      print("Timer ejecutándose");
      iniciarCronometro();

    });
  }

}


