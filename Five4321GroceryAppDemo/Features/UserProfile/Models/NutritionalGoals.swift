import Foundation

struct NutritionalGoals: Codable {
    var dailyCalories: Int
    var dailyProteinG: Double
    var dailyFatsG: Double
    var dailyCarbsG: Double
    var dailyFiberG: Double
    
    var dailyVitaminCMg: Double?
    var dailyIronMg: Double?
    var dailyCalciumMg: Double?
    var dailyVitaminDMcg: Double?
    var dailyVitaminB12Mcg: Double?
    var dailyMagnesiumMg: Double?
    var dailyPotassiumMg: Double?
    var dailyZincMg: Double?
    var dailyFolateMcg: Double?
    var dailyOmega3G: Double?
    var dailyVitaminDMg: Double?
    
    init(
        dailyCalories: Int = 2000,
        dailyProteinG: Double = 50,
        dailyFatsG: Double = 65,
        dailyCarbsG: Double = 300,
        dailyFiberG: Double = 25
    ) {
        self.dailyCalories = dailyCalories
        self.dailyProteinG = dailyProteinG
        self.dailyFatsG = dailyFatsG
        self.dailyCarbsG = dailyCarbsG
        self.dailyFiberG = dailyFiberG
    }
    
    var hasMicronutrientGoals: Bool {
        dailyVitaminCMg != nil ||
        dailyIronMg != nil ||
        dailyCalciumMg != nil ||
        dailyVitaminDMg != nil ||
        dailyVitaminB12Mcg != nil ||
        dailyMagnesiumMg != nil ||
        dailyPotassiumMg != nil ||
        dailyZincMg != nil ||
        dailyFolateMcg != nil ||
        dailyOmega3G != nil
    }
}
