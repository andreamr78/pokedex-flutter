import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_details_state.dart';
import 'package:pokedex/bloc/pokemon_state.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/models/pokemon_info_response.dart';
import 'package:pokedex/models/pokemon_species_info_response.dart';

import '../repository/pokemon_repository.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailsResult> {
  final _pokemonRepository  = PokemonRepository();
  PokemonDetailsCubit() : super(DetailsLoading());

  void getPokemonDetails(int pokemonId) async {
    final response = await Future.wait([
      _pokemonRepository.getPokemonInfo(pokemonId),
      _pokemonRepository.getPokemonSpeciesInfo(pokemonId)
    ]);

    final pokemonInfo = response[0] as PokemonInfoResponse;
    final speciesInfo = response[1] as PokemonInfoSpeciesResponse;

    emit(DetailsSuccess(result: 
      PokemonDetails(
      id: pokemonInfo.id,
      name: pokemonInfo.name, 
      imageUrl: pokemonInfo.imageUrl, 
      types: pokemonInfo.types, 
      height: pokemonInfo.weight, 
      weight: pokemonInfo.weight, 
      description: speciesInfo.description,
    )
    ));
  }

  void clearPokemonDetails() => emit(DetailsLoading());
}
