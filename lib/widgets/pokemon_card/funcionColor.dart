import 'package:flutter/material.dart';
import 'package:Pokedex/evoluciones.dart';
import 'package:Pokedex/widgets/evoluciones_card/evoluciones_card.dart';

Color getColor(String tipo) {
  if (tipo == "normal") return Colors.brown;
  if (tipo == "fighting") return Colors.red;
  if (tipo == "flying") return Colors.indigo;
  if (tipo == "poison") return Colors.deepPurpleAccent;
  if (tipo == "ground") return Color(0xffbb6528);
  if (tipo == "rock") return Color(0xff888f3b);
  if (tipo == "bug") return Color(0xff73a82f);
  if (tipo == "ghost") return Color(0xff8c7bbf);
  if (tipo == "steel") return Colors.grey;
  if (tipo == "fire") return Colors.deepOrangeAccent;
  if (tipo == "water") return Colors.blue;
  if (tipo == "grass") return Colors.green;
  if (tipo == "electric") return Colors.yellow;
  if (tipo == "psychic") return Color(0xffffa59e);
  if (tipo == "ice") return Colors.blueAccent;
  if (tipo == "dragon") return Color(0xff5c5cb1);
  if (tipo == "dark") return Color(0xff3d1f1d);
  if (tipo == "fairy") return Colors.pink;

  return Colors.white;
}

String traducir(String tipo) {
  if (tipo == "normal") return "normal";
  if (tipo == "fighting") return "luchador";
  if (tipo == "flying") return "volador";
  if (tipo == "poison") return "veneno";
  if (tipo == "ground") return "tierra";
  if (tipo == "rock") return "roca";
  if (tipo == "bug") return "bicho";
  if (tipo == "ghost") return "fantasma";
  if (tipo == "steel") return "acero";
  if (tipo == "fire") return "fuego";
  if (tipo == "water") return "agua";
  if (tipo == "grass") return "planta";
  if (tipo == "electric") return "electrico";
  if (tipo == "psychic") return "psiquico";
  if (tipo == "ice") return "hielo";
  if (tipo == "dragon") return "dragon";
  if (tipo == "dark") return "oscuro";
  if (tipo == "fairy") return "hada";

  return "wtf";
}

bool tieneTipos(int i) {
  if (i > 1) return true;
  return false;
}

int axisResponsive(double screen) {
  if (screen > 2400) return 9;
  if (screen > 2100) return 8;
  if (screen > 1800) return 7;
  if (screen > 1500) return 6;
  if (screen > 1200) return 5;
  if (screen > 900) return 4;
  if (screen > 600) return 3;
  if (screen > 300) return 2;
  if (screen > 100) return 1;
  return 5;
}

String getComa(String a) {
  int len = a.length;
  if (len < 2) {
    return (a.substring(0, len - 1) + "0," + a.substring(len - 1, len));
  } else {
    return (a.substring(0, len - 1) + "," + a.substring(len - 1, len));
  }
}

List<Row> PrintEvolutionChain(Chain chain) {
  List<Row> res = <Row>[];
  Row res2 = Row();
  List<List<String>> pokemons = <List<String>>[];
  List<String> pokemonsTemp = <String>[];
  List<Widget> widget = <Widget>[];

  if (chain.evolvesTo.length == 0) {
    pokemonsTemp.add(chain.species.name);
    pokemons.add(List.from(pokemonsTemp));
  } else {
    chain.evolvesTo.forEach((element) => {
          pokemonsTemp.add(chain.species.name),
          PrintPreorder(element, pokemons, pokemonsTemp)
        });
  }

  pokemons.forEach((chain) {
    chain.forEach((pokemon) {
      widget.add(new EvolucionCard(
        pokemonName: pokemon,
      ));
    });
    List<Widget> widgetTemp = List.from(widget);
    widget.clear();

    res2 = new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgetTemp,
    );
    res.add(res2);
  });
  return res;
}

void PrintPreorder(
    EvolvesTo pokemon, List<List<String>> pokemons, List<String> pokemonsTemp) {
  pokemonsTemp.add(pokemon.species.name);
  if (pokemon == null || pokemon.evolvesTo.length == 0) {
    pokemons.add(List.from(pokemonsTemp));
    pokemonsTemp.clear();
    return;
  }
  if (pokemon.evolvesTo.length == 1) {
    pokemon.evolvesTo
        .forEach((element) => PrintPreorder(element, pokemons, pokemonsTemp));
  } else if (pokemon.evolvesTo.length > 1) {
    List<String> pokemonsTempTemp = List.from(pokemonsTemp);
    print(pokemonsTempTemp);
    pokemon.evolvesTo.forEach((element) => {
          if (pokemonsTemp.length == 0)
            pokemonsTemp = List.from(pokemonsTempTemp),
          PrintPreorder(element, pokemons, pokemonsTemp)
        });
  }
}
