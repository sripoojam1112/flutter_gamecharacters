import 'package:flutter/material.dart';
// import 'package:flutter_gamecharacters/models/character.dart';
import 'package:flutter_gamecharacters/screens/create/create.dart';
import 'package:flutter_gamecharacters/screens/home/character_card.dart';
import 'package:flutter_gamecharacters/services/global_characterstore.dart';
import 'package:flutter_gamecharacters/shared/styled_button.dart';
import 'package:flutter_gamecharacters/shared/styled_text.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Your Characters'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Expanded(
              
              // ListView widget allows to output a list of widgets wh comes with constructor called builder
              // builder is used to dynamically build the list ie eventhough we dont know the length of the list which cant be done using for loops with ease
              // other adv of using ListView is that the list ie generated on UI can be scrollable when we have big list wh. cant fit the screen
              
              child: Consumer<GlobalCharacterstore>(                   //HOME.DART is taking/consuming character data from GlobalCharacterstore instead from character.dart ; and any changes in globalstore will be notified here and the builder reruns the widget again to update the changes here    
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.characters.length,         // value. mns that v r grabbing character data from globalcharacterstore not frm character.dart
                    itemBuilder: (_, index) {
                      return CharacterCard(value.characters[index]);
                      
                        // return Container(
                        // color: Colors.grey[800],
                        // padding: const EdgeInsets.all(30),
                        // margin: const EdgeInsets.only(bottom: 40),
                        // child: Text(characters[index]),
                        // );
                    },
                    // builder constructor takes 2 arguments
                    // itemCount: no. of items in the list
                    // itemBuilder: builds a widget tree for each list item
                    // so that itemBuilder iterates for itemCount times; ie itemBuilder func runs ones for each item
                    // Therefore this itemBuilder returns each widget for each item in list ie for each character
                    );
                }
              ),
            ),

            StyledButton(
              onPressed: (){
                Navigator.push(
                  context,           // context is present in widget build, so that everywidget has a context object.
//here v need to pass that context obj as 1st so that nav has access to context of wer v r in the app.
// MaterialPageRoute constructor is 2nd arg wh has single named arg called builder. 
// value of builder is a func wh. has access to its own separate context obj as an arg wh we named as ctx instead of context as context is already an obj od widget build
// this builder has a separate context bcz here also v need to build a new screen & return it in the form of widget tree same as in a buld functn for custom widget
                  MaterialPageRoute(             
                    builder: (ctx) => CreateScreen(), // CreateScreen is the widget tree wh. v have created, wer v want to nav to. by clicking the button
                    )
                  );
              }, 
            child: const StyledHeading('Create New')
            ),
          ],
        ),
      )
    );
  }
}

