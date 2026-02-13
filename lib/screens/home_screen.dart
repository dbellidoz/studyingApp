import 'package:flutter/material.dart';
import 'package:miprimeraapp/widgets/micontador.dart';
import 'package:miprimeraapp/widgets/micronometro.dart';
import 'package:miprimeraapp/widgets/to_doList.dart';

class MicontenedorCentrado extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("contador"),
        backgroundColor: Color.fromARGB(255, 3, 26, 27),
      ),
      body: Center(
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: MiContador()),
            Expanded(child: MiCronometro()),
            Expanded(child: To_doList())
          ],
        ),
      )
    );
  }
}