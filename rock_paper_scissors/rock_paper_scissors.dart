import 'dart:io';
import 'dart:math';

enum Move {
  rock,
  paper,
  scissors,
}

void main() {
  // prompt user
  // record input
  // validate input
  // generate random answer for AI
  // compare results

  while (true) {
    print("Rock, paper or scissors? (r/p/s)");
    final input = stdin.readLineSync();
    if (input == 'q') {
      print("Goodbye");
      break;
    }
    Move player;
    switch (input) {
      case 'r':
        player = Move.rock;
        break;
      case 'p':
        player = Move.paper;
        break;
      case 's':
        player = Move.scissors;
        break;
      default:
        print("Invalid Input");
        continue;
    }
    int rnd = Random().nextInt(3);
    Move computer;
    switch (rnd) {
      case 0:
        computer = Move.rock;
        break;
      case 1:
        computer = Move.paper;
        break;
      default:
        computer = Move.scissors;
        break;
    }
    String result;
    if (player.name == computer.name) {
      result = "It's a tie";
    } else if ((player == Move.paper && computer == Move.rock) ||
        (player == Move.rock && computer == Move.scissors) ||
        (player == Move.scissors && computer == Move.paper)) {
      result = "You win";
    } else {
      result = "You lose";
    }
    print("You played: ${player.name}");
    print("AI played: ${computer.name}");
    print(result);
  }
}
