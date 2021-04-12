import 'package:flutter/material.dart';
import 'Pokemon.dart';
import 'PokemonBlock.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PokemonBloc _pokemonBloc = PokemonBloc();

  @override
  void dispose() {
    _pokemonBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pokemon App"),
        ),
        body: Container(
          child: StreamBuilder<List<Pokemon>>(
            stream: _pokemonBloc.pokemonListStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<Pokemon>> snapshot) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "${snapshot.data[index].id}",
                              style: TextStyle(fontSize: 20.0),
                            )),
                        Container(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data[index].type}",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Text(
                                  "${snapshot.data[index].moves}",
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            )
                            ),
                          Container(
                            child: IconButton(
                              icon: Icon(Icons.add_circle),
                              color: Colors.green,
                              onPressed: (){
                                _pokemonBloc.pokemonMoveIncrement.add(snapshot.data[index]);
                              },
                            ),
                          ),
                          Container(
                            child: IconButton(
                              icon: Icon(Icons.remove_circle),
                              color: Colors.red,
                              onPressed: (){
                                _pokemonBloc.pokemonMoveDecrement.add(snapshot.data[index]);
                                print(snapshot.data[index]);
                              },
                            ),
                          ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ));
  }
}
