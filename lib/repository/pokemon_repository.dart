import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon_info_response.dart';
import 'package:pokedex/models/pokemon_response.dart';
import 'package:pokedex/models/pokemon_species_info_response.dart';

class PokemonRepository {
  static String baseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    final queryParameters = {
      'limit': '200',
      'offset': (pageIndex * 200).toString()
    };

    final uri = Uri.https(baseUrl, '/api/v2/pokemon', queryParameters);
    final response = await client.get(uri);
    final json = jsonDecode(response.body);
    return PokemonPageResponse.fromJson(json);
  }

  Future<PokemonInfoResponse> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$pokemonId');

    // try {
    final response = await client.get(uri);
    final json = jsonDecode(response.body);
    return PokemonInfoResponse.fromJson(json);
    // } catch (e) {
    //   print(e);
    // }
  }

  Future<PokemonInfoSpeciesResponse> getPokemonSpeciesInfo(
      int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon-species/$pokemonId');

    // try {
    final response = await client.get(uri);
    final json = jsonDecode(response.body);
    return PokemonInfoSpeciesResponse.fromJson(json);
    // } catch (e) {
    //   print(e);
    // }
    // return 0;
  }
}
