import Foundation

struct UserProfile: Identifiable, Codable {
    let id: UUID
    var email: String
    var firstName: String
    var lastName: String
    
    var dietaryPreference: DietaryPreference
    var isOrganicPreferred: Bool
    var isNonGMOPreferred: Bool
    var location: Location
    var cookingSkillLevel: CookingSkillLevel
    var activityLevel: ActivityLevel
    
    var nutritionalGoals: NutritionalGoals
    var weeklyBudget: Decimal?
    var allergens: [Allergen]
    var householdSize: Int
    var familyMembers: [FamilyMember]
    
    var createdAt: Date
    var updatedAt: Date
    
    init(
        id: UUID = UUID(),
        email: String,
        firstName: String,
        lastName: String,
        dietaryPreference: DietaryPreference = .omnivore,
        location: Location = Location(),
        createdAt: Date = Date(),
        updatedAt: Date = Date()
    ) {
        self.id = id
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.dietaryPreference = dietaryPreference
        self.isOrganicPreferred = false
        self.isNonGMOPreferred = false
        self.location = location
        self.cookingSkillLevel = .intermediate
        self.activityLevel = .moderate
        self.nutritionalGoals = NutritionalGoals()
        self.weeklyBudget = nil
        self.allergens = []
        self.householdSize = 1
        self.familyMembers = []
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

struct Location: Codable {
    var zipCode: String
    var city: String?
    var state: String?
    var country: String
    
    init(
        zipCode: String = "",
        city: String? = nil,
        state: String? = nil,
        country: String = "US"
    ) {
        self.zipCode = zipCode
        self.city = city
        self.state = state
        self.country = country
    }
}
