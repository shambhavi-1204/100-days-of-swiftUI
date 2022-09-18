// CHECKPOINT 3 - LOOPS
// if number is a multiple of 3 then print - "Fizz"
// if number is a multiple of 5 then print - "Buzz"
// if number is a mutiple of 3 & 5 then print - "FizzBuzz"
// otherwise print the number itself

import Cocoa

for i in 1...100 {
    if i.isMultiple(of: 3) {
        i.isMultiple(of: 5) ? print("FizzBuzz") : print("Fizz")
    }
    else if i.isMultiple(of: 5) {
        print("Buzz")
    }
    else {
        print(i)
    }
    print()
}
