import Foundation

//1. შექმენით კლასი Car.
/*
 private manufacturer: String
 private buildYear: Int
 private price: Double
 private maxSpeedInKm: Double
 */

class Car {
    private var  manufacturer: String
    private var buildYear: Int
    private var price: Double
    private var maxSpeedInKm: Double
    
    init(manufacturer: String, buildYear: Int, price: Double, maxSpeedInKm: Double) {
        self.manufacturer = manufacturer
        self.buildYear = buildYear
        self.price = price
        self.maxSpeedInKm = maxSpeedInKm
    }
}



//2. შექმენით კლასი Motorcycle.

/*
 private manufacturer: String
 private price: Double
 private maxSpeedMS: Double
 private engineCapacity: Int
 */

class Motorcycle {
    private var manufacturer: String
    private var price: Double
    private var maxSpeedMS: Double
    private var engineCapacity: Int
    
    init(manufacturer: String, price: Double, maxSpeedMS: Double, engineCapacity: Int) {
        self.manufacturer = manufacturer
        self.price = price
        self.maxSpeedMS = maxSpeedMS
        self.engineCapacity = engineCapacity
    }
}



//3. შექმენით მინიმუმ 5-5 მანქანა და ბაიკის ინსტანსი


let kawasaki = Motorcycle(manufacturer: "Kawasaki", price: 50000, maxSpeedMS: 290, engineCapacity: 5)
let Ducati = Motorcycle(manufacturer: "Ducati", price: 40000, maxSpeedMS: 280, engineCapacity: 4)
let harleyDavidson = Motorcycle(manufacturer: "Harley-Davidson", price: 100000, maxSpeedMS: 360, engineCapacity: 7)
let suzuki = Motorcycle(manufacturer: "Suzuki", price: 25000, maxSpeedMS: 260, engineCapacity: 4)
let honda = Motorcycle(manufacturer: "Honda", price: 15000, maxSpeedMS: 270, engineCapacity: 5)
let Mercedes = Car(manufacturer: "Mercedes", buildYear: 2022, price: 80000, maxSpeedInKm: 280)
let bmw = Car(manufacturer: "BMW", buildYear: 2017, price: 75000, maxSpeedInKm: 290)
let ferrari = Car(manufacturer: "Ferrari", buildYear: 2024, price: 1000000, maxSpeedInKm: 370)
let audi = Car(manufacturer: "Audi", buildYear: 2011, price: 25000, maxSpeedInKm: 270)
let toyota = Car(manufacturer: "Toyota", buildYear: 2009, price: 10000, maxSpeedInKm: 220)


//4. შექმენით პროტოკოლი Movable რომელსაც აქვს move() ფუნცქცია და maxSpeedInMiles { get }
/*
 კმ -> მილში Km * 0.621371
 მ/წმ -> მილში MS * 2.23694
 */

protocol Movable {
    
    func move()
    var maxSpeedInMiles: Double { get }
}



//5. შექმენით პროტოკოლი Upgradable რომელსაც აქვს upgrade(speedby: Double) ფუნცქცია

protocol Upgradable {
    func upgrade(speedby: Double)
}




//6. შექმენით typalias UpgradableMovable
//გადაფარეთ UpgradableMovable პროტოკოლი თითოეულ კლასში.

// move ში Car შემთხვევაში დაბეჭდეთ "Car მწარმოებელი ვინც იქნება ის is moving)" upgrade ით გაზარდეთ maxSpeedInKm
//Motorcycle ში შემთხვევაში დაბეჭდეთ "Motorcycle მწარმოებელი ვინც იქნება  is moving with max speed: \(maxSpeedMS)")" upgrade ით გაზარდეთ maxSpeedMS

// შექმენით typealias UpgradableMovable, რომელიც შეერთებს Movable და Upgradable პროტოკოლებს


typealias UpgradableMovable = Upgradable & Movable

extension Car: UpgradableMovable {
    func upgrade(speedby: Double) {
        self.maxSpeedInKm += speedby
    }
    
    func move() {
        print(self.manufacturer + " is moving")
    }
    
    var maxSpeedInMiles: Double {
        maxSpeedInKm * 0.621371
    }
    
    
}

extension Motorcycle: UpgradableMovable {
    func upgrade(speedby: Double) {
        self.maxSpeedMS += speedby
    }
    
    func move() {
        print("\(self.manufacturer) is moving with max speed: \(maxSpeedMS)")
    }
    
    var maxSpeedInMiles: Double {
        maxSpeedMS * 2.23694
    }
    
    
}



//7. შექმენით ახალი მასივი allTransport და ჩასვით შიგნით ყველა ტრანსპორტი


var allTransport: [UpgradableMovable] = [kawasaki, Ducati, harleyDavidson, suzuki, honda, Mercedes, bmw, ferrari, audi, toyota]



//8. რენდომად 4 ელემენტს განუახლეთ სისწრაფე upgrade(speed by: Double), რენდომ ერთეულით 0...100 ის შუალედში


honda.upgrade(speedby: 55)
ferrari.upgrade(speedby: 99)
Mercedes.upgrade(speedby: 77)
audi.upgrade(speedby: 66)


/*var randomElements: Set<UpgradableMovable>() = []

while randomElements.count < 4 {
    let randomIndex = Int.random(in: 0..<allTransport.count)
        randomElements.insert(allTransport[randomIndex])
}

for transport in randomElements {
    let randomSpeedIncrease = Double.random(in: 0...100)
    transport.upgrade(speedby: randomSpeedIncrease)
}
*/

//9. დაასორტირეთ maxSpeedInMiles ის ზრდადობის მიხედვით

var sortedTransport = allTransport.sorted { transport1, transport2 in
    transport1.maxSpeedInMiles < transport2.maxSpeedInMiles
}



/*10. ეს ამ დასორტირებულ მასივზე გამოიძახეთ foreach ფუნქცია და დაბეჭდეთ თითოეული ელემენტისთვის. მაგ
 print("\n")
 მოძრაობის ფუნქცია (მაგ. "Car BMW  is moving")
 maxSpeedInMiles
 print("------")
 */

sortedTransport.forEach { transport in
    print("\n")
    transport.move()
    print(transport.maxSpeedInMiles)
    print("------")
}

