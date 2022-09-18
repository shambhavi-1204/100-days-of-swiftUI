// CHECKPOINT 4 - FUNCTIONS & ERRORS
// print the square root of a number
// if the square root is not an integer -> give no root error
// if the number given is not in the 1 to 10,000 range -> give out of bounds error
import Cocoa

enum rootErrors: Error {
    case outOfBounds, noRoot
}

func squareRoot(of number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw rootErrors.outOfBounds
    }
    else {
        for i in 1...number/2 {
            if i*i == number {
                return i
            }
        }
        throw rootErrors.noRoot
    }
}

let number = 10

do {
    let result = try squareRoot(of: number)
    print("square root is \(number) is \(result).")
} catch rootErrors.outOfBounds {
    print("number given is out of bounds.")
} catch rootErrors.noRoot {
    print("number does not have a square root.")
}
