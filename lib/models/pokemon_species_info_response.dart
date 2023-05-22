class PokemonInfoSpeciesResponse {
  final String description;

  PokemonInfoSpeciesResponse({required this.description});

  factory PokemonInfoSpeciesResponse.fromJson(Map<String, dynamic> json) {
    return PokemonInfoSpeciesResponse(
        description: json['flavor_text_entries'][0]['flavor_text']);
  }
}
