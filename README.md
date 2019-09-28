# * *Testing Tic-Tac-Toe Game.**

This a rspec test suite of Tic-Tac-Toe using Ruby. The project is meant to reinforce TDD concepts using the rspec Ruby framework.

## **How to play our game**

Our game is a command line game so you need to be in a terminal, or terminal like environment, to run it.

The game starts by taking in the names of 2 players and uses either 'X' or 'O' as their player marker on the board. The board is a 3 X 3 grid and each player takes turn placing markers on the board, starting with the first player. The game ends if any player has a straight set of 3 characters horizontal, vertical or diagonal or if the board is full.

<img alt="Tic-Tac-Toe" src="https://user-images.githubusercontent.com/50522273/65238556-c1ea9480-da91-11e9-9cfa-419906791309.png" width="300" height="300" style="margin: 10px auto;">


## **Rules of the game**

* A player can't play more than once during a turn.
* A player can't play in an already taken space.
* Once a winning sequence is reached, the game is over regardless of how many turns have passed
* Once the board is full, game is over.

## **Testing the game**

In order to test the game, you will need to install rspec. Run `gem install rspec` in the terminal.
Next, you will need to run the command `rspec spec/name_of_file_to_test`. You will be greeted with either a failure or success message depending on the test. Good luck with testing tictactoe.


## **Running the game**

In order to run the game, you'll need to have ruby installed locally. Check [HERE](https://www.ruby-lang.org/en/documentation/installation/) to learn how to install ruby. 

You will then have to Clone or download this repo. You can use `git clone https://github.com/Forison/tic-tac-toe.git` on the terminal if you have git installed or just download it from github.

Next, navigate the directory `cd tic-tac-toe`. The directory has the following structure:
* An assets folder that holders the images used in the README file.
* A spec folder that holds all the specifications for the project, it contains the `player_spec`, `game_spec`, `board_spec` and `spec_helper` files.
* A bin folder that holds the `main.rb` file.
* A lib folder that holds `modules` and `classes` : `board.rb`, `game.rb` ad `player.rb`
* A LICENSE.md and a README.md file.

To run the game, first verify that you have ruby installed by running `ruby -v` or `ruby --version` you should see something like `ruby 2.6.0p0 (2018-12-25 revision 66547) [x86_64-linux]`, based on your version and OS.

Next run `ruby bin/main.rb` or `cd bin; ruby main.rb`. This command tell ruby to run our `main.rb` file. You should be greated with the game interface.


## **ENJOY!**

## **Contributors**

* <a href="https://github.com/addod19" target="blank">Addo Daniel Larbi</a>
* <a href="https://github.com/maya88en" target="blank">Maya Alaa Eldin Mohamed Elfeky</a>
