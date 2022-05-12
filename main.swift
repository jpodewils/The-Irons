import Foundation
//Initial options prior to playing the game.
func mainMenu() -> Int{
    print("1 - Play Hangman")
    print("2 - Learn Rules")
    print("3 - Exit")
    print("Enter choice: ",terminator:"")
    var ch: Int = 0
    if let id = Int(readLine()!){
        ch=id
    }
    return ch
}
//Determines what to prompt you towards based on your number input.
var ch = mainMenu()
while ch != 3 {
    if (ch == 1){
        let game = Hangman()
        game.start()
    }
    else if (ch == 2){
        print("------ RULES ------")
        print("You need to guess letters that are in a random country's name...")
        print("Every wrong letter you guess will draw another body part of the hangman...")
        print("If you guess the letter incorrectly eight times the hangman will be fully drawn and you lose!")
        print("-------------------")
    }
    else {
        break
    }
    ch = mainMenu()
}
