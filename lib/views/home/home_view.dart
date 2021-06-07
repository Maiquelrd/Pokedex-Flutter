import 'dart:convert';

import 'package:Pokedex/widgets/pokemon_card/funcionColor.dart';
import 'package:flutter/material.dart';
import 'package:Pokedex/pokemon.dart';
import 'package:Pokedex/widgets/centered_view/centered_view.dart';
import 'package:Pokedex/widgets/navigation_bar/navigation_bar.dart';
import 'package:Pokedex/widgets/pokemon_card/pokemon_card.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomeView> {
  var url = "https://pokeapi.co/api/v2/pokemon?limit=1000&offset=0";

  PokeHub pokeHub;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);
    pokeHub = PokeHub.fromJson(decodedJson);
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Column(
          children: <Widget>[
            NavigationBar(),
            SizedBox(height: 50),
            Expanded(
              child: pokeHub == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.count(
                      crossAxisCount: axisResponsive(screenWidth),
                      children: pokeHub.pokemon
                          .map((poke) => PokemonCard(
                                nombre: poke.name,
                                url: poke.url,
                              ))
                          .toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
