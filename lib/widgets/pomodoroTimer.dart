import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miprimeraapp/widgets/animatedDigits.dart';
import 'package:miprimeraapp/widgets/stableCharacter.dart';
import 'package:miprimeraapp/widgets/tempo.dart';

class PomodoroTimerWidget extends StatefulWidget {
    final int horas;
  final int minutos;
  final int segundos;

  const PomodoroTimerWidget({
    super.key, required this.horas, required this.minutos, required this.segundos
  }); 

  @override
  _PomodoroTimerWidgetState createState() => _PomodoroTimerWidgetState();
}

class _PomodoroTimerWidgetState extends State<PomodoroTimerWidget>{
  late Tempo temporizador;
  
  void initState(){
    super.initState();
    temporizador = Tempo(
      horas: widget.horas, 
      minutos: widget.minutos, 
      segundos: widget.segundos
    );
    temporizador.iniciarTemporizador(()=>setState(() {}));
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
      child:Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Animateddigits(value: temporizador.horas.toString().padLeft(2, '0')),
          StableCharacter(value: ':'),
          Animateddigits(value: temporizador.minutos.toString().padLeft(2, '0')),
          StableCharacter(value: ':'),
          Animateddigits(value: temporizador.segundos.toString().padLeft(2, '0')),
        ]
      )
     ) ;
  }




}