//
//  ProfileView.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 20.12.2023.
//

import SwiftUI

struct ProfileView: View {
    @Binding var currentTab: Int

    var body: some View {
        Text("Hello, World! Profile")
    }
}

#Preview {
    ProfileView(currentTab: .constant(1))
}
