class IQuestion {
  final int id, answer_index;
  final String question;
  final List<String> options;

  IQuestion({required this.id, required this.question, required this.answer_index, required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "Which Picture is taken by 'Jems Web Space Telescope' ?",
    "options": ["assets/q_img/1_1.jpg", "assets/q_img/1_2.jpg"],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "Which Picture is taken by 'Jems Web Space Telescope' ?",
    "options": ["assets/q_img/2_1.jpg", "assets/q_img/2_2.jpg"],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "Which Picture is taken by 'Jems Web Space Telescope' ?",
    "options": ["assets/q_img/3_1.jpg", "assets/q_img/3_2.jpg"],
    "answer_index": 0,
  },
  {
    "id": 5,
    "question": "Which Picture is taken by 'Jems Web Space Telescope' ?",
    "options": ["assets/q_img/5_1.jpg", "assets/q_img/5_2.jpg"],
    "answer_index": 0,
  },
];
