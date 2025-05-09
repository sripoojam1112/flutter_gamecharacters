import 'package:flutter/material.dart';
import 'package:flutter_gamecharacters/models/character.dart';
import 'package:flutter_gamecharacters/shared/styled_text.dart';
import 'package:flutter_gamecharacters/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key}); 
// this.character is a positional parameter, written outside {}
  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
         // available points
          Container(
            color: AppColors.secondaryColor,
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(Icons.star,
                color: widget.character.points > 0 ? Colors.yellow : Colors.grey,
                ),
                SizedBox(width: 20),
                StyledText('Stat points available: '),
                Expanded(child: SizedBox(width: 20)),
                StyledHeading(widget.character.points.toString()), // WIDGET. is used as character is present in StatsTable and not in _StatsTableState.
//as widget is present in _StatsTableState , so using this v can access character from StatsTable class as the widget in _StatsTableState refers to  'class StatsTable extends StatefulWidget {}', so now can access anything from StatsTable             

              ],
            ),
          ),

         // stats table
          Table(              // table childrn can only enlist table-rows BUT inside table rows, any widget can b used
            children: widget.character.statsAsFormattedList.map((stat) {   // stat returns rows from statsAsFormattedList of stats.dart
              return TableRow(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.5),
                ),
                children: [
                  
                  // stat title
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,  // used to align content of a cell in vertical direction so that all values in a row are present in str8 line
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: StyledHeading(stat['title']!),   // ! = not null; v shld pass this - as StyleHeading takes nly str, doesnt take null & v know that stat['title'] isnt null
                    ),
                  ),

                  // stat value
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: StyledHeading(stat['value']!),   // ! = not null; v shld pass this - as StyleHeading takes nly str, doesnt take null & v know that stat['title'] isnt null
                    ),
                  ),

                  //icon to inc stat
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      icon: Icon(Icons.arrow_upward, color: AppColors.textColor),
                      onPressed: () {
                        setState(() {  // is used to recall the build func to rebuild the template with new values evry time we click on arrow. 
                          widget.character.increaseStat(stat['title']!);
                        });
                      },
                      ),
                    ),

                  //icon to dec stat
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      icon: Icon(Icons.arrow_downward, color: AppColors.textColor),
                      onPressed: () {
                        setState(() {
                        widget.character.decreaseStat(stat['title']!);
                        });
                      },
                      ),
                    ),
                ],
              );
            }).toList(),   // map returns iterable but not list

          ),

        ],
      ),
    );
  }
}

