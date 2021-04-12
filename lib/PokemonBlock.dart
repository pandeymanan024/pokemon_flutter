import 'dart:async';
import 'Pokemon.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class PokemonBloc {

  List<Pokemon> _pokemonList = [
    Pokemon(1, 'Pokemon Type One', 10),
    Pokemon(2, 'Pokemon Type Two', 20),
    Pokemon(3, 'Pokemon Type Three', 30),
    Pokemon(4, 'Pokemon Type Four', 40),
    Pokemon(5, 'Pokemon Type Five', 50),
  ];

  final _pokemonListStreamController = StreamController<List<Pokemon>>();
  final _pokemonMoveIncrementStreamController = StreamController<Pokemon>();
  final _pokemonMoveDecrementStreamController = StreamController<Pokemon>();

  Stream<List<Pokemon>> get pokemonListStream => _pokemonListStreamController.stream;
  StreamSink<List<Pokemon>> get pokemonListSink => _pokemonListStreamController.sink;

  StreamSink<Pokemon> get pokemonMoveIncrement => _pokemonMoveIncrementStreamController.sink;
  StreamSink<Pokemon> get pokemonMoveDecrement => _pokemonMoveDecrementStreamController.sink;

  PokemonBloc(){
    _pokemonListStreamController.add(_pokemonList);

    _pokemonMoveIncrementStreamController.stream.listen(_incrementMove);
    _pokemonMoveDecrementStreamController.stream.listen(_decrementMove);

  }

  _incrementMove(Pokemon pokemon){
    int move = pokemon.moves;
    int incrementedMove = 1;
    _pokemonList[pokemon.id-1].moves += incrementedMove;
    pokemonListSink.add(_pokemonList);
  }

  _decrementMove(Pokemon pokemon){
    int move = pokemon.moves;
    int decrementedMove = 1;
    _pokemonList[pokemon.id-1].moves -= decrementedMove;
    pokemonListSink.add(_pokemonList);
  }

  void dispose(){
    _pokemonMoveIncrementStreamController.close();
    _pokemonMoveDecrementStreamController.close();
    _pokemonListStreamController.close();
  }


}

//Pokemon
//Move