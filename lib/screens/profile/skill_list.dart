import 'package:flutter/material.dart';
import 'package:flutter_gamecharacters/models/character.dart';
import 'package:flutter_gamecharacters/models/skill.dart';
import 'package:flutter_gamecharacters/shared/styled_text.dart';
import 'package:flutter_gamecharacters/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character, {super.key});

final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill> availableSkills; // this variable 'availableSkills' cant be null, but v can declare this variable now by using 'late', but v wont assign value now, will do it later after this step in  initState
  late Skill selectedSkill; // late bcz its initial value depends on the character wh. can b accessed in initstate
// class Skill is defined in skill.dart

// initState is a lifecycle method wh is used to create state values inside statefulwidget that rely on arg that v pass in to widget
  @override
  void initState() {                      // runs nly after v hav access to the widget & any arg passed into it.

    availableSkills = allSkills.where((skill) {
      return skill.vocation == widget.character.vocation; // if this returns true, then v keep nly the skills of the selected vocation in new list, else discard other skills as they belong to unselected vocation
  }).toList();              // widget cant be accessed outside build func so use initstate
// 'where' returns iterable but v declared availableSkills to b a list ( late List<Skill> availableSkills;)
    
    // condition 1:                              if skill set is empty, then take 1st skill available in the list as default selected skill
  if (widget.character.skills.isEmpty) {
    selectedSkill = availableSkills[0];
  }
    // condition 2:                              if skill is not empty, already has selected skill; then the seleceted skill has to be in that skill set and shoildnt change back to default 1st skill
  if (widget.character.skills.isNotEmpty) {
    selectedSkill = widget.character.skills.first;  // in character.dart file v defined a func updateSkill that ensures nly 1 skill is selected
  }    
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        color: AppColors.secondaryColor.withOpacity(0.5),
        child: Column(
          children: [

            StyledHeading('Choose an active skill'),
            StyledText('Skills are unique to your vocation.'),
            SizedBox(height: 20),

            Row(
              children: availableSkills.map((skill) {
                return Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(1),
                  color: skill == selectedSkill ? Colors.yellow : Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.character.updateSkill(skill);
                        selectedSkill = skill;
                      });
                    },
                    child: Image.asset('assets/img/skills/${skill.image}',
                    width: 70,
                    ),
                  )
                );
              }).toList(),    // MAP  returns iterable - convert to list
            ),
            SizedBox(height: 10),
            StyledText(selectedSkill.name),
          ],
        ),
      ),
    );
  }
}
