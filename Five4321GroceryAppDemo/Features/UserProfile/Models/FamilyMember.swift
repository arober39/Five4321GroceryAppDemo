import Foundation

struct FamilyMember: Identifiable, Codable {
    let id: UUID
    var name: String
    var age: Int
    var relationship: Relationship
    var biologicalSex: BiologicalSex?
    var dietaryPreference: DietaryPreference
    var activityLevel: ActivityLevel
    var allergens: [Allergen]
    var nutritionalGoals: NutritionalGoals
    var specialConsiderations: [SpecialConsideration]
    var isActive: Bool
    var createdAt: Date
    var updatedAt: Date
    
    init(
        id: UUID = UUID(),
        name: String,
        age: Int,
        relationship: Relationship,
        dietaryPreference: DietaryPreference = .omnivore,
        activityLevel: ActivityLevel = .moderate,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.age = age
        self.relationship = relationship
        self.dietaryPreference = dietaryPreference
        self.activityLevel = activityLevel
        self.allergens = []
        self.nutritionalGoals = NutritionalGoals()
        self.specialConsiderations = []
        self.isActive = true
        self.createdAt = createdAt
        self.updatedAt = createdAt
    }
}

enum Relationship: String, Codable, CaseIterable {
    case self_ = "Self"
    case spouse = "Spouse"
    case partner = "Partner"
    case child = "Child"
    case parent = "Parent"
    case sibling = "Sibling"
    case other = "Other"
    
    var displayName: String {
        self == .self_ ? "Self" : rawValue
    }
}

enum SpecialConsideration: String, Codable, CaseIterable {
    case pregnancy = "Pregnancy"
    case nursing = "Nursing"
    case growingChild = "Growing Child"
    case senior = "Senior (65+)"
    case athlete = "Athlete"
}
