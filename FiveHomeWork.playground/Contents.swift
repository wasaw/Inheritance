import UIKit

class House {
    let address: String
    private let length: Double
    private let width: Double
    private let height: Double
    fileprivate var color = UIColor.red
    private(set) var foundationMaterial = "Бетон"
    
    init(address: String, length: Double, width: Double, height: Double) {
        self.address = address
        self.length = length
        self.width = width
        self.height = height
    }
    
    init(address: String, length: Double, width: Double, height: Double, color: UIColor) {
        self.address = address
        self.length = length
        self.width = width
        self.height = height
        self.color = color
    }
    
    public func getOccupiedArea() -> Double {
        return length * width
    }
    
    public func repaint(color: UIColor) {
        self.color = color
    }
    
    public func whoIsOwner() {
        print("Владелец отсутствует")
    }
}

class Cottage: House {
    var lawnSquare: Double
    private let haveBasement: Bool
    
    override var foundationMaterial: String {
        get {
            "Сваи"
        }
    }
    
    init(address: String, length: Double, width: Double, height: Double, lawnSquare: Double, basement: Bool) {
        self.lawnSquare = lawnSquare
        self.haveBasement = basement
        super.init(address: address, length: length, width: width, height: height)
    }
    
    func isHaveBasement() {
        if haveBasement {
            print("В этом доме есть подвальное помещение")
        } else {
            print("В этом доме отсутствует подвальное помещение")
        }
    }
    
    override func whoIsOwner() {
        print("У этого дома частный владелец")
    }
}

class ApartmentHouse: House {
    let numberOfApartments: Int
    let numberOfFlors: Int
    
    init(address: String, length: Double, width: Double, height: Double, apartments: Int, flors: Int) {
        self.numberOfApartments = apartments
        self.numberOfFlors = flors
        super.init(address: address, length: length, width: width, height: height)
    }
    
    init(address: String) {
        self.numberOfApartments = 45
        self.numberOfFlors = 9
        super.init(address: address, length: 150, width: 15, height: 35)
    }
    
    func apartmentsOnFlor() -> Int {
        return numberOfApartments / numberOfFlors
    }
    
    override func whoIsOwner() {
        print("Этим домом владеет эксплуатирующая компания")
    }
}

let someHouse = House(address: "Главная улица 15", length: 120, width: 80, height: 47)
let villageHouse = Cottage(address: "Новая аллея 18", length: 40, width: 15, height: 10, lawnSquare: 8, basement: true)
let cityHouse = ApartmentHouse(address: "Центральный проспект 94", length: 67, width: 45, height: 22, apartments: 42, flors: 7)
let typicalCityHouse = ApartmentHouse(address: "Окрайная 18")

func polymorphism() {
    var typesOfHouse = [House]()
    typesOfHouse.append(someHouse)
    typesOfHouse.append(villageHouse)
    typesOfHouse.append(cityHouse)
    
    for item in typesOfHouse {
        item.whoIsOwner()
    }
}

polymorphism()
