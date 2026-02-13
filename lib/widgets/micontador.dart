import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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