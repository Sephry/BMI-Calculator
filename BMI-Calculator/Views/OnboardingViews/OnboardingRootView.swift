import SwiftUI

struct OnboardingRootView: View {

    @Binding var userName: String
    @Binding var showOnboarding: Bool
    
    let notify = NotificationViewModel()
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.green, .teal]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer(minLength: 100)
                Image("hi")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 20)
                    

                Text("Merhaba")
                    .font(.title)
                    .foregroundColor(.white)

              Spacer()
                
                ZStack {
                    Rectangle()
                        .fill(  LinearGradient(gradient: Gradient(colors: [.white, .white]), startPoint: .bottom, endPoint: .top))
                        .frame(height: 300)
                        .cornerRadius(20)
                        .padding(.top, 20)

                    VStack {
                        Text("What's your name?")
                            .foregroundColor(.black)
                            .padding()

                        TextField("Enter your Name", text: $userName)
                            .textFieldStyle(CustomTextFieldStyle(borderColor: Color.SecondaryColor, backgroundColor: Color.PrimaryColor))
                            .foregroundColor(Color.TextColor)
                            .cornerRadius(20)
                            .padding()

                        Button(action: {
                            notify.requestNotificationAccess()
                            UserDefaults.standard.set(false, forKey: "isFirstTimeLaunch")
                            showOnboarding = false
                        }) {
                            Spacer()
                            Text("Next")
                                .padding()
                                .background(Color.PrimaryColor)
                                .foregroundColor(Color.TextColor)
                        }
                        .cornerRadius(10)
                        .padding(.top, 20)
                    }
                    .padding()
                    .foregroundColor(.white)
                }
                
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottom)
            }
            
        }.ignoresSafeArea()
    }
}

//struct OnboardingRootView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingRootView(userName: .constant("ismail"))
//    }
//}
