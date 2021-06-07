import 'package:flutter/material.dart';
import 'package:Pokedex/evoluciones.dart';
import 'package:Pokedex/pokemon_detail.dart';
import 'package:Pokedex/widgets/pokemon_card/funcionColor.dart';

class PokemonDetail extends StatelessWidget {
  final PokeDetail pokemon;
  final Chain chain;

  PokemonDetail({this.pokemon, this.chain});

  bodyWidget(BuildContext context) => Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height / 1.3,
            width: MediaQuery.of(context).size.width - 320,
            left: 160.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 100.0,
                        ),
                        Text(
                          pokemon.name,
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text("ID:     ${pokemon.id.toString()}",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.normal)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "Altura:     ${getComa(pokemon.height.toString())}     m",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.normal)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "Peso:     ${getComa(pokemon.weight.toString())}     kg",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.normal)),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Tipo:",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: pokemon.types
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FilterChip(
                                      label: Text(
                                        traducir(e.type.name).capitalize(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      onSelected: (b) {},
                                      backgroundColor: getColor(e.type.name),
                                    ),
                                  ))
                              .toList(),
                        ),
                        Text("Evoluciones:",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 30.0,
                        ),
                        Column(children: PrintEvolutionChain(chain).toList())
                      ],
                    ),
                  ],
                )),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: pokemon.sprites.frontDefault,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(pokemon.sprites.frontDefault),
                  )),
                ),
              ))
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColor(pokemon.types[0].type.name),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: getColor(pokemon.types[0].type.name),
      ),
      body: bodyWidget(context),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
