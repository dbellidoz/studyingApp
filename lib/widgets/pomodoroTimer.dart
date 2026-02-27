import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miprimeraapp/widgets/animatedDigits.dart';
import 'package:miprimeraapp/widgets/stableCharacter.dart';
import 'package:miprimeraapp/widgets/tempo.dart';

// ignore: must_be_immutable
class PomodoroTimerWidget extends StatefulWidget {
  final int workingHoras;
  final int workingMinutos;
  final int workingSegundos;
  final int restingHoras;
  final int restingMinutos;
  final int restingSegundos;
  int veces;
  final VoidCallback onEnd;
  bool working = true;

  PomodoroTimerWidget({
    super.key,
    required this.workingHoras,
    required this.workingMinutos,
    required this.workingSegundos,
    required this.restingHoras,
    required this.restingMinutos,
    required this.restingSegundos,
    required this.veces,
    required this.onEnd
  });

  @override
  _PomodoroTimerWidgetState createState() => _PomodoroTimerWidgetState();
}

class _PomodoroTimerWidgetState extends State<PomodoroTimerWidget> {
  late Tempo temporizador;

  void initState() {
    super.initState();
    if (widget.working) {
      print("pasamos a working");
      startTempo(
        widget.workingHoras,
        widget.workingMinutos,
        widget.workingSegundos,
      );
    } else {
      print("pasamos a resting");
      startTempo(
        widget.restingHoras,
        widget.restingMinutos,
        widget.restingSegundos,
      );
    }
  }

  void startTempo(int horas, int minutos, int segundos) {
    temporizador = Tempo(horas: horas, minutos: minutos, segundos: segundos);
    temporizador.iniciarTemporizador(() { 
      setState(() {});
      if (temporizador.isFinished) {
        if (widget.veces > 0) {
          widget.veces--;
          widget.working = !widget.working;
          if (widget.working) {
            startTempo(
              widget.workingHoras,
              widget.workingMinutos,
              widget.workingSegundos,
            );
          }else{
              startTempo(widget.restingHoras, widget.restingMinutos, widget.restingSegundos);
          }
        }else{
          widget.onEnd();
        }
      }
  });
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
            color: switch (widget.working) {
            true => Colors.red,
            false => Colors.green,
            //null => Colors.black12
          },
            blurRadius: 8, 
            offset: Offset(0, 4)
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Animateddigits(
            value: temporizador.horas.toString().padLeft(2, '0'),
            working: widget.working,
          ),
          StableCharacter(value: ':'),
          Animateddigits(
            value: temporizador.minutos.toString().padLeft(2, '0'),
            working: widget.working,
          ),
          StableCharacter(value: ':'),
          Animateddigits(
            value: temporizador.segundos.toString().padLeft(2, '0'),
            working: widget.working,
          ),
        ],
      ),
    );
  }
}
