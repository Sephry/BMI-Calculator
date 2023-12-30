//
//  GenderSelectionView.swift
//  BMI-Calculator
//
//  Created by Alperen Aydın on 30.12.2023.
//

import SwiftUI

struct GenderSelectionView: View {
    @Binding var isSelectedGenderMan:Bool
    var body: some View {
        HStack(spacing:0){
            HStack{
                
                Text("Male")
                    .foregroundColor(isSelectedGenderMan ? .black : .black.opacity(0.35))
                    .frame(maxWidth: .infinity)
                
            }
            .frame(height: 30)
            
            
            .background{
                if isSelectedGenderMan{
                    RoundedRectangle(cornerRadius: 10).fill(Color.PrimaryColor)
                }
                
                
                
            }
            
            .onTapGesture {
                isSelectedGenderMan = true
                
                
            }
            
            
            HStack{
                Text("Female")
                    .foregroundColor(!isSelectedGenderMan ? .black : .black.opacity(1))
                    .frame(maxWidth: .infinity)
                
            }
            .frame(height: 30)
            
            
            .background{
                if !isSelectedGenderMan{
                    RoundedRectangle(cornerRadius: 10).fill(Color.PrimaryColor)
                }
                
                
                
            }
            .onTapGesture {
                isSelectedGenderMan = false
                
            }
            
            
            
        }
        .font(.subheadline)
        .fontWeight(.semibold)
        
        .background{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.PrimaryColor.opacity(0.35))
        }
        .onTapGesture {
            isSelectedGenderMan.toggle()
        }
    }
}

#Preview {
    GenderSelectionView(isSelectedGenderMan: .constant(true))
}
