class GameIndices {
  List<GameIndice> games;

  GameIndices({required this.games});

  factory GameIndices.fromMap(Map<String, dynamic> json) => GameIndices(
        games: List<GameIndice>.from(json['game_indices'].map((e) => GameIndice.fromMap(e))),
      );

  Map<String, dynamic> toJson() => {
        "game_indices": List<dynamic>.from(games.map((x) => x.toJson())),
      };
}

class GameIndice {
  int gameIndex;
  Version version;

  GameIndice({required this.gameIndex, required this.version});

  factory GameIndice.fromMap(Map<String, dynamic> json) => GameIndice(
        gameIndex: json['game_index'],
        version: Version.fromMap(json['version']),
      );

  Map<String, dynamic> toJson() => {
        "game_index": gameIndex,
        "version": version.toJson(),
      };
}

class Version {
  String name;

  Version({required this.name});

  factory Version.fromMap(Map<String, dynamic> json) => Version(name: json['name']);

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
