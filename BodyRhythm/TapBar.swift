//
//  TapBar.swift
//  BodyRhythm
//
//  Created by Aziza Rahimova on 16/12/23.
//
import SwiftUI

enum TabbedItems: Int, CaseIterable{
    case home = 0
    case favorite
    case chat

    
    var title: String{
        switch self {
        case .home:
            return "Profile"
        case .favorite:
            return "Fitness"
        case .chat:
            return "Sleep"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "Profile"
        case .favorite:
            return "Fitness"
        case .chat:
            return "Moon"
        }
    }
}


struct MainTabbedView: View {
    @EnvironmentObject var appSettings: AppSettings
    @State var selectedTab = 0
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            
            
            TabView(selection: $selectedTab) {
                ProfileView(name: "John Doe", age: "25", weight: "70 kg", height: "180 cm", profileImage: UIImage(named: "Ikigai"))
                    .tag(0)

                FitnessPageView()
                    .tag(1)

                BookPage()
                    .tag(2)

            }
            .preferredColorScheme(appSettings.isDarkMode ? .dark : .light)
            ZStack{
                HStack{
                    ForEach((TabbedItems.allCases), id: \.self){ item in
                        Button{
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                    }
                }
                .padding(6)
            }
            .frame(height: 70)
            .background(.purple.opacity(0.6))
            .cornerRadius(35)
            .padding(.horizontal, 26)
        }
        .preferredColorScheme(appSettings.isDarkMode ? .dark : .light)
    }
    private var tabBarColor: Color {
        return appSettings.isDarkMode ? .purple.opacity(0.6) : .black.opacity(0.6)// Adjust colors as needed
        }
}

extension MainTabbedView {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        HStack(spacing: 10) {
            Spacer()
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .frame(width: 20, height: 20)
                .foregroundColor(isActive && appSettings.isDarkMode ? .black : .gray)
            if isActive {
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(isActive && appSettings.isDarkMode ? .black : .gray)
            }
            Spacer()
        }
        .frame(width: isActive ? .infinity : 60, height: 60)
        .background(isActive ? tabBarColor.opacity(0.4) : .clear)
        .cornerRadius(30)
    }
}


struct MainTabbedView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabbedView()
            .previewDevice("iPhone 12")
            .environment(\.colorScheme, .light)
            .previewDisplayName("Light Mode")
            .environmentObject(AppSettings())
        
    }
}

