

import 'package:flutter_icons/flutter_icons.dart';
import 'package:key2iq_quiz/classes/question_class.dart';
import 'package:key2iq_quiz/classes/tile_class.dart';
class MainScreenClass{

  static List<Tile> _listTile = [
    Tile('Compete Now', MaterialCommunityIcons.trophy_variant, 'Challenges for you'),
    Tile('Meet new rappers', MaterialCommunityIcons.chat_outline, 'Chat With Other Rappers'),
    Tile('Explore',MaterialIcons.explore, 'See rappers like you'),
    Tile('Play & Learn',MaterialIcons.games, 'learn in funway'),
    Tile('Learn Rap',MaterialIcons.lightbulb_outline, 'Challenges for you'),
    Tile('Practice Rap',MaterialCommunityIcons.brain, 'Challenges for you'),

  ];

  List<Tile> get listTile{
    return [..._listTile];
  }


  static List<Questions> _questionBank =[
    Questions(' 1.Jorge runs faster than Drew \n\n 2.Drew runs faster than Bernard \n\n 3.Jorge runs faster than Bernard',
        'If the first two statements are true,then the third statement is:',
        ['True','False','Uncertain'],
        'True'),
    Questions('When conducting an inventory of the PE storage room,Coach Carlson found several basektballs,tennis balls,footballs and baseballs in a locker.'
        'He found 4,6,8,10 of them(a different number for each type).He recorded that: \n 1.There are fewer tennis balls than footballs \n '
        '2.There are 6 more baseballs than basketballs',
        'If the first two statements are true,then the third statement is:',
        ['4','6','8','10'],
        '6'),
    Questions('1.Jorge runs faster than Drew \n 2.Drew runs faster than Bernard \n 3.Jorge runs faster than Bernard',
        'If the first two statements are true,then the third statement is:',
        ['True','False','Uncertain'],
        'True'),
    Questions('When conducting an inventory of the PE storage room,Coach Carlson found several basektballs,tennis balls,footballs and baseballs in a locker.'
        'He found 4,6,8,10 of them(a different number for each type).He recorded that: \n 1.There are fewer tennis balls than footballs \n '
        '2.There are 6 more baseballs than basketballs',
        'If the first two statements are true,then the third statement is:',
        ['4','6','8','10'],
        '6'),
    Questions('1.Jorge runs faster than Drew \n 2.Drew runs faster than Bernard \n 3.Jorge runs faster than Bernard',
        'If the first two statements are true,then the third statement is:',
        ['True','False','Uncertain'],
        'True'),
    Questions('When conducting an inventory of the PE storage room,Coach Carlson found several basektballs,tennis balls,footballs and baseballs in a locker.'
        'He found 4,6,8,10 of them(a different number for each type).He recorded that: \n 1.There are fewer tennis balls than footballs \n '
        '2.There are 6 more baseballs than basketballs',
        'If the first two statements are true,then the third statement is:',
        ['4','6','8','10'],
        '6'),
    Questions('When conducting an inventory of the PE storage room,Coach Carlson found several basektballs,tennis balls,footballs and baseballs in a locker.'
        'He found 4,6,8,10 of them(a different number for each type).He recorded that: \n 1.There are fewer tennis balls than footballs \n '
        '2.There are 6 more baseballs than basketballs',
        'If the first two statements are true,then the third statement is:',
        ['True','False','Uncertain'],
        'True'),

  ];

  List<Questions> get questionBank{
    return [..._questionBank];
  }



}