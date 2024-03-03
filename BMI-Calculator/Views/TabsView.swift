//
//  TabsView.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 20.12.2023.
//

import SwiftUI

struct TabsView: View {
    
    @State private var selectedTab: Int = 0
    @Binding var userName: String
    var body: some View {
        ZStack(alignment:.bottom){
            VStack(spacing:0){
                TabView(selection:$selectedTab){
                    BMIView(currentTab: $selectedTab, userName: userName)
                        .tag(0)
                    
                    TargetView(currentTab: $selectedTab, userName: userName)
                        .tag(1)
                    
                    EnterBMIView(currentTab: $selectedTab, userName: userName)
                        .tag(2)
                    
                    ChartView(currentTab: $selectedTab)
                        .tag(3)
                    
                    ProfileView(currentTab: $selectedTab, userName: userName)
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
                                                Circle().style(withStroke: .white, lineWidth: 8, fill: Color.AccentColor)
                                            }
                                    }
//                                    .foregroundColor(selectedTab == item.rawValue ? .red : .gray)
                                    .foregroundColor(Color.BackgroundColor)
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
//                                    .foregroundColor(selectedTab == item.rawValue ? .black : .gray)
                                    .foregroundColor(Color.TextColor)
                                    .frame(maxWidth:.infinity)
                                    
                                }
                            }
                            .offset(y: item == .enterBmi ? -30 : 0)
                        }
                    }
                    
                    .font(.subheadline)
                    .fontWeight(.light)
                    .padding(.horizontal)
                }
                .padding(.top,5)
                .background {
                    Color.BackgroundColor
                }
            }
        }
    }
}

#Preview {
    TabsView(userName: .constant("ismail"))
}
