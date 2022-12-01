import 'package:cocola_jems/game/iquiz/question_controller.dart';
import 'package:cocola_jems/game/quiz/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/color_utils.dart';
import 'Questions.dart';
import 'option.dart';

class IQuestionCard extends StatelessWidget {
  const IQuestionCard({
    // it means we have to pass this
    required this.iquestion,
  }) ;

  final IQuestion iquestion;

  @override
  Widget build(BuildContext context) {
    IQuestionController _controller = Get.put(IQuestionController());

    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            iquestion.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: kBlackColor),
          ),
          SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            iquestion.options.length,
                (index) => IOption(
              index: index,
              text: iquestion.options[index],
              press: () => _controller.icheckAns(iquestion, index),
            ),
          ),
        ],
      ),
    );
  }
}
