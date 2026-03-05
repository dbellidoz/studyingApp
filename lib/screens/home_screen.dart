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
import 'package:miprimeraapp/widgets/to_doList.dart';

class MicontenedorCentrado extends StatefulWidget {
  @override
  _MicontenedorCentradoState createState() => _MicontenedorCentradoState();
}

class _MicontenedorCentradoState extends State<MicontenedorCentrado> {
  final TextEditingController _horasController = TextEditingController();
  final TextEditingController _minutosController = TextEditingController();
  final TextEditingController _segundosController = TextEditingController();

  final TextEditingController _horasRestingController = TextEditingController();
  final TextEditingController _minutosRestingController =
      TextEditingController();
  final TextEditingController _segundosRestingController =
      TextEditingController();

  int _horas = 0;
  int _minutos = 0;
  int _segundos = 0;
  int _horasResting = 0;
  int _minutosResting = 0;
  int _segundosResting = 0;
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // <-- clave: solo ocupa lo necesario
            children: [
              if (!_iniciado)
                Recogedatostempo(
                  horasWorking: _horasController,
                  minutosWorking: _minutosController,
                  segundosWorking: _segundosController,
                  horasResting: _horasRestingController,
                  minutosResting: _minutosRestingController,
                  segundosResting: _segundosRestingController,
                  onStart: () {
                    setState(() {
                      _horas = int.tryParse(_horasController.text) ?? 0;
                      _minutos = int.tryParse(_minutosController.text) ?? 0;
                      _segundos = int.tryParse(_segundosController.text) ?? 0;
                      _horasResting =
                          int.tryParse(_horasRestingController.text) ?? 0;
                      _minutosResting =
                          int.tryParse(_minutosRestingController.text) ?? 0;
                      _segundosResting =
                          int.tryParse(_segundosRestingController.text) ?? 0;
                      _iniciado = true;
                    });
                  },
                ),
              if (_iniciado)
                PomodoroTimerWidget(
                  workingHoras: _horas,
                  workingMinutos: _minutos,
                  workingSegundos: _segundos,
                  restingHoras: _horasResting,
                  restingMinutos: _minutosResting,
                  restingSegundos: _segundosResting,
                  veces: 2,
                  onEnd: () {
                    setState(() {
                      _iniciado = !_iniciado;
                    });
                  },
                ),
              SizedBox(
                width: 400, // ← ancho fijo razonable
                child: To_doList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
