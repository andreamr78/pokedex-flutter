abstract class PokemonDetailsResult{}

class DetailsSuccess<PokemonDetails> extends PokemonDetailsResult{
  DetailsSuccess({
    required this.result
  });
  PokemonDetails result;
}

class DetailsError extends PokemonDetailsResult{
  DetailsError({
    required this.error
  });
  String error;
}

class DetailsLoading extends PokemonDetailsResult{}