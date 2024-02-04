//
//  PaywallView.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 4.02.2024.
//

import SwiftUI

struct PaywallView: View {
    var body: some View {
        VStack{
            Image("paywallImage")
                .resizable()
            //                .frame(height: UIScreen.main.bounds.height/2)
                .aspectRatio(contentMode: .fit)
            
            HStack{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 20))
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 20))
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 20))
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 20))
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 20))
            }
            .padding(.bottom)
            VStack{
                Text("Get Unlimited access to your weight")
                    .font(.headline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("loss plan")
                    .font(.headline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .padding(.bottom)
            
            Spacer()
            HStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .shadow(radius: 15)
                    .frame(width: 160, height: 160)
                    .overlay {
                        VStack(alignment: .leading){
                            Text("Weekly Plan")
                                .font(.title2)
                            Text("$9 per week")
                                .font(.headline)
                                .foregroundStyle(.gray)
                            Spacer()
                        }
                        .padding(.top)
                    }
                    .padding(.leading, 20)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .shadow(radius: 15)
                    .frame(width: 160, height: 160)
                    .overlay {
                        VStack(alignment: .leading){
                            Text("6-Mounth Plan")
                                .font(.title2)
                            Text("$39.99 per 6-mounth")
                                .font(.headline)
                                .foregroundStyle(.gray)
                            Text("$119.99")
                                .font(.headline)
                                .strikethrough()
                            Spacer()
                        }
                        .padding(.top)
                    }
                    .padding(.horizontal, 20)
            }
            .padding(.bottom)
            HStack{
                Spacer()
                
                Button("CONTINUE", action: paywallLogic)
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 20)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.PrimaryColor)
                    .cornerRadius(20)
                
                Spacer()
            }
            .padding()
            
            Spacer()
        }
        
    }
    
    func paywallLogic() {
        print("clicked")
    }
}

#Preview {
    PaywallView()
}
