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
