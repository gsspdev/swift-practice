public struct Synthesizer {
    
    var name: String
    var year: Int
    var polyphony: Int?
    
    enum SynthType: CustomStringConvertible {
        case analog
        case digital
        case hybrid
        
        var description: String {
            switch self {
            case .analog: return "Analog electronics"
            case .digital: return "Digital electronics"
            case .hybrid: return "Hybrid mixture of analog and digital electronics"}
        }
    }
    
    var synthtype: SynthType
    
    var isVintage: Bool { return year < 2000 }
    var vintageDecade: String? {
        switch year {
            case 1970..<1980: return "seventies"
            case 1980..<1990: return "eighties"
            case 1990..<2000: return "nineties"
            default: return "not vintage"}
    }
    
//    var isPolyphonic: String { return polyphony != nil ? "polyphonic" : "monophonic" }
    var isPolyphonic: Bool { return polyphony != nil }

    var voices: Int { return polyphony ?? 1 }
        
    // Initializer (constructor)
    init(name: String, year: Int, polyphony: Int?, synthtype: SynthType) {
        self.name = name
        self.year = year
        self.polyphony = polyphony
        self.synthtype = synthtype
    }
    
    func printSynthDetails() {
        print("Name: \(name)\nYear: \(year)\nPolyphony: \(isPolyphonic ? "Yes" : "No")\nVoices: \(voices)\nSynthType: \(synthtype)\nDetails: \(synthtype.description)\nVintage: \(isVintage ? "Yes" : "No")\nEra: \(vintageDecade ?? "not vintage")\n\n")
    }
}
                  
let arp2600 = Synthesizer(name: "Arp 2600", year: 1976, polyphony: nil, synthtype: .analog)
let moog = Synthesizer(name: "Moog", year: 1974, polyphony: 4, synthtype: .analog)
let dx7 = Synthesizer(name: "Yamaha DX7", year: 1986, polyphony: 6, synthtype: .digital)
let hydrasynth = Synthesizer(name: "Hydra Synth", year: 2020, polyphony: 12, synthtype: .hybrid)

arp2600.printSynthDetails()
moog.printSynthDetails()
dx7.printSynthDetails()
hydrasynth.printSynthDetails()




//enum Planet {
//    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
//}

//enum CompassPoint {
//    case north
//    case south
//    case east
//    case west
//}

var directionToHead = CompassPoint.east
directionToHead = .north

directionToHead = .west
switch directionToHead {
    case .north:
        print("Ah to the mountains of Vindor")
    case .south:
        print("Ro the swamps of Shoggoroth")
    case .west:
        print("Across the hills and valleys of Montehey")
    case .east:
        print("Through the funneling forests of Elroth")
}

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("great for humans")
default:
    print("not much explored by humans")
}

enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 84950, 38419, 2)
productBarcode = .qrCode("ABDFKLJSNJK")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR CODE: \(productCode).")
}

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let earthsOrder = Planet.earth.rawValue

enum CompassPoint: String {
    case north, south, east, west
}

let sunsetDirection = CompassPoint.west.rawValue




//enum ArithmeticExpression {
//    case number(Int)
//    indirect case addition(ArithmeticExpression, ArithmeticExpression)
//    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
//}

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}


let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}


print(evaluate(product))
// Prints "18"
