import SwiftUI

struct UserProfileView: View {
    @StateObject private var viewModel = UserProfileViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section("Basic Information") {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text("\(viewModel.userProfile.firstName) \(viewModel.userProfile.lastName)")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Email")
                        Spacer()
                        Text(viewModel.userProfile.email)
                            .foregroundColor(.secondary)
                    }
                }
                
                Section("Dietary Preferences") {
                    HStack {
                        Image(systemName: viewModel.userProfile.dietaryPreference.icon)
                            .foregroundColor(.green)
                        Text(viewModel.userProfile.dietaryPreference.rawValue)
                        Spacer()
                        if viewModel.userProfile.isOrganicPreferred {
                            Label("Organic", systemImage: "leaf.fill")
                                .font(.caption)
                                .foregroundColor(.green)
                        }
                    }
                }
                
                Section("Nutritional Goals") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Daily Calorie Goal")
                            .font(.subheadline)
                        Text("\(viewModel.userProfile.nutritionalGoals.dailyCalories) cal")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        HStack {
                            Text("Protein")
                                .font(.caption)
                            Spacer()
                            Text("\(Int(viewModel.userProfile.nutritionalGoals.dailyProteinG))g")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                Section("Family & Household") {
                    HStack {
                        Text("Household Size")
                        Spacer()
                        Text("\(viewModel.userProfile.householdSize)")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Image(systemName: "person.3.fill")
                        Text("Family Members")
                        Spacer()
                        Text("\(viewModel.userProfile.familyMembers.count)")
                            .foregroundColor(.secondary)
                    }
                }
                
                Section("Preferences") {
                    HStack {
                        Text("Cooking Skill")
                        Spacer()
                        Text(viewModel.userProfile.cookingSkillLevel.rawValue)
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Activity Level")
                        Spacer()
                        Text(viewModel.userProfile.activityLevel.rawValue)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    UserProfileView()
}
