//
//  TabsView.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 20.12.2023.
//

import SwiftUI

struct TabsView: View {

    @State private var currentTab: String = "BMI"

    var body: some View {
        TabView(selection: $currentTab){
            
            BMIView(currentTab: $currentTab)
                .tag("BMI")
                .tabItem {
                    Image(systemName: "ruler.fill")
                    Text("BMI")
                }
            
            TargetView(currentTab: $currentTab)
                .tag("Target")
                .tabItem {
                    Image(systemName: "target")
                    Text("Target")
                }
            
            EnterBMIView(currentTab: $currentTab)
                .tag("EnterBMI")
                .tabItem {
                    Image(systemName: "plus.circle")
                        
                }
            
            ChartView(currentTab: $currentTab)
                .tag("Chart")
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("Chart")
                }
            
            ProfileView(currentTab: $currentTab)
                .tag("Profile")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    TabsView()
}
