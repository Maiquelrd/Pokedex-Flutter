import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:Pokedex/evoluciones.dart';
import 'package:Pokedex/pokemon_detail.dart';
import 'package:http/http.dart' as http;
import 'package:Pokedex/species.dart';
import 'package:Pokedex/widgets/pokemon_card/funcionColor.dart';
import 'package:Pokedex/widgets/pokemon_detail/pokemon_detail.dart';

class PokemonCard extends StatefulWidget {
  final String nombre;
  final String url;
  const PokemonCard({Key key, this.nombre, this.url}) : super(key: key);
  @override
  PokeCardState createState() {
    return new PokeCardState();
  }
}

class PokeCardState extends State<PokemonCard> {
  PokeDetail pokeDetail;
  PokEvolution pokEvolution;
  PokeSpecie pokespecie;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  bool cargo = false;

  fetchData() async {
    var res = await http.get(widget.url);
    var decodedJson2 = jsonDecode(res.body);
    pokeDetail = PokeDetail.fromJson(decodedJson2);
    fetchData2();

    if (this.mounted) {
      setState(() {});
    }
    cargo = true;
  }

  fetchData2() async {
    var res = await http.get(pokeDetail.species.url);
    var decodedJson3 = jsonDecode(res.body);
    pokespecie = PokeSpecie.fromJson(decodedJson3);
    if (pokespecie.evolutionChain.url != null) {
      fetchData3();
    }
  }

  fetchData3() async {
    var res = await http.get(pokespecie.evolutionChain.url);
    var decodedJson4 = jsonDecode(res.body);
    pokEvolution = PokEvolution.fromJson(decodedJson4);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: SizedBox(
          height: 180,
          width: 180,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PokemonDetail(
                            pokemon: pokeDetail,
                            evolution: pokEvolution,
                          )));
              print(pokespecie.evolutionChain.url);
              print(pokEvolution.chain.species.name);
            },
            child: Material(
              borderRadius: BorderRadius.circular(24.0),
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if (cargo) {
                    return Hero(
                      tag:
                          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/" +
                              pokeDetail.id.toString() +
                              ".png",
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: tieneTipos(pokeDetail.types.length)
                                    ? [
                                        pokeDetail.types[0].type.name != null
                                            ? getColor(
                                                pokeDetail.types[0].type.name)
                                            : Colors.white,
                                        pokeDetail.types[1].type.name != null
                                            ? getColor(
                                                pokeDetail.types[1].type.name)
                                            : Colors.white
                                      ]
                                    : [
                                        pokeDetail.types[0].type.name != null
                                            ? getColor(
                                                pokeDetail.types[0].type.name)
                                            : Colors.white,
                                        pokeDetail.types[0].type.name != null
                                            ? getColor(
                                                pokeDetail.types[0].type.name)
                                            : Colors.white
                                      ])),
                        child: Stack(
                          children: [
                            Center(
                                child: SizedBox(
                              child: pokeDetail == null
                                  ? Text("Cargando")
                                  : Image.network(
                                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/" +
                                          pokeDetail.id.toString() +
                                          ".png",
                                      height: 100,
                                      width: 150,
                                      fit: BoxFit.fitWidth,
                                    ),
                            )),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                widget.nombre,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          )),
    );
  }
}
