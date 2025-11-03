import Foundation

class NutritionCalculator {
    static let shared = NutritionCalculator()
    
    func calculateBMR(
        weight: Double,
        height: Double,
        age: Int,
        biologicalSex: BiologicalSex
    ) -> Double {
        let bmr: Double
        switch biologicalSex {
        case .male:
            bmr = (10 * weight) + (6.25 * height) - (5 * Double(age)) + 5
        case .female:
            bmr = (10 * weight) + (6.25 * height) - (5 * Double(age)) - 161
        }
        return bmr
    }
    
    func calculateTDEE(bmr: Double, activityLevel: ActivityLevel) -> Int {
        Int(bmr * activityLevel.multiplier)
    }
    
    func recommendedMacros(
        calories: Int,
        dietaryPreference: DietaryPreference
    ) -> (protein: Double, fats: Double, carbs: Double) {
        let caloriesDouble = Double(calories)
        
        switch dietaryPreference {
        case .omnivore, .pescatarian:
            return (
                protein: (caloriesDouble * 0.30) / 4,
                fats: (caloriesDouble * 0.30) / 9,
                carbs: (caloriesDouble * 0.40) / 4
            )
        case .vegetarian:
            return (
                protein: (caloriesDouble * 0.25) / 4,
                fats: (caloriesDouble * 0.30) / 9,
                carbs: (caloriesDouble * 0.45) / 4
            )
        case .vegan:
            return (
                protein: (caloriesDouble * 0.20) / 4,
                fats: (caloriesDouble * 0.30) / 9,
                carbs: (caloriesDouble * 0.50) / 4
            )
        }
    }
}
