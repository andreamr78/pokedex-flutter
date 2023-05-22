import 'package:pokedex/bloc/pokemon_event.dart';
import 'package:pokedex/bloc/pokemon_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/repository/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonPageRequest>(_onpokemonRepository);
  }

  final _pokemonRepository = PokemonRepository();

  void _onpokemonRepository(
      PokemonPageRequest event, Emitter<PokemonState> emit) async {
    emit(PokemonLoadInProgress());
    try {
      final pokemonPageResponse =
          await _pokemonRepository.getPokemonPage(event.page);
      emit(PokemonPageLoadSuccess(
          pokemonListings: pokemonPageResponse.pokemonListings,
          canLoadNextPage: pokemonPageResponse.canLoadNextPage));
    } catch (e) {
      emit(PokemonPageLoadFail(error: e));
    }
  }
}
