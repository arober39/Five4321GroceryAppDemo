import Foundation

struct Allergen: Identifiable, Codable, Hashable {
    let id: UUID
    var name: String
    var severity: AllergenSeverity
    
    init(
        id: UUID = UUID(),
        name: String,
        severity: AllergenSeverity = .moderate
    ) {
        self.id = id
        self.name = name
        self.severity = severity
    }
}

enum AllergenSeverity: String, Codable, CaseIterable {
    case mild = "Mild"
    case moderate = "Moderate"
    case severe = "Severe"
    case lifeThreatening = "Life-Threatening"
    
    var color: String {
        switch self {
        case .mild: return "yellow"
        case .moderate: return "orange"
        case .severe: return "red"
        case .lifeThreatening: return "purple"
        }
    }
    
    var icon: String {
        switch self {
        case .mild: return "exclamationmark.triangle"
        case .moderate: return "exclamationmark.triangle.fill"
        case .severe: return "xmark.octagon"
        case .lifeThreatening: return "xmark.octagon.fill"
        }
    }
}

extension Allergen {
    static let commonAllergens = [
        "Peanuts", "Tree Nuts", "Milk", "Eggs",
        "Fish", "Shellfish", "Soy", "Wheat",
        "Sesame", "Gluten"
    ]
}
