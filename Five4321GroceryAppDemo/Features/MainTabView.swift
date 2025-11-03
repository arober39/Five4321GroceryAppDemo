import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            GrocerySelectionView()
                .tabItem {
                    Label("Plan", systemImage: "cart.fill")
                }
            
            UserProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
        }
    }
}

#Preview {
    MainTabView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
