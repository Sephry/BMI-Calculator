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
                                    Text("İsmail KURT")
                                        .font(.title)
                                    Text("ismail.kurt@gmail.com")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Spacer()
                                    Button(action: {
                                        print("Edit Profile tapped")
                                    }) {
                                        Text("Edit Profile")
                                            .frame(minWidth: 0, maxWidth: .infinity)
                                            .font(.system(size: 18))
                                            .padding()
                                            .foregroundColor(.white)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 25)
                                                    .stroke(Color.white, lineWidth: 2)
                                            )
                                    }
                                    .background(Color.blue)
                                    .cornerRadius(25)
                                    .padding()
                                }
                                Spacer()
                            }
                        }
                        
                        Section(header: Text("CONTENT"), content: {
                            HStack{
                                Image(systemName: "square.and.arrow.up")
                                Text("Share")
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
    ProfileView(currentTab: .constant(1))
}
