//Checkpoint 8 - Protocols and Extension
//make a protocol that describes a building, adding various properties and methods,
//then create two structs, House and Office, that conform to it.

protocol Building {
    var rooms: Int { get }
    var cost: Int { get set }
    var agent: String { get set }
    func salesSummary()
}

struct House: Building {
    var rooms = 4
    var cost: Int
    var agent: String
    func salesSummary() {
        print("House was sold by \(agent) for \(cost)USD")
    }
}

struct Office: Building {
    var rooms = 10
    var cost: Int
    var agent: String
    func salesSummary() {
        print("Office was sold by \(agent) for \(cost)USD")
    }
}

let myHouse = House(cost: 5_00_000, agent: "Tyler James")
myHouse.salesSummary()

let myOffice = Office(rooms: 5, cost: 10_00_000, agent: "Demi Moore")
print(myOffice.rooms)
myOffice.salesSummary()




