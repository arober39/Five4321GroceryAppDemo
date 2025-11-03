import Foundation

enum DietaryPreference: String, Codable, CaseIterable {
    case omnivore = "Omnivore"
    case vegetarian = "Vegetarian"
    case vegan = "Vegan"
    case pescatarian = "Pescatarian"
    
    var icon: String {
        switch self {
        case .omnivore: return "fork.knife"
        case .vegetarian: return "leaf"
        case .vegan: return "leaf.fill"
        case .pescatarian: return "fish"
        }
    }
}

enum CookingSkillLevel: String, Codable, CaseIterable {
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"
    
    var description: String {
        switch self {
        case .beginner: return "Just starting out"
        case .intermediate: return "Comfortable in the kitchen"
        case .advanced: return "Experienced home cook"
        }
    }
}

enum ActivityLevel: String, Codable, CaseIterable {
    case sedentary = "Sedentary"
    case light = "Light"
    case moderate = "Moderate"
    case active = "Active"
    case veryActive = "Very Active"
    
    var multiplier: Double {
        switch self {
        case .sedentary: return 1.2
        case .light: return 1.375
        case .moderate: return 1.55
        case .active: return 1.725
        case .veryActive: return 1.9
        }
    }
    
    var description: String {
        switch self {
        case .sedentary: return "Little to no exercise"
        case .light: return "Light exercise 1-3 days/week"
        case .moderate: return "Moderate exercise 3-5 days/week"
        case .active: return "Heavy exercise 6-7 days/week"
        case .veryActive: return "Very heavy exercise, physical job"
        }
    }
}

enum BiologicalSex: String, Codable {
    case male = "Male"
    case female = "Female"
}
