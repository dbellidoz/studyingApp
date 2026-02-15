import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miprimeraapp/widgets/animatedDigits.dart';
import 'package:miprimeraapp/widgets/stableCharacter.dart';

class MiCronometro extends StatefulWidget{
  @override
  _MiCronometroState createState() => _MiCronometroState();
}

class _MiCronometroState extends State<MiCronometro>{
  late Timer _timer; 
  int horas = 0;
  int minutos = 0;
  int segundos = 0;

  @override
  void initState() {
    super.initState();
    //print("initState llamado");
    ///Ejemplo de recurso que necesita ser cerrado
    iniciarTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //print("didChangeDependencies llamado");
  }

  @override
  void deactivate() {
    super.deactivate();
    //print("deactivated llamado");
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    //print("dispose llamado");
  }

  @override void didUpdateWidget(covariant MiCronometro oldWidget) {
    
    super.didUpdateWidget(oldWidget);
    //print("didUpdateWidget llamado");
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
          Center(child: 
            Row(
              spacing: 5,
              mainAxisSize: MainAxisSize.min,
              children: [
                Animateddigits(value: horas.toString().padLeft(2, '0')),
                StableCharacter(value: ':'),
                Animateddigits(value: minutos.toString().padLeft(2, '0')),
                StableCharacter(value: ':'),
                Animateddigits(value: segundos.toString().padLeft(2, '0')),
              ],
            ),
          ),
          //Text("${horas.toString().padLeft(2,'0')} : ${minutos.toString().padLeft(2,'0')} : ${segundos.toString().padLeft(2,'0')}"),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoButton(
                  child: Text("Parar"), 
                  onPressed: (){
                    _timer.cancel();
                  }
                ),
                CupertinoButton(
                  child: Text("Volver a 0"), 
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
          ),
          Center(
             child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoButton(
                  child: Text("Reiniciar"), 
                  onPressed: (){
                    _timer.cancel();
                    setState(() {
                      horas = 0;
                      minutos = 0;
                      segundos = 0;  
                    });
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
          ),
        ]
      
      )
    );
  }

  void iniciarCronometro(){
    setState(() {
      if (minutos >= 59){
        horas++;
        minutos = 0;
        segundos = 0;
      }else if (segundos >= 59){
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