class Question {
  final int id, answer_index;
  final String question;
  final List<String> options;

  Question({required this.id, required this.question, required this.answer_index, required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "How many observing modes does The James Webb Space Telescope’s Mid-Infrared Instrument (MIRI) have?",
    "options": ['One', 'Three', 'Five', 'Four'],
    "answer_index": 3,
  },
  {
    "id": 2,
    "question": "When NASA’s James Webb Space Telescope captured its first images and spectra of Mars?",
    "options": ['Oct. 5', 'Aug. 24', 'Sept. 5', 'Nov. 24'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "Webb’s unique observation post nearly a million miles away at the _ a view of Mars’ observable disk.",
    "options": ['Sun-Earth Lagrange point 2 (L2)', 'Sun-Earth Lagrange point 4 (L2)', 'Sun-Earth Lagrange point 3(L3)', 'Sun-Earth Lagrange point 5(L5)'],
    "answer_index": 0,
  },
  {
    "id": 4,
    "question": "How far from earth Lagrange point 2 is located?",
    "options": ['2.5m km', '1.5m km', '3.5m km', '4.5m km'],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "Which country has contributed a scientific instrument and a guidance sensor for The JWST?",
    "options": ['USA', 'France', 'Canada', 'Australia'],
    "answer_index": 2,
  },
  {
    "id": 6,
    "question": "Which rocket launched James Webb Space Telescope?",
    "options": ['Ariane 4', 'Ariane 5', 'Apollo 11'	, 'Apollo 17'],
    "answer_index": 1,
  },
  {
    "id": 7,
    "question": "When was James Webb Space Telescope launched?",
    "options": ['20/12/21', '18/11/21', '20/11/21', '25/12/21'],
    "answer_index": 3,
  },
  {
    "id": 8,
    "question": "James Webb Space Telescope’s development was done by NASA in collaboration with ?",
    "options": ['European and Canadian', 'European and Indian', 'Canadian and Indian', 'Indian and Roscosmos'],
    "answer_index": 0,
  },
  {
    "id": 9,
    "question": "How much did the James Webb Space Telescope cost?",
    "options": ['USD 8.7 billion', 'USD 10 billion', 'USD 1 trillion', 'USD 39 million'],
    "answer_index": 1,
  },
  {
    "id": 10,
    "question": "What is the telescope’s primary mirror material?",
    "options": ['Beryllium coated with Gold', 'Aluminum', 'Metal', 'Iron'],
    "answer_index": 0,
  },
  {
    "id": 11,
    "question": "What is the mission duration of James Webb Space Telescope?",
    "options": ['15-20 years', '20-30 years', '5-10 years', '5-10 years'],
    "answer_index": 2,
  },
  {
    "id": 12,
    "question": "When the first images from James Webb Space Telescope were released?",
    "options": ['July 11, 2022	', 'July 1, 2022', 'July 4, 2022', 'July 9, 2022'],
    "answer_index": 0,
  },
];
