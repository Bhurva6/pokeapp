import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokeapp/pokemon.dart';
import 'package:pokeapp/pokemondetail.dart';

void main() => runApp(MaterialApp(
      title: "Poke App",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  Future<List<PokeHub>> fetchData() async {
    PokeHub? pokeHub;
    List<PokeHub> pokehublist = [];
    var res = await http.get(Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"));
    var decodedJson = jsonDecode(res.body);
    print(decodedJson);

    for (var data in decodedJson["pokemon"] as List) {
      pokeHub = PokeHub.fromJson(data);
      pokehublist.add(pokeHub!);
    }

    return pokehublist;
  }

  @override
  Widget build(BuildContext context) {
    var pokeHub;
    return Scaffold(
        appBar: AppBar(
          title: Text("PokeApp"),
          backgroundColor: Colors.cyan,
        ),
        body: FutureBuilder<List<PokeHub>>(
          future: fetchData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                {
                  return GridView.count(
                    crossAxisCount: 2,
                    children: pokeHub.pokemon
                        .map((poke) => Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PokeDetail(
                                                pokemon: poke,
                                              )));
                                },
                                child: Hero(
                                  tag: poke.img,
                                  child: Card(
                                    elevation: 3.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image:
                                                      NetworkImage(poke.img))),
                                        ),
                                        Text(
                                          poke.name,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  );
                }
              case ConnectionState.none:
                {
                  return (Center(
                    child: Text("No data available"),
                  ));
                }
              case ConnectionState.waiting:
                {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              case ConnectionState.active:
                // TODO: Handle this case.

                break;
            }
            return Center(
              child: Text(""),
            );
          },
        ));
  }
}
