class GameIndices {
  List<GameIndice> games;

  GameIndices({required this.games});

  factory GameIndices.fromMap(Map<String, dynamic> json) => GameIndices(
        games: List<GameIndice>.from(json['game_indices'].map((e) => GameIndice.fromMap(e))),
      );
}

class GameIndice {
  int gameIndex;
  Version version;

  GameIndice({required this.gameIndex, required this.version});

  factory GameIndice.fromMap(Map<String, dynamic> json) => GameIndice(
        gameIndex: json['game_index'],
        version: Version.fromMap(json['version']),
      );
}

class Version {
  String name;

  Version({required this.name});

  factory Version.fromMap(Map<String, dynamic> json) => Version(name: json['name']);
}
