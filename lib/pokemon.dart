import 'package:flutter/cupertino.dart';

class PokeHub {
  List<Pokemon> pokemon = [];
  PokeHub({required this.pokemon});

  PokeHub.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      json['pokemon'].forEach((v) {
        pokemon.add(new Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_null_comparison
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemon {
  int? id;
  String? num;
  String? name;
  String? img;
  List<String>? type;
  String? height;
  String? weight;
  String? candy;
  int? candyCount;
  String? egg;
  String? spawnChance;
  String? avgSpawns;
  String? spawnTime;
  List<double>? multipliers;
  List<String>? weaknesses;
  List<NextEvolution>? nextEvolution;
  List<PrevEvolution>? prevEvolution;

  Pokemon(
      {this.id,
      this.num,
      this.name,
      this.img,
      this.type,
      this.height,
      this.weight,
      this.candy,
      this.candyCount,
      this.egg,
      this.spawnChance,
      this.avgSpawns,
      this.spawnTime,
      this.multipliers,
      this.weaknesses,
      this.nextEvolution,
      this.prevEvolution});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'num': num,
      'name': name,
      'img': img,
      'type': type,
      'height': height,
      'weight': weight,
      'candy': candy,
      'candyCount': candyCount,
      'egg': egg,
      'spawnChance': spawnChance,
      'avgSpawns': avgSpawns,
      'spawnTime': spawnTime,
      'multipliers': multipliers,
      'weaknesses': weaknesses,
      'nextEvolution': nextEvolution,
      'prevEvolution': prevEvolution,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'],
      num: map['num'],
      name: map['name'],
      img: map['img'],
      type: map['type'],
      height: map['height'],
      weight: map['weight'],
      candy: map['candy'],
      candyCount: map['candyCount'],
      egg: map['egg'],
      spawnChance: map['spawnChance'],
      avgSpawns: map['avgSpwans'],
      spawnTime: map['spawnTime'],
      multipliers: map['multipliers'],
      weaknesses: map['weaknesses'],
      nextEvolution: map['nextEvolution'],
      prevEvolution: map['prevEvolution'],
    );
  }

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    candy = json['candy'];
    candyCount = json['candy_count'];
    egg = json['egg'];
    spawnChance = json['spawn_chance'].toString();
    avgSpawns = json['avg_spawns'].toString();
    spawnTime = json['spawn_time'];
    multipliers = json['multipliers']?.cast<double>();
    weaknesses = json['weaknesses'].cast<String>();

    if (json['next_evolution'] != null) {
      List<NextEvolution> nextEvolution = [];
      json['next_evolution'].forEach((v) {
        nextEvolution.add(new NextEvolution.fromJson(v));
      });
    }
    if (json['prev_evolution'] != null) {
      List<PrevEvolution> prevEvolution = [];
      json['prev_evolution'].forEach((v) {
        prevEvolution.add(new PrevEvolution.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['num'] = this.num;
    data['name'] = this.name;
    data['img'] = this.img;
    data['type'] = this.type;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['candy'] = this.candy;
    data['candy_count'] = this.candyCount;
    data['egg'] = this.egg;
    data['spawn_chance'] = this.spawnChance;
    data['avg_spawns'] = this.avgSpawns;
    data['spawn_time'] = this.spawnTime;
    data['multipliers'] = this.multipliers;
    data['weaknesses'] = this.weaknesses;
    if (this.nextEvolution != null) {
      data['next_evolution'] =
          this.nextEvolution!.map((v) => v.toJson()).toList();
    }
    if (this.prevEvolution != null) {
      data['prev_evolution'] =
          this.prevEvolution!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrevEvolution {
  PrevEvolution.fromJson(v);

  toJson() {}
}

class NextEvolution {
  NextEvolution.fromJson(v);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    return data;
  }
}


//String num;
  //String name;

  //NextEvolution({required this.num, required this.name});
    //  data['num'] = this.num;
   // data['name'] = this.name;