//Checkpoint 9 - Optionals
//write a function that accepts an optional array of integers, and returns one randomly.
//If the array is missing or empty, return a random number in the range 1  through 100.
//write this whole thing in one line of code

let numbers: [Int]? = nil

func randomNumber(from array: [Int]?) -> Int {
    return array?.randomElement() ?? Int.random(in: 1...100)
}

print(randomNumber(from: numbers))
