class PokemonListing {
  final int id;
  final String name;

  String get ImageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  const PokemonListing({required this.id, required this.name});

  factory PokemonListing.fromJson(Map<String, dynamic> json) {
    final url = json['url'] as String;
    return PokemonListing(
      name: json['name'],
      id: int.parse(url.split('/')[6]),
    );
  }
}

class PokemonPageResponse {
  final List<PokemonListing> pokemonListings;
  final bool canLoadNextPage;

  PokemonPageResponse(
      {required this.pokemonListings, required this.canLoadNextPage});

  factory PokemonPageResponse.fromJson(Map<String, dynamic> json) {
    return PokemonPageResponse(
      pokemonListings: (json['results'] as List)
          .map((listingJson) => PokemonListing.fromJson(listingJson))
          .toList(),
      canLoadNextPage: json['next'] != null,
    );
  }
}
