import 'dart:async';
import 'dart:ui';

class Tempo {
  int horas = 0;
  int minutos = 0; 
  int segundos = 0;
  late Timer _timer;
  late int _totalSegundos;
  bool isFinished = false;

  Tempo({
    required this.horas, required this.minutos, required this.segundos
  });

  void iniciarTemporizador(VoidCallback onTick){
    _totalSegundos = _segundosTotales();
    _timer = Timer.periodic(Duration(seconds: 1), (t){
        _accionTemporizador();
        onTick();
      }
       
    );
  }

  void _detenerTemporizador(){
    _timer.cancel();
  }

  int _segundosTotales(){
    return this.horas * 3600 + this.minutos * 60 + this.segundos;
  }

  bool _accionTemporizador(){
      _totalSegundos--;
      if(_totalSegundos <= 0){
        segundos = 0;
        _detenerTemporizador();
        isFinished = true;
        return isFinished;
      }else{
        horas = _totalSegundos ~/ 3600;
        minutos = (_totalSegundos %3600) ~/60;
        segundos = _totalSegundos % 60;
      }
      return isFinished;
  }


}
