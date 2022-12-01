import 'package:cocola_jems/game/iquiz/question_controller.dart';
import 'package:cocola_jems/game/quiz/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../utils/color_utils.dart';

class IOption extends StatelessWidget {
  const IOption({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  });
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IQuestionController>(
        init: IQuestionController(),
        builder: (IqnController) {
          Color getTheRightColor() {
            if (IqnController.iisAnswered) {
              if (index == IqnController.icorrectAns) {
                return Colors.green;
              } else if (index == IqnController.iselectedAns &&
                  IqnController.iselectedAns != IqnController.icorrectAns) {
                return kRedColor;
              }
            }
            return Colors.black;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRightColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${index + 1}",
                    style: TextStyle(color: getTheRightColor(), fontSize: 16),
                  ),
                  Image.asset(text,
                      height: .16*MediaQuery.of(context).size.height,
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: getTheRightColor() == kGrayColor
                          ? Colors.transparent
                          : getTheRightColor(),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: getTheRightColor()),
                    ),
                    child: getTheRightColor() == kGrayColor
                        ? null
                        : Icon(getTheRightIcon(), size: 16),
                  )
                ],
              ),
            ),
          );
        });
  }
}
