import 'package:flutter_gamecharacters/models/skill.dart';
import 'package:flutter_gamecharacters/models/stats.dart';
import 'package:flutter_gamecharacters/models/vocations.dart';

class Character with Stats{
  // Stats is a mixin; 
  //adding mixin to character class, allows character class to use all the fields & methods defined in mixin-Stats and implements them in this character class

  /*
  constructor : is a special function used to create an object from a class.
  It has the same name as the class (Character).
  It is used to create objects of the class.
  The curly braces {} around the parameters indicate that it uses named parameters.
  The required keyword makes sure those values are mandatory when creating the object.
  this.name, this.slogan, and this.id means that you are assigning the incoming values directly to class fields.

  Adv of named param:
  Named parameters ->	Allow passing values by name, not position
  Use {} ->	To wrap named parameters in the function or constructor
  Use required ->	To make sure the value must be provided mandatorily
  Benefit	 -> Safer, clearer, and easier to maintain code
  If you remove {} and required, it becomes positional, meaning the order matters.
   */

  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id
  });

// final: Once these values are set (usually during object creation using the constructor), they cannot be changed later.
// It's read-only after initialization. (immutable)
// It tells other developers: “Hey, these values are fixed for this object.” such as name, id, slogan.

  // fields
  final Set<Skill> skills = {}; // {} = emptyset when started. final here means can choose between one of the 4 skills available, but cant add/change the name of skill. 
                              // Set allows nly 1 skill to be active at a time per character at any instance
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

// getters:
 bool get isFav => _isFav;  // isFav property can be used to access that _isFav private value 

// METHODS:
  void toggleIsFav (){
    _isFav= !_isFav;
  // If _isFav is false, it becomes true. If _isFav is true, it becomes false.
  //ie if _isFav is currently false: ie unfav, by tapping on it, it becomes true: ie fav
  }

// to choose the other skill, first we clear the existing skill, then update the skill. 
// final Set<Skill> skills = {}; Set allows nly 1 skill to be active at a time per character at any instance
  void updateSkill(Skill skill){
    skills.clear();
    skills.add(skill);
  }
}

// dummy character data

List<Character> characters = [
  Character(id: '1', name: 'Klara', vocation: Vocation.wizard, slogan: 'Mystic winds, obey my will'),
  Character(id: '2', name: 'Jonny', vocation: Vocation.junkie, slogan: 'Glow before the storm'),
  Character(id: '3', name: 'Crimson', vocation: Vocation.raider, slogan: 'Fuel the fury'),
  Character(id: '4', name: 'Shaun', vocation: Vocation.ninja, slogan: 'One Click to Go!'),
];

