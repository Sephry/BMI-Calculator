import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.PrimaryColor, Color.SecondaryColor]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Privacy Policy")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("This privacy policy provides information about the collection, use, and disclosure of personal information during the use of BMI.")
                    
                    Text("Collected Information")
                        .foregroundColor(.white)
                    Text("The App may allow users to input personal information such as weight and height. This information is used to calculate the user's body mass index (BMI). The App stores personal information locally on the device and does not transmit it to any remote servers.")
                    
                    Text("Use of Information")
                        .foregroundColor(.white)
                    Text("The collected information is used to calculate the user's body mass index (BMI). This information is used for the purpose of providing a general assessment of the user's health and does not contain any personally identifiable information.")
                    
                    Text("Sharing of Information")
                        .foregroundColor(.white)
                    Text("Personal information collected by the App is not shared or sold to third parties.")
                    Text("Children's Privacy")
                        .foregroundColor(.white)
                    Text("Our application is not intended for users under the age of 13. We do not knowingly collect personal information from children. It is important for parents to monitor their children's internet usage and ensure their online privacy.")
                    Text("Changes")
                        .foregroundColor(.white)
                    Text("This privacy policy may be revised with changes and updates to our application. When a new update is released, we will publish an updated version on this page.")
                    Text("Contact")
                        .foregroundColor(.white)
                    Text("If you have any questions or concerns about our privacy policy, please feel free to contact us: ismo.kurt1234@gmail.com - alperen.aydn16@hotmail.com")
                }
                .padding()
            }
        }
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
