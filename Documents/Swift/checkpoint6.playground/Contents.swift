// CHECKPOINT 6 - STRUCTURES
// create a struct to store information about a car, including its model,
// number of seats and current gear, then add a method to change gears up or down

import Cocoa

struct car {
    private let model: String
    private let numberOfSeats: Int
    var currentGear: Int = 0
    
    init(model: String, seats: Int, gear: Int) {
        self.model = model
        self.numberOfSeats = seats
        
        if (gear < 0 || gear > 10) {
            print("invalid gear entered")
        } else {
            self.currentGear = gear
        }
    }
    
    mutating func gearUp() {
       if currentGear == 10  {
           print("Can't change gear. Already at max limit.")
       } else {
           currentGear += 1
           print("Gear changed to \(currentGear)")
       }
    }
    
    mutating func gearDown() {
       if currentGear == 0  {
           print("Can't change gear. Already at min limit.")
       } else {
           currentGear -= 1
           print("Gear changed to \(currentGear)")
       }
    }
}

var firstCar = car(model: "Celerio", seats: 5, gear: 9)
print(firstCar)
firstCar.gearUp()
firstCar.gearUp()
