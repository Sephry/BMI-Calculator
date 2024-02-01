//
//  ProfileView.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 20.12.2023.
//

import SwiftUI

struct ProfileView: View {
    @Binding var currentTab: Int

    @AppStorage("isDarkModeEnabled") var isDarkModeEnabled: Bool = false

    @State var downloadViaWifiEnabled: Bool = false
    
    let userName: String
    
    var body: some View {
                    Form {
                        Group {
                            HStack{
                                Spacer()
                                VStack {
                                    Image(systemName: "person")
                                        .resizable()
                                        .frame(width:100, height: 100, alignment: .center)
                                        .padding()
                                    Text(userName)
                                        .font(.title)
                                }
                                Spacer()
                            }
                        }
                        
                        Section(header: Text("CONTENT"), content: {
                            HStack{
                                
                                ShareLink(item: URL(string: "https://apps.apple.com/us/app/light-speedometer/id6447198696")!) {
                                            Label("Share", systemImage: "square.and.arrow.up")
                                        }
                            }

                            HStack{
                                Image(systemName: "lock.shield")
                                Text("Privacy Policy")
                            }

                        })

                        Section(header: Text("PREFRENCES"), content: {
                            HStack{
                                Image(systemName: "network")
                                Text("Language")
                            }
                            HStack{
                                Image(systemName: "moon")
                                Toggle(isOn: $isDarkModeEnabled) {
                                    Text("Dark Mode")
                                }
                            }

                        })
                    }
                
    }
}

#Preview {
    ProfileView(currentTab: .constant(1), userName: "ismail")
}
