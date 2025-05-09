import 'package:flutter/material.dart';
import 'package:flutter_gamecharacters/models/character.dart';
import 'package:flutter_gamecharacters/models/vocations.dart';

class GlobalCharacterstore extends ChangeNotifier{  // when v make changes to data/state inside this class, v can notify any listeners or consumers of this data to get updated/rebuild widget accordingly

// defining the globalstate within this class
  final List<Character> _characters = [
  Character(id: '1', name: 'Klara', vocation: Vocation.wizard, slogan: 'Mystic winds, obey my will'),
  Character(id: '2', name: 'Jonny', vocation: Vocation.junkie, slogan: 'Glow before the storm'),
  Character(id: '3', name: 'Crimson', vocation: Vocation.raider, slogan: 'Fuel the fury'),
  Character(id: '4', name: 'Shaun', vocation: Vocation.ninja, slogan: 'One Click to Go!'),
];

  get characters => _characters;

// add character
void addCharacter(Character character) {
  _characters.add(character);
  notifyListeners();     // this notifies the consumer that there is change in data, so that the consumer  updates the data and reruns the builder func
}

// save (update) character


// remove character


// initially fetch characters




}