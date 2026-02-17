/*import 'package:flutter/material.dart';
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
            //Expanded(child: MiContador()),
            Expanded(child: MiCronometro()),
            Expanded(child: To_doList())
          ],
        ),
      )
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:miprimeraapp/widgets/recogedatostempo.dart';
import 'package:miprimeraapp/widgets/pomodoroTimer.dart';

class MicontenedorCentrado extends StatefulWidget {
  @override
  _MicontenedorCentradoState createState() => _MicontenedorCentradoState();
}

class _MicontenedorCentradoState extends State<MicontenedorCentrado> {
  final TextEditingController _horasController = TextEditingController();
  final TextEditingController _minutosController = TextEditingController();
  final TextEditingController _segundosController = TextEditingController();

  int _horas = 0;
  int _minutos = 0;
  int _segundos = 0;
  bool _iniciado = false;

  @override
  void dispose() {
    _horasController.dispose();
    _minutosController.dispose();
    _segundosController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pomodoro"),
        backgroundColor: Color.fromARGB(255, 3, 26, 27),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Formulario a la izquierda
            if(!_iniciado)
            Expanded(
              child: Recogedatostempo(
                horas: _horasController,
                minutos: _minutosController,
                segundos: _segundosController,
                onStart: () {
                  setState(() {
                    _horas = int.tryParse(_horasController.text) ?? 0;
                    _minutos = int.tryParse(_minutosController.text) ?? 0;
                    _segundos = int.tryParse(_segundosController.text) ?? 0;
                    _iniciado = true;
                  });
                },
              ),
            ),
            SizedBox(width: 20),
            // Temporizador a la derecha
            if (_iniciado)
              Expanded(
                child: PomodoroTimerWidget(
                  workingHoras: _horas,
                  workingMinutos: _minutos,
                  workingSegundos: _segundos,
                  restingHoras: 0,
                  restingMinutos: 0,
                  restingSegundos: 5,
                  veces: 2,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
