import 'package:flutter/material.dart';
import 'package:pokedex/app_navigator.dart';
import 'package:pokedex/bloc/nav_cubit.dart';
import 'package:pokedex/bloc/pokemon_bloc.dart';
import 'package:pokedex/bloc/pokemon_details_cubit.dart';
import 'package:pokedex/bloc/pokemon_event.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/screens/pokedex_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    final pokemonDetailsCubit = PokemonDetailsCubit();
    return MaterialApp(
        title: 'Flutter Demo',
        theme: Theme.of(context).copyWith(
          primaryColor: Colors.red,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    PokemonBloc()..add(PokemonPageRequest(page: 0))),
                    BlocProvider(create: (context) => NavCubit(pokemonDetailsCubit: pokemonDetailsCubit)),
                    BlocProvider(create: (context) => pokemonDetailsCubit)
          ],
          child: const AppNavigator(),
        ));
  }
}
