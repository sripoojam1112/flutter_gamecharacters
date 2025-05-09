// mixin is collection of fields or methods that can then be used by other classes 
// such as 'class character' without the need for inheritance.

// GAME RULES:
// points can inc, if points > 0
// min value for health, attack,defense,skill is 5;
// if it reach 5, player can no more decrease these stats to add to his points to increase his points

// '_' is used to make them private fields, ie they cant be changed or edited or accessed outside of the file.
// these private fields r only allowed to b updated through the methods defined within the class ie through inc or dec in this case
// Getter: is a function that returns a value from a class or a mixin , where the value can even b private value.
// the values can also be formatted within the getter b4 v return them & v can use those getters as properties (not as methods) on instances of these objects in future.


mixin Stats{
  int _points = 10;
  int _health = 10;
  int _attack = 10;
  int _defense = 10;
  int _skill = 10;

//getters:
int get points => _points;

// property ; mapping :  int _health is mapped to the property-String'health'
Map<String, int> get statsAsMap => {
  'health': _health,
  'attack': _attack,
  'defense': _defense,
  'skill': _skill,
};

// property; listing for iteration : contains list of maps[str:str]
List<Map<String, String>> get statsAsFormattedList => [
 {'title': 'health', 'value': _health.toString()},
 {'title': 'attack', 'value': _attack.toString()},
 {'title': 'defense', 'value': _defense.toString()},
 {'title': 'skill', 'value': _skill.toString()},
];

// METHODS:
//1. inc stat by 1 & dec points by 1 , when points > 0 
  void increaseStat(String stat){
    if (_points > 0) {
      if (stat == 'health'){
        _health++;
      }
      if (stat == 'attack'){
        _attack++;
      }
      if (stat == 'defense'){
        _defense++;
      }
      if (stat == 'skill'){
        _skill++;
      }
      _points--;
    }
  }

//2. dec stat by 1  & inc points by 1, when stat > 5
  void decreaseStat(String stat) {
    if (stat == 'health' && _health > 5) {
      _health--;
      _points++;
    }
    if (stat == 'attack' && _attack > 5) {
      _attack--;
      _points++;
    }
    if (stat == 'defense' && _defense > 5) {
      _defense--;
      _points++;
    }
    if (stat == 'skill' && _skill > 5) {
      _skill--;
      _points++;
    }
  }
}


