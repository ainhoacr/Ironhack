//: [Previous](@previous)

import Foundation

let tesla =  Person(name: "Nikola Tesla")
tesla.address = "Madrid"

let einstein = Person(name: "Einstein")
einstein.address = "A Coruña"

let borh = Person(name: "Niels Börh")
borh.address = "Madrid"

let schrodinger = Person(name: "Schrödinger")
schrodinger.address = "Málaga"

let newton = Person(name: "Newton")
newton.address = "Málaga"

let people = [tesla, einstein, borh, schrodinger, newton]

for p in people where p.address == "Málaga" {
    print("\(p.name) vive en \(p.address)")
}

people.map {
    $0.address = "Sevilla"
    print("\($0.name) vive en \($0.address)")
}

func operation(a: Int , b: Int) -> () -> Int {
    let f1 = { () -> Int in
        return a + b
    }
    let f2 = { () -> Int in
        return a * b
    }
    
    if a == 2 {
        return f1
    }
    
    return f2
}

operation(10, b: 20)()
operation(2, b: 20)()

//: [Next](@next)
