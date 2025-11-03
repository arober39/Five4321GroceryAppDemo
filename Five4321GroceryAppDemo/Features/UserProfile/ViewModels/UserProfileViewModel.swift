import Foundation
import Combine

@MainActor
class UserProfileViewModel: ObservableObject {
    @Published var userProfile: UserProfile
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    init(
        userProfile: UserProfile = UserProfile(
            email: "",
            firstName: "",
            lastName: ""
        )
    ) {
        self.userProfile = userProfile
    }
    
    func updateDietaryPreference(_ preference: DietaryPreference) {
        userProfile.dietaryPreference = preference
        
        let macros = NutritionCalculator.shared.recommendedMacros(
            calories: userProfile.nutritionalGoals.dailyCalories,
            dietaryPreference: preference
        )
        
        userProfile.nutritionalGoals.dailyProteinG = macros.protein
        userProfile.nutritionalGoals.dailyFatsG = macros.fats
        userProfile.nutritionalGoals.dailyCarbsG = macros.carbs
    }
    
    func toggleOrganicPreference() {
        userProfile.isOrganicPreferred.toggle()
    }
    
    func toggleNonGMOPreference() {
        userProfile.isNonGMOPreferred.toggle()
    }
    
    func addAllergen(name: String, severity: AllergenSeverity) {
        let allergen = Allergen(name: name, severity: severity)
        userProfile.allergens.append(allergen)
    }
    
    func removeAllergen(_ allergen: Allergen) {
        userProfile.allergens.removeAll { $0.id == allergen.id }
    }
    
    func addFamilyMember(_ member: FamilyMember) {
        userProfile.familyMembers.append(member)
        userProfile.householdSize = userProfile.familyMembers.count + 1
    }
    
    func removeFamilyMember(_ member: FamilyMember) {
        userProfile.familyMembers.removeAll { $0.id == member.id }
        userProfile.householdSize = userProfile.familyMembers.count + 1
    }
    
    func saveProfile() async {
        isLoading = true
        defer { isLoading = false }
        
        userProfile.updatedAt = Date()
        // TODO: Save to Core Data and sync with API
    }
}
