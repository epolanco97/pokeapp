class PokemonSprites {
  String frontDefault;
  String frontShiny;
  String? frontFemale;
  String? frontShinyFemale;
  String backDefault;
  String backShiny;
  String? backFemale;
  String? backShinyFemale;

  PokemonSprites({
    required this.frontDefault,
    required this.frontShiny,
    this.frontFemale,
    this.frontShinyFemale,
    required this.backDefault,
    required this.backShiny,
    this.backFemale,
    this.backShinyFemale,
  });

  factory PokemonSprites.fromMap(Map<String, dynamic> json) => PokemonSprites(
        frontDefault: json['front_default'],
        frontShiny: json['front_shiny'],
        frontFemale: json['front_female'],
        frontShinyFemale: json['front_shiny_female'],
        backDefault: json['back_default'],
        backShiny: json['back_shiny'],
        backFemale: json['back_female'],
        backShinyFemale: json['back_shiny_female'],
      );

  Map<String, dynamic> toJson() => {
        'front_default': frontDefault,
        'front_shiny': frontShiny,
        'front_female': frontFemale,
        'front_shiny_female': frontShinyFemale,
        'back_default': backDefault,
        'back_shiny': backShiny,
        'back_female': backFemale,
        'back_shiny_female': backShinyFemale,
      };
}
