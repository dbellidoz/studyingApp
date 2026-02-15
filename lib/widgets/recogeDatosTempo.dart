import 'package:flutter/material.dart';

class Recogedatostempo extends StatelessWidget {
  final TextEditingController horas;
  final TextEditingController minutos;
  final TextEditingController segundos;

  final VoidCallback onStart;

  Recogedatostempo({
    required this.horas,
    required this.minutos,
    required this.segundos,
    required this.onStart
  });
  
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
            color: Colors.black,
            blurRadius: 8,
            offset: Offset(0, 4)
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: TextField(
            controller: horas,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Horas"),
            )), 
            Expanded(child:TextField(
              controller: minutos,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Minutos"),
            )),
            Expanded(child:TextField(
              controller: segundos,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Segundos"),
            )),
            SizedBox(height: 20),
            ElevatedButton(onPressed: onStart, child: Text("Empezar"))
        ]
      )
    );
  }

  


}