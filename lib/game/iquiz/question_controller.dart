import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../page/docoment/game1.dart';
import '../image_quiz/img_pre_score.dart';
import 'Questions.dart';


// We use get package for our state management

class IQuestionController extends GetxController
    with GetTickerProviderStateMixin {
  // Lets animated our progress bar


  late AnimationController _ianimationController;
  late Animation _ianimation;
  // so that we can access our animation outside
  Animation get ianimation => this._ianimation;

  late PageController _ipageController;
  PageController get ipageController => this._ipageController;

  final List<IQuestion> _iquestions = sample_data
      .map(
        (question) => IQuestion(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer_index: question['answer_index']),
      )
      .toList();
  List<IQuestion> get iquestions => this._iquestions;

  bool _iisAnswered = false;
  bool get iisAnswered => this._iisAnswered;

  int _icorrectAns = 0;
  int get icorrectAns => this._icorrectAns;

  late int _iselectedAns;
  int get iselectedAns => this._iselectedAns;

  // for more about obs please check documentation
  RxInt _iquestionNumber = 1.obs;
  RxInt get iquestionNumber => this._iquestionNumber;

  // int _questionNumber = 1;
  // int get questionNumber => this._questionNumber;

  int _inumOfCorrectAns = 0;
  int get inumOfCorrectAns => this._inumOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    _ianimationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _ianimation = Tween<double>(begin: 0, end: 1).animate(_ianimationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    _ianimationController.forward().whenComplete(inextQuestion);
    _ipageController = PageController();
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _ianimationController.dispose();
    _ipageController.dispose();
  }

  void icheckAns(IQuestion question, int selectedIndex) {
    // because once user press any option then it will run
    _iisAnswered = true;
    _icorrectAns = question.answer_index;
    _iselectedAns = selectedIndex;

    if (_icorrectAns == _iselectedAns) {
      _inumOfCorrectAns++;
    }

    // It will stop the counter
    _ianimationController.stop();
    update();

    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(seconds: 2), () {
      inextQuestion();
    });
  }

  void inextQuestion() {
    // if (_questionNumber.value != _questions.length) {
     if (_iquestionNumber != _iquestions.length) {
      _iisAnswered = false;
      _ipageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      _ianimationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      _ianimationController.forward().whenComplete(inextQuestion);
    }
    else {
      // Get package provide us simple way to naviigate another page
      Get.to(IPreScore());
    }
  }

  void iupdateTheQnNum(int index) {
    _iquestionNumber.value = index + 1;
    // _questionNumber = index + 1;
  }

  void ireset() {
    _inumOfCorrectAns = 0;
    _iselectedAns = 0;
    _icorrectAns = 0;
    _iisAnswered = false;
    _iquestionNumber.value =  1;
    _ianimationController.reset();
    Get.to(const Game1());
  }

  void icheckout(){
    ireset();
    onClose();
  }
}
