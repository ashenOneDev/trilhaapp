import 'dart:math';

class GeradorNumeroAleatorioService {
  static int generateRandomNumber(int maxNumber) {
    Random ramdonNumber = Random();
    return ramdonNumber.nextInt(maxNumber);
  }
}
