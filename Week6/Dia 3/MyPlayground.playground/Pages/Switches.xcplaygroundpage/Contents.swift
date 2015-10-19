//: [Previous](@previous)

/*:
    # Switches in Swift

* examples
* fun
* more fun
* wow, such switches, many code

Reference: [Diego's excellent & fine web page](http:\\wwww.freniche.com)

*/

import Foundation

var ainhoa = Person(name: "Ainhoa")

let i = 104

switch i {
case let x where x > 100 && x < 199:
    print("1 \(x)")
    
case 202...203:
    print("2")
    
case 305:
    print("10")
    
case 404:
    print("10")
    
case 504:
    print("10")
    
default:
    break
    
}


let b = true
switch b {
case true:
    break
    
case false:
    break
}

let name = "Diego Freniche"

switch name {
case let x where x.hasSuffix("Freniche"):
    print("hola \(x)")
    
case "" :
    print("vacia")
    
default:
    break
}

let schema = "http://myweb.com"

switch schema {
case let x where x.hasPrefix("http://"):
    print("HTTP")
    
default:
    print("\(schema) Unknown")
}

enum Schemas: String {
    case http = "http://"
    case https = "https://"
    case irc = "irc://"
    case ftp = "ftp://"
}

enum Days: String {
    case mon = "Monday"
    case tue = "Tuesday"
    case wed = "Wednesday"
    case thu = "Thursday"
    case fri = "Friday"
}

let day = Days.tue

switch day {
case .mon :
    print("Mal")
    
case .wed, .thu:
    print("Medio mal")
    
case let name where day.rawValue.hasSuffix("day"):
    print("No tengo ganas de currar")
    
default:
    print("")
}

for i in 1...100 where i%2==0 {
    print("\(i)")
}

//: [Next](@next)
