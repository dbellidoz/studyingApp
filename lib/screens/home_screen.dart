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
import 'package:flutter_svg/flutter_svg.dart';

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
  final TextEditingController _vecesController = TextEditingController();

  int _horas = 0;
  int _minutos = 0;
  int _segundos = 0;
  int _horasResting = 0;
  int _minutosResting = 0;
  int _segundosResting = 0;
  int _veces = 1;
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
      /*appBar: AppBar(
        title: Text("Pomodoro"),
        backgroundColor: Color.fromARGB(255, 3, 26, 27),
      ),*/
      body: LayoutBuilder(
        builder: (context, constraints) {
          final esAncha = constraints.maxWidth > 1050; // ← umbral de ancho

          final logo = Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SvgPicture.asset(
              'assets/images/logo_pomotime.svg',
              height: 160,
              fit: BoxFit.contain,
            ),
          );

          final pomodoro = ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 300, // ← alto mínimo
              maxWidth: esAncha ? 600 : double.infinity, // ← ancho máximo
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!_iniciado)
                  Recogedatostempo(
                    horasWorking: _horasController,
                    minutosWorking: _minutosController,
                    segundosWorking: _segundosController,
                    horasResting: _horasRestingController,
                    minutosResting: _minutosRestingController,
                    segundosResting: _segundosRestingController,
                    veces: _vecesController,
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
                        _veces = int.tryParse(_vecesController.text) ?? 0;
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
                    veces: _veces,
                    onEnd: () {
                      setState(() {
                        _iniciado = !_iniciado;
                      });
                    },
                  ),
              ],
            ),
          );

          final todoList = ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 300,
              maxWidth: esAncha ? 400 : double.infinity,
            ),
            child: SizedBox(
              width: esAncha ? 400 : double.infinity,
              child: To_doList(),
            ),
          );

          return SingleChildScrollView(
            child: Center(
              // ← añade esto
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  logo,
                  if (esAncha)
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // ← centra la fila
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [pomodoro, todoList],
                    )
                  else
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [pomodoro, todoList],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
