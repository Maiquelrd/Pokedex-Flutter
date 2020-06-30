class PokEvolution {
  Trigger babyTriggerItem;
  Chain chain;
  int id;

  PokEvolution({this.babyTriggerItem, this.chain, this.id});

  PokEvolution.fromJson(Map<String, dynamic> json) {
    babyTriggerItem = json['baby_trigger_item'] != null
        ? new Trigger.fromJson(json['baby_trigger_item'])
        : null;
    chain = json['chain'] != null ? new Chain.fromJson(json['chain']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.babyTriggerItem != null) {
      data['baby_trigger_item'] = this.babyTriggerItem.toJson();
    }
    if (this.chain != null) {
      data['chain'] = this.chain.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Chain {
  List<EvolutionDetails> evolutionDetails;
  List<EvolvesTo> evolvesTo;
  bool isBaby;
  Trigger species;

  Chain({this.evolutionDetails, this.evolvesTo, this.isBaby, this.species});

  Chain.fromJson(Map<String, dynamic> json) {
    if (json['evolution_details'] != null) {
      evolutionDetails = new List<EvolutionDetails>();
      json['evolution_details'].forEach((v) {
        evolutionDetails.add(new EvolutionDetails.fromJson(v));
      });
    }
    if (json['evolves_to'] != null) {
      evolvesTo = new List<EvolvesTo>();
      json['evolves_to'].forEach((v) {
        evolvesTo.add(new EvolvesTo.fromJson(v));
      });
    }
    isBaby = json['is_baby'];
    species =
        json['species'] != null ? new Trigger.fromJson(json['species']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.evolutionDetails != null) {
      data['evolution_details'] =
          this.evolutionDetails.map((v) => v.toJson()).toList();
    }
    if (this.evolvesTo != null) {
      data['evolves_to'] = this.evolvesTo.map((v) => v.toJson()).toList();
    }
    data['is_baby'] = this.isBaby;
    if (this.species != null) {
      data['species'] = this.species.toJson();
    }
    return data;
  }
}

class EvolvesTo {
  List<EvolutionDetails> evolutionDetails;
  List<EvolvesTo> evolvesTo;
  bool isBaby;
  Trigger species;

  EvolvesTo({this.evolutionDetails, this.evolvesTo, this.isBaby, this.species});

  EvolvesTo.fromJson(Map<String, dynamic> json) {
    if (json['evolution_details'] != null) {
      evolutionDetails = new List<EvolutionDetails>();
      json['evolution_details'].forEach((v) {
        evolutionDetails.add(new EvolutionDetails.fromJson(v));
      });
    }
    if (json['evolves_to'] != null) {
      evolvesTo = new List<EvolvesTo>();
      json['evolves_to'].forEach((v) {
        evolvesTo.add(new EvolvesTo.fromJson(v));
      });
    }
    isBaby = json['is_baby'];
    species =
        json['species'] != null ? new Trigger.fromJson(json['species']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.evolutionDetails != null) {
      data['evolution_details'] =
          this.evolutionDetails.map((v) => v.toJson()).toList();
    }
    if (this.evolvesTo != null) {
      data['evolves_to'] = this.evolvesTo.map((v) => v.toJson()).toList();
    }
    data['is_baby'] = this.isBaby;
    if (this.species != null) {
      data['species'] = this.species.toJson();
    }
    return data;
  }
}

class EvolutionDetails {
  int gender;
  Trigger heldItem;
  Trigger item;
  Trigger knownMove;
  Trigger knownMoveType;
  Trigger location;
  int minAffection;
  int minBeauty;
  int minHappiness;
  int minLevel;
  bool needsOverworldRain;
  Trigger partySpecies;
  Trigger partyType;
  int relativePhysicalStats;
  String timeOfDay;
  Trigger tradeSpecies;
  Trigger trigger;
  bool turnUpsideDown;

  EvolutionDetails(
      {this.gender,
      this.heldItem,
      this.item,
      this.knownMove,
      this.knownMoveType,
      this.location,
      this.minAffection,
      this.minBeauty,
      this.minHappiness,
      this.minLevel,
      this.needsOverworldRain,
      this.partySpecies,
      this.partyType,
      this.relativePhysicalStats,
      this.timeOfDay,
      this.tradeSpecies,
      this.trigger,
      this.turnUpsideDown});

  EvolutionDetails.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    heldItem = json['held_item'] != null
        ? new Trigger.fromJson(json['held_item'])
        : null;
    item = json['item'] != null ? new Trigger.fromJson(json['item']) : null;
    knownMove = json['known_move'] != null
        ? new Trigger.fromJson(json['known_move'])
        : null;
    knownMoveType = json['known_move_type'] != null
        ? new Trigger.fromJson(json['known_move_type'])
        : null;
    location = json['location'] != null
        ? new Trigger.fromJson(json['location'])
        : null;
    minAffection = json['min_affection'];
    minBeauty = json['min_beauty'];
    minHappiness = json['min_happiness'];
    minLevel = json['min_level'];
    needsOverworldRain = json['needs_overworld_rain'];
    partySpecies = json['party_species'] != null
        ? new Trigger.fromJson(json['party_species'])
        : null;
    partyType = json['party_type'] != null
        ? new Trigger.fromJson(json['party_type'])
        : null;
    relativePhysicalStats = json['relative_physical_stats'];
    timeOfDay = json['time_of_day'];
    tradeSpecies = json['trade_species'] != null
        ? new Trigger.fromJson(json['trigger'])
        : null;
    trigger =
        json['trigger'] != null ? new Trigger.fromJson(json['trigger']) : null;
    turnUpsideDown = json['turn_upside_down'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.gender;
    if (this.heldItem != null) {
      data['held_item'] = this.heldItem.toJson();
    }
    if (this.item != null) {
      data['item'] = this.item.toJson();
    }
    if (this.knownMove != null) {
      data['known_move'] = this.knownMove.toJson();
    }
    if (this.knownMoveType != null) {
      data['known_move_type'] = this.knownMoveType.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['min_affection'] = this.minAffection;
    data['min_beauty'] = this.minBeauty;
    data['min_happiness'] = this.minHappiness;
    data['min_level'] = this.minLevel;
    data['needs_overworld_rain'] = this.needsOverworldRain;
    data['party_species'] = this.partySpecies;
    data['party_type'] = this.partyType;
    data['relative_physical_stats'] = this.relativePhysicalStats;
    data['time_of_day'] = this.timeOfDay;
    if (this.tradeSpecies != null) {
      data['trade_species'] = this.tradeSpecies.toJson();
    }
    if (this.trigger != null) {
      data['trigger'] = this.trigger.toJson();
    }
    data['turn_upside_down'] = this.turnUpsideDown;
    return data;
  }
}

class Trigger {
  String name;
  String url;

  Trigger({this.name, this.url});

  Trigger.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
