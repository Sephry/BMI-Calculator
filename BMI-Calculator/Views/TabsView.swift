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
//                                    .foregroundColor(selectedTab == item.rawValue ? .red : .gray)
                                    .foregroundColor(.teal)
                                    .offset(y: -30)
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
                                    .foregroundColor(.black)
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
                .background(
                    LinearGradient(gradient: Gradient(colors: [.green, .teal]), startPoint: .top, endPoint: .bottom)
                )
            }
        }
    }
}

#Preview {
    TabsView()
}
