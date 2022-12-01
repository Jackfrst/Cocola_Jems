import 'package:get/get.dart';

class All_score extends GetxController
    with GetTickerProviderStateMixin{
  late int quiz = 0;
  late int iquiz = 0;
  late int puzz = 0;

  quiza(int n){
    quiz = quiz + n;
  }

  iquiza(int n){
    iquiz += n;
  }

  puzza(int n){
    puzz += n;
  }
}