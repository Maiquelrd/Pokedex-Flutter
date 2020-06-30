import 'package:flutter/material.dart';
import 'package:Pokedex/evoluciones.dart';
import 'package:Pokedex/widgets/evoluciones_card/evoluciones_card.dart';

Color getColor(String tipo) {
  if (tipo == "normal") {
    return Colors.brown;
  } else if (tipo == "fighting") {
    return Colors.red;
  } else if (tipo == "flying") {
    return Colors.indigo;
  } else if (tipo == "poison") {
    return Colors.deepPurpleAccent;
  } else if (tipo == "ground") {
    return Color(0xffbb6528);
  } else if (tipo == "rock") {
    return Color(0xff888f3b);
  } else if (tipo == "bug") {
    return Color(0xff73a82f);
  } else if (tipo == "ghost") {
    return Color(0xff8c7bbf);
  } else if (tipo == "steel") {
    return Colors.grey;
  } else if (tipo == "fire") {
    return Colors.deepOrangeAccent;
  } else if (tipo == "water") {
    return Colors.blue;
  } else if (tipo == "grass") {
    return Colors.green;
  } else if (tipo == "electric") {
    return Colors.yellow;
  } else if (tipo == "psychic") {
    return Color(0xffffa59e);
  } else if (tipo == "ice") {
    return Colors.blueAccent;
  } else if (tipo == "dragon") {
    return Color(0xff5c5cb1);
  } else if (tipo == "dark") {
    return Color(0xff3d1f1d);
  } else if (tipo == "fairy") {
    return Colors.pink;
  }

  return Colors.white;
}

String traducir(String tipo) {
  if (tipo == "normal") {
    return "normal";
  } else if (tipo == "fighting") {
    return "luchador";
  } else if (tipo == "flying") {
    return "volador";
  } else if (tipo == "poison") {
    return "veneno";
  } else if (tipo == "ground") {
    return "tierra";
  } else if (tipo == "rock") {
    return "roca";
  } else if (tipo == "bug") {
    return "bicho";
  } else if (tipo == "ghost") {
    return "fantasma";
  } else if (tipo == "steel") {
    return "acero";
  } else if (tipo == "fire") {
    return "fuego";
  } else if (tipo == "water") {
    return "agua";
  } else if (tipo == "grass") {
    return "planta";
  } else if (tipo == "electric") {
    return "electrico";
  } else if (tipo == "psychic") {
    return "psiquico";
  } else if (tipo == "ice") {
    return "hielo";
  } else if (tipo == "dragon") {
    return "dragon";
  } else if (tipo == "dark") {
    return "oscuro";
  } else if (tipo == "fairy") {
    return "hada";
  }
  return "wtf";
}

bool tieneTipos(int i) {
  if (i > 1) {
    return true;
  }
  return false;
}

String getComa(String a) {
  int len = a.length;
  if (len < 2) {
    return (a.substring(0, len - 1) + "0," + a.substring(len - 1, len));
  } else {
    return (a.substring(0, len - 1) + "," + a.substring(len - 1, len));
  }
}

List<Row> mangaLaEvolucione(PokEvolution evolution) {
  List<Row> res = new List();
  int len = evolution.chain.evolvesTo.length;

  if (len > 1) {
    for (var i = 0; i < len; i++) {
      res = res + mangaLinea(evolution, i);
    }
  } else {
    res = res + mangaLinea(evolution, 0);
  }

  return res;
}

List<Row> mangaLinea(PokEvolution evolution, int index) {
  List<Row> b = new List();
  List<Widget> a = new List();
  bool q = true;

  EvolvesTo aber = evolution.chain.evolvesTo[index];
  a.add(new EvolucionCard(nombre: evolution.chain.species.name));
  bool hay = true;

  do {
    if (aber.evolvesTo.length > 0) {
      a.add(new EvolucionCard(nombre: aber.species.name));
      aber = aber.evolvesTo[0];
      hay = true;
    } else if (hay) {
      a.add(new EvolucionCard(nombre: aber.species.name));
      hay = false;
    } else {
      q = false;
    }
  } while (q);

  b.add(new Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: a,
  ));
  return b;
}
