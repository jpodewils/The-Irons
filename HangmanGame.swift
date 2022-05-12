import Foundation
//This stores a word bank of all our selected countries to be chosen at random.
class Hangman{
    func getRandomName() -> String {
        let countries = ["afghanistan","albania","algeria","andorra","angola","argentina","armenia","australia","austria","azerbaijan","bahamas","bahrain","bangladesh","barbados","belarus","belgium","belize","benin","bhutan","bolivia","botswana","brazil","brunei","bulgaria","burkina","burundi","cambodia","cameron","canada","chad","chile","china","colombia","comoros","congo","costa rica","croatia","cuba","cyprus","czech republic","denmark","djibouti","dominica","dominican republic","ecuador","egypt","elsalvador","eritrea","estonia","ethiopia","fiji","finland","france","gambia","georgia","germany","ghana","greece","grenada","guatemala","guinea","haiti","honduras","hungary","iceland","india","indonesia","iran","iraq","israel","italy","ivorycoast","jamaica","japan","jordan","kazakhstan","kenya","north korea","southkorea","kuwait","laos","latvia","lebanon","lesotho","liberia","libya","lithuania","luxembourg","macedonia","madagascar","malaysia","maldives","mali","malta","mauritius","mexico","moldova","monaco","mongolia","montenegro","morocco","mozambique","burma","nepal","netherlands","newzealand","nicaragua","niger","nigeria","norway","oman","pakistan","panama","paraguay","peru","philippines","poland","portugal","qatar","romania","russia","rwanda","samoa","saudiarabia","senegal","serbia","sierra leone","singapore","slovakia","slovenia","somalia","south africa","south sudan","spain","srilanka","sudan","sweden","switzerland","syria","taiwan","tajikistan","tanzania","thailand","togo","tonga","trinidad and tobago","tunisia","turkey","tuvalu","uganda","ukraine","united arabemirates","united kingdom","united states","uruguay","uzbekistan","vanuatu","vatican city","venezuela","vietnam","yemen","zambia","zimbabwe"]
        //This selects a random string out of our list of countries.
        return countries.randomElement()!
    }
    //These dictate what is drawn on the hangman corresponding to the amount of letters you have guessed wrong.
    func printbodyStages(wrong: Int) {
        if (wrong == 1){
            print("--------")
            print("|      |")
            print("|")
            print("|")
            print("|")
            print("|")
            print("---")
        }
        else if (wrong == 2){
            print("--------")
            print("|      |" )
            print("|      O" )
            print("|")
            print("|")
            print("|")
            print("---")
        }
        else if (wrong==3){
            print("--------")
            print("|      |")
            print("|      O")
            print("|      |")
            print("|")
            print("|")
            print("---")
        }
        else if (wrong==4){
            print("--------")
            print("|      |")
            print("|      O")
            print("|      |")
            print("|      |")
            print("|")
            print("---")
        }
        else if (wrong==5){
            print("--------")
            print("|      |")
            print("|      O")
            print("|     \\|")
            print("|      |")
            print("|")
            print("---")
        }
        else if (wrong==6){
            print("--------")
            print("|      |")
            print("|      O")
            print("|     \\|/")
            print("|      |")
            print("|")
            print("---")
        }
        else if (wrong==7){
            print("--------")
            print("|      |")
            print("|      O")
            print("|     \\|/")
            print("|      |")
            print("|     /")
            print("---")
        }
        else if (wrong==8){
            print("--------")
            print("|      |")
            print("|      O")
            print("|     \\|/")
            print("|      |")
            print("|     / \\")
            print("---")
        }
        
    }
    func drawBoard() {
        //Checks if your amount of wrong guesses has reached 8, and then tells you that the game is over and what the word was.
        printbodyStages(wrong: numberOfWrongGuesses)
        printGuessedLetters()
        if (numberOfWrongGuesses == 8) {
            print("Game Over!\n")
            print("The Country Was: \(answer)")
            print("")
            //Checks if the program has stopped running, but hasn't reached 8 guesses and tells you that you won.
        } else if (isRunning == false) {
            print("You Won!\n")
        }
        
    }
    //Checks your letter guess to see if it is inside your specified word.
    func checkGuess() {
        var letterIsRight = false
        for char in answer {
            if char == guess {
                letterIsRight = true
                break
            }
        }
        //If your letter guess is incorrect, increments your numberofwrongguesses by 1
        if (letterIsRight == false) {
            numberOfWrongGuesses+=1
        }
        allGuesses.append(guess)
    }
    func askGuess() {
        var invalidGuess = true
        //If you've guessed a letter more than once, will keep everything and tell you that you've already guessed it and to guess again.
        while invalidGuess {
            print("Enter guess: ",terminator: " ")
            let input = readLine(strippingNewline:false)!
            guess = input[input.startIndex]
            
            invalidGuess = false
            if (guess == " " || guess == "\n") {
                invalidGuess = true
            } else {
                for char in allGuesses {
                    if (guess == char) {
                        invalidGuess = true
                    }
                }
            }
            if invalidGuess {
                print("Sorry you already guessed ",guess)
            }
        }
    }
    //Makes sure that the program continues running when the guess is right.
    func updateGame() {
        isRunning = false
        let rightGuesses = getRightGuesses()
        
        for char in rightGuesses {
            if (char == "_") {
                isRunning = true
            }
        }
        
        if (numberOfWrongGuesses == 8) {
            isRunning = false
        }
    }
    //Prints the amount of blanks for the chosen word.
    func printGuessedLetters() {
        
        print("")
        if (allGuesses.isEmpty) {
            for _ in answer {
                print("_ ",terminator: "")
            }
        } else {
            
            for char in answer {
                if (allGuesses.contains(char)){
                    print(char,terminator: " ")
                }
                else{
                    print("_",terminator: " ")
                }
                
            }
            print("\n")
        }
        print("\n")
    }
    
    
    //If your guess is right, the _ will be replaced by that specified letter.
    func getRightGuesses() -> String {
        var rightGuesses = ""
        for char in answer {
            if (char == " ") {
                rightGuesses += "  "
            } else {
                var charGuessed = false
                for guess in allGuesses {
                    if (char == guess) {
                        charGuessed = true
                    }
                }
                if charGuessed {
                    rightGuesses += String(char) + " "
                } else {
                    rightGuesses += "_ "
                }
            }
        }
        return rightGuesses
    }
    var allGuesses = [Character]()
    var guess:Character = " "
    var numberOfWrongGuesses = 0
    var answer = ""
    var isRunning = true
    func start() {
        
        answer = getRandomName()
        
        while (isRunning) {
            drawBoard()
            askGuess()
            checkGuess()
            updateGame()
            
        }
        drawBoard()
        
        
    }
    
}

