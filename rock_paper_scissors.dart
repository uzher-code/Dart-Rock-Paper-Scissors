import 'dart:io';
import 'dart:math';

enum Move { rock, paper, scissors }
void main() {
  bool play = true;
  final rng = Random();
  while(play) {
    stdout.write('Rock, paper or scissors? (r = rock/ p = paper/ s = scissors) ');
    final input = stdin.readLineSync();
    print('Selected: $input');
    if (input == 'q') {
      print('Closing the game.');
      play = false;
    } else if (input == 'r' || input == 'p' || input == 's') {
      var playerMove;
      if (input == 'r') playerMove = Move.rock;
      else if (input == 'p') playerMove = Move.paper;
      else playerMove = Move.scissors;
      final random = rng.nextInt(3);
      final aiMove = Move.values[random];
      print('----------------------------');
      print('Player used: $playerMove');
      print('AI used: $aiMove');
      if (playerMove == aiMove) print("It's a draw.");
      else if (
        (playerMove == Move.rock && aiMove == Move.scissors)
        || (playerMove == Move.paper && aiMove == Move.rock)
        || (playerMove == Move.scissors && aiMove == Move.paper)
      ) print('You win!!!');
      else print('You lose!!!');
      print('----------------------------');
    } else {
      print('Invalid input! Please try again.');
    }
  }
}