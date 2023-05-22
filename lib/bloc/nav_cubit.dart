import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_details_cubit.dart';

class NavCubit extends Cubit<int> {
  PokemonDetailsCubit pokemonDetailsCubit;
  NavCubit({required this.pokemonDetailsCubit}) : super(0);

  void showPokemonDetails(int pokeId) {
    pokemonDetailsCubit.getPokemonDetails(pokeId);
    emit(pokeId);
  }

  void popToPokedex() {
    emit(0);
    pokemonDetailsCubit.clearPokemonDetails();
  }
}
