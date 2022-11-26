// CHECKPOINT 7 - CLASSES
// make a class hierarchy for animals, starting with Animal at the top,
// then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog,
// and Persian and Lion as subclasses of Cat.

import Cocoa

class animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

class dog: animal {
    func speak() {
        print("A dog barks")
    }
    override init (legs: Int) {
        super.init(legs: legs)
    }
}

class corgi: dog {
    var speakingStyle: String
    init (legs: Int, speakingStyle: String) {
        self.speakingStyle = speakingStyle
        super.init(legs: legs)
    }
    override func speak() {
        print("corgi barks like \(speakingStyle)")
    }
}

class poddle: dog {
    var speakingStyle: String
    init (legs: Int, speakingStyle: String) {
        self.speakingStyle = speakingStyle
        super.init(legs: legs)
    }
    override func speak() {
        print("poodle barks like \(speakingStyle)")
    }
}

class cat: animal {
    var isTame: Bool = true
    
    override init(legs: Int) {
        super.init(legs: legs)
    }

    func speak() {
        print("A cat purrs")
    }
}

class persian: cat {
    var speakingStyle: String
    init (legs: Int, speakingStyle: String) {
        self.speakingStyle = speakingStyle
        super.init(legs: legs)
    }
    override func speak() {
        print("persian purrs like \(speakingStyle)")
    }
}

class lion: cat {
    var speakingStyle: String
    init (legs: Int, speakingStyle: String) {
        self.speakingStyle = speakingStyle
        super.init(legs: legs)
    }
    override func speak() {
        print("lion purrs like \(speakingStyle)")
    }
}


var myDog1 = corgi(legs: 4, speakingStyle: "woof")
myDog1.speak()

var myDog2 = poddle(legs: 4, speakingStyle: "poof")
myDog2.speak()

var anyDog = dog(legs: 4)
anyDog.speak()

var myCat1 = persian(legs: 4, speakingStyle: "meow")
myCat1.speak()

var myCat2 = lion(legs: 4, speakingStyle: "rawr")
myCat2.speak()

var anyCat = cat(legs: 4)
anyCat.speak()
