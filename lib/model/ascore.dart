final String tableScore = 'score';

class ScoreFields{
  static final List<String> values = [
    /// Add all fields
    id, aquiz, aiquiz, apuzzle, name,
  ];

  static final String id = '_id';
  static final String aquiz = 'aquiz';
  static final String aiquiz = 'aiquiz';
  static final String apuzzle = 'apuzzle';
  static final String name = 'name';
}

class Ascore{
    final int? id;
    final int aquiz;
    final int aiquiz;
    final int apuzzle;
    final String name;

    const Ascore({
      this.id,
      required this.aiquiz,
      required this.apuzzle,
      required this.aquiz,
      required this.name,
    });

    Ascore copy({
      int? id,
      int? aquiz,
      int? aiquiz,
      int? apuzzle,
      String? name,
    }) =>
        Ascore(
          id: id ?? this.id,
          aquiz: aquiz ?? this.aquiz,
          aiquiz: aiquiz ?? this.aiquiz,
          apuzzle: apuzzle ?? this.apuzzle,
          name: name ?? this.name,
        );

    static Ascore fromJson(Map<String, Object?> json) => Ascore(
      id: json[ScoreFields.id] as int?,
      aquiz: json[ScoreFields.aquiz] as int,
      aiquiz: json[ScoreFields.aiquiz] as int,
      apuzzle: json[ScoreFields.apuzzle] as int,
      name: json[ScoreFields.name] as String,
    );


    Map<String, Object?> toJson() => {
      ScoreFields.id: id,
      ScoreFields.aquiz: aquiz,
      ScoreFields.aiquiz: aiquiz,
      ScoreFields.apuzzle: apuzzle,
      ScoreFields.name: name,
    };


}