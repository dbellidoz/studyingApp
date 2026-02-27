import 'package:flutter/material.dart';

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

class _RecogedatostempoState extends State<Recogedatostempo> {
  int pagina = 1;

  void siguienteSlide() => setState(() => pagina++);
  void anteriorSlide() => setState(() => pagina--);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6, // 60% del ancho
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(228, 248, 244, 244),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: switch (pagina) {
        1 => _paginaWorking(),
        2 => _paginaResting(),
        _ => SizedBox(),
      },
    );
  }

  Widget _paginaWorking() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Tiempo de trabajo",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        TextField(
          controller: widget.horasWorking,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: "Horas"),
        ),
        TextField(
          controller: widget.minutosWorking,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: "Minutos"),
        ),
        TextField(
          controller: widget.segundosWorking,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: "Segundos"),
        ),
        SizedBox(height: 20),
        ElevatedButton(onPressed: siguienteSlide, child: Text("Siguiente")),
      ],
    );
  }

  Widget _paginaResting() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Tiempo de descanso",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        TextField(
          controller: widget.horasResting,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: "Horas"),
        ),
        TextField(
          controller: widget.minutosResting,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: "Minutos"),
        ),
        TextField(
          controller: widget.segundosResting,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: "Segundos"),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: anteriorSlide, child: Text("Anterior")),
            ElevatedButton(onPressed: widget.onStart, child: Text("Empezar")),
          ],
        ),
      ],
    );
  }
}
