//
//  TabsView.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 20.12.2023.
//

import SwiftUI

struct TabsView: View {
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        //        TabView(selection: $currentTab){
        //
        //            BMIView(currentTab: $currentTab)
        //                .tag("BMI")
        //                .tabItem {
        //                    Image(systemName: "ruler.fill")
        //                    Text("BMI")
        //                }
        //
        //            TargetView(currentTab: $currentTab)
        //                .tag("Target")
        //                .tabItem {
        //                    Image(systemName: "target")
        //                    Text("Target")
        //                }
        //
        //            EnterBMIView(currentTab: $currentTab)
        //                .tag("EnterBMI")
        //                .tabItem {
        //                    Image(systemName: "plus.circle")
        //                }
        //
        //            ChartView(currentTab: $currentTab)
        //                .tag("Chart")
        //                .tabItem {
        //                    Image(systemName: "chart.line.uptrend.xyaxis")
        //                    Text("Chart")
        //                }
        //
        //            ProfileView(currentTab: $currentTab)
        //                .tag("Profile")
        //                .tabItem {
        //                    Image(systemName: "person")
        //                    Text("Profile")
        //                }
        //        }
        
        ZStack(alignment:.bottom){
            
            VStack(spacing:0){
                TabView(selection:$selectedTab){
                    BMIView(currentTab: $selectedTab)
                        .tag(0)
                        .background(.red)
     
                    
                    TargetView(currentTab: $selectedTab)
                        .tag(1)
     
                    
                    EnterBMIView(currentTab: $selectedTab)
                        .tag(2)

                    
                    ChartView(currentTab: $selectedTab)
                        .tag(3)
       
                    
                    ProfileView(currentTab: $selectedTab)
                        .tag(4)
                        
                }
                
                
                ZStack{
                    HStack(alignment:.bottom){
                        ForEach(TabbedItems.allCases, id:\.self){ item in
                            
                            Button{
                                selectedTab = item.rawValue
                            }label: {
                                
                                if item == .enterBmi {
                                    VStack{
                                        Image(systemName:item.iconName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height:60)
                                            .background{
                                                Circle().style(withStroke: .white, lineWidth: 8, fill: Color.black)
                                                    
                                            }
                                           
                                            
                                    }
                                    
                                    .foregroundColor(selectedTab == item.rawValue ? .red : .gray)
                                    .offset(y:-30)
                                    .frame(maxWidth: .infinity)
                                    
                                }
                                else{
                                    VStack{
                                        Image(systemName:item.iconName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 20)
                                            
                                        Text(item.iconText)
                                    }
                                    .foregroundColor(selectedTab == item.rawValue ? .black : .gray)
                                    .frame(maxWidth:.infinity)
                                    
                                }
                        
                            }
                            
                        }
                    }
                    
                    .font(.subheadline)
                    .fontWeight(.light)
                    
                    .padding(.horizontal)
                    
                }
                .padding(.top,5)
                .background(.cyan)
                
            }
            
        }
    }
}

#Preview {
    TabsView()
}
