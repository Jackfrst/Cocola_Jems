import 'package:cocola_jems/game/quiz/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/color_utils.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3F4768), width: 3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) {
          return Stack(
            children: [
              // LayoutBuilder provide us the available space for the conatiner
              // constraints.maxWidth needed for our animation
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  // from 0 to 1 it takes 60s
                  width: constraints.maxWidth * controller.animation.value,
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${(controller.animation.value * 60).round()} sec"),
                      SvgPicture.asset("assets/icons/clock.svg"),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


// class ProgressBar extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         width: 0.75*MediaQuery.of(context).size.width,
//         height: 30,
//         decoration: BoxDecoration(
//           border: Border.all(color: Color(0xFF3F4768), width: 3),
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: GetBuilder<QuestionController>(
//           init: QuestionController(),
//           builder: (controller) {
//             return Stack(
//               children: [
//                 // LayoutBuilder provide us the available space for the conatiner
//                 // constraints.maxWidth needed for our animation
//                 LayoutBuilder(
//                   builder: (context, constraints) => Container(
//                     // from 0 to 1 it takes 60s
//                     width: constraints.maxWidth * controller.animation.value,
//                     decoration: BoxDecoration(
//                       gradient: kPrimaryGradient,
//                       borderRadius: BorderRadius.circular(50),
//                     ),
//                   ),
//                 ),
//                 Positioned.fill(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: kDefaultPadding / 2),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("${(controller.animation.value * 60).round()} sec",
//                           style: TextStyle(
//                             color: Colors.white,
//                             decoration: TextDecoration.none,
//                             fontSize: 0.04*MediaQuery.of(context).size.height
//                           ),
//                         ),
//                         SvgPicture.asset("assets/icon/clock.svg"),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
