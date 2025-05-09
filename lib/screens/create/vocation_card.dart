import 'package:flutter/material.dart';
import 'package:flutter_gamecharacters/models/vocations.dart';
import 'package:flutter_gamecharacters/shared/styled_text.dart';
import 'package:flutter_gamecharacters/theme.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({   // named parameters are written inside {}
    super.key,
    required this.vocation,
    required this.onTap,
    required this.selected,
    });

    final Vocation vocation;
    final void Function(Vocation) onTap;
    final bool selected;

// gesture-detector allows to respond to gestures & events like ontap event, ondouble tap, ondrag, onlongpress etc when user uses the gesture on the mobile
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //print(vocation.title);
        onTap(vocation);
      },
      child: Card(
        color: selected? AppColors.secondaryColor : Colors.transparent,  // background colour of selected vocation gets highli8
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
      
              // vocation img
              Image.asset('assets/img/vocations/${vocation.image}',
              width: 80,
              colorBlendMode: BlendMode.color, // for unselected vocations to be faded 
              color: !selected ? Colors.black.withOpacity(0.8) : Colors.transparent,
              ),
      
              SizedBox(width: 10),
      
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledHeading(vocation.title),
                    StyledText(vocation.description)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}