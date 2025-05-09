import 'package:flutter/material.dart';
import 'package:flutter_gamecharacters/models/character.dart';
import 'package:flutter_gamecharacters/models/vocations.dart';
import 'package:flutter_gamecharacters/screens/create/vocation_card.dart';
import 'package:flutter_gamecharacters/screens/home/home.dart';
import 'package:flutter_gamecharacters/services/global_characterstore.dart';
import 'package:flutter_gamecharacters/shared/styled_button.dart';
import 'package:flutter_gamecharacters/shared/styled_text.dart';
import 'package:flutter_gamecharacters/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

// to create unique ids
var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

// It is the controller ie assigned to TextField to track the user inputs
  final _nameController = TextEditingController(); 
  final _sloganController = TextEditingController();


// to dispose the above controller when not in use, to free up memory & resourses of flutter app
// dispose is a lifecycle method wh. we override; as this func runs when this createScreen widget gets removed from the tree.
// always recommended while using text editing controller.
  
  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

// handling vocation selection
Vocation selectedVocation = Vocation.junkie; // default vocation

void updateVocation(Vocation vocation) {
  setState((){                              // update by using setstate; is used to trigger to rebuild the widget
    selectedVocation = vocation;
  });
}


// Submit handler
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      //print('Name must not be empty');

      // show error dialog as pop-up
      showDialog(
        context: context, 
        builder: (ctx){  // builder func automatically takes in its own context obj as param ; this is used to close the dialogue later
        return AlertDialog(
          title: const StyledHeading('Missing Character Name'),
          content: StyledText('Every good RPG character needs a great name...'),
          actions: [
            StyledButton(
              onPressed: () {
                Navigator.pop(ctx);  // Closing error popup
              },
              child: const StyledHeading('close'),
            )
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      });

      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      //print('Slogan must not be empty');

      // show error dialog with popup
      showDialog(
        context: context, 
        builder: (ctx){  
        return AlertDialog(
          title: const StyledHeading('Missing Slogan'),
          content: StyledText('Remember to add a catchy slogan...'),
          actions: [
            StyledButton(
              onPressed: () {
                Navigator.pop(ctx);  // Closing error popup
              },
              child: const StyledHeading('close'),
            )
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      });
      return;
    }
    //print(_nameController.text);
    //print(_sloganController.text);

    // characters.add(Character(
    //   name: _nameController.text.trim(),
    //   slogan: _sloganController.text.trim(),
    //   vocation: selectedVocation,
    //   id: uuid.v4(), // id is str of 4 
    // ));

    Provider.of<GlobalCharacterstore>(context, listen: false) // always set listen: false while using provider as this is a consumer
    .addCharacter(Character(
      name: _nameController.text.trim(),
      slogan: _sloganController.text.trim(),
      vocation: selectedVocation,
      id: uuid.v4(), // id is str of 4 
    ));
    

   Navigator.push(
                  context,           
                  MaterialPageRoute(
                    builder: (ctx) => Home(),
                  
                  ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character Creation'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(  
// It takes up all the available space on the screen inside this container ie it wraps up whole column.          
// but if column height overflows the h8 of this SingleChildScrollView widget, then it enables scroll down          
          child: Column(               
            children: [
              // welcome message
              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor)
              ),
              Center(
                child: StyledHeading('Welcome, new player!'),
              ),
              Center(
                child: StyledText('Create a name & slogan for your character.'),
              ),
              const SizedBox(height: 30),
          
              // user input for name & slogan; 'TextField' allows user to input text on UI
              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(
                   textStyle: Theme.of(context).textTheme.bodyMedium
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText('Character name'),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                   textStyle: Theme.of(context).textTheme.bodyMedium
                ),
                cursorColor: AppColors.textColor,
                  decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText('Character slogan'),
                ),
              ),
          
              SizedBox(height: 30),
          
              // select vocation title
              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor)
              ),
              Center(
                child: StyledHeading('Choose a vocation.'),
              ),
              Center(
                child: StyledText('This determines your available skills.'),
              ),
              const SizedBox(height: 30),
          
              // Vocation cards
              VocationCard(
                selected: selectedVocation == Vocation.junkie,
                onTap: updateVocation,
                vocation: Vocation.junkie
              ),
              VocationCard(
                selected: selectedVocation == Vocation.ninja,
                onTap: updateVocation,
                vocation: Vocation.ninja
              ),
              VocationCard(
                selected: selectedVocation == Vocation.raider,
                onTap: updateVocation,
                vocation: Vocation.raider
              ),
              VocationCard(
                selected: selectedVocation == Vocation.wizard,
                onTap: updateVocation,
                vocation: Vocation.wizard
              ),
          
              // good luck message          
              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor)
              ),
              Center(
                child: StyledHeading('Good Luck!'),
              ),
              Center(
                child: StyledText('Enjoy The Journey...'),
              ),
              const SizedBox(height: 30),

              Center(
                child: StyledButton(
                  onPressed: handleSubmit,
                  child: StyledHeading('Create Character')
                )
              )
            ],
          ),
        )
      )
      );
  }
}

