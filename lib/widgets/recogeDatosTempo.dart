import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Recogedatostempo extends StatefulWidget {
  final TextEditingController horasWorking;
  final TextEditingController minutosWorking;
  final TextEditingController segundosWorking;
  final TextEditingController horasResting;
  final TextEditingController minutosResting;
  final TextEditingController segundosResting;

  final VoidCallback onStart;

  

  Recogedatostempo({
    super.key, 
    required this.horasWorking,
    required this.minutosWorking,
    required this.segundosWorking,
    required this.horasResting,
    required this.minutosResting,
    required this.segundosResting,
    required this.onStart,
  });
  @override
  _RecogedatostempoState createState() => _RecogedatostempoState();
}

@override
class _RecogedatostempoState extends State<Recogedatostempo> {

  int pagina = 1;
  void siguienteSlide() {
    setState(() => pagina++); 
  }

  void anteriorSlide() {
    setState(() => pagina--);
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
          BoxShadow(color: Colors.black, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (pagina <= 1) ...[
            Expanded(
              child: TextField(
                controller: widget.horasWorking,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Horas"),
              ),
            ),
            Expanded(
              child: TextField(
                controller: widget.minutosWorking,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Minutos"),
              ),
            ),
            Expanded(
              child: TextField(
                controller: widget.segundosWorking,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Segundos"),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: siguienteSlide, child: Text("Siguiente")),
          ],
          if (pagina == 2) ...[
            Expanded(
              child: TextField(
                controller: widget.horasResting,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Horas"),
              ),
            ),
            Expanded(
              child: TextField(
                controller: widget.minutosResting,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Minutos"),
              ),
            ),
            Expanded(
              child: TextField(
                controller: widget.segundosResting,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Segundos"),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: anteriorSlide, child: Text("Anterior")),
            ElevatedButton(onPressed: widget.onStart, child: Text("Empezar")),
          ]
        ],
      ),
    );
  }
}
