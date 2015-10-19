//: Playground - noun: a place where people can play
// REPL: Read Eval Print Loop

import Swift  //por defecto ya está
import UIKit

var str = "Hello, hola"

print ("Hola Mundo!")
print ("Adiós")

var i = 10
// i = "no puedes"

var j:Int = 20

var name:String = "Ainhoa"
var n = "Noa"

if i > 10 {
    print("i vale mayor que 10")
}
else {
    print("i es pequeñito")
}

//... todos y ese
//..< todos menos ese

for i in 1...10 {
    print("i vale \( i ) y el doble \( i*2 )")
}


func sum(a: Int, b:Int) -> Int {
    return a + b
}

sum(10, b: 20)

var año = "Año" //mejor no hacerlo

var 👍 = true
var 👎 = false

let a = 1 //constantes

func divide(numerador: Float, denominador: Float) -> (value: Float, hasError: Bool) {
    if denominador == 0 {
        return (0.0, 👎)
    }
    
    return (numerador / denominador, 👍)
}

var result = divide(10.0, denominador: 0.0)

result.value
result.hasError

class Coordinate {
    var latitude : Float?
    var longitude : Float?
    
    init (latitude: Float, longitude: Float)
    {
        self.latitude = latitude
        self.longitude = longitude
    }
}

//sino pones de quien extiendes, no extiendes de nadie
class Person {
    var name: String = "John Doe"
    var address: String = "C/ María Martillo"
    var homeCoordinate: Coordinate?
    
    init (name: String) {
        self.name = name
    }
}

let ainhoa = Person(name: "Ainhoa")

let gonzalo = Person(name: "Gonzalo")
gonzalo.homeCoordinate = Coordinate(latitude: 10.0, longitude: 11.0)

gonzalo.homeCoordinate?.latitude

//variable opcional lo puedes poner a nil
var s: String? = "Hola"
s = nil

var noOptional = "NO OPTIONAL"

s = "poner un valor"
noOptional  = s!

/*
class Slave: Person {
    var master: Person
}
*/
