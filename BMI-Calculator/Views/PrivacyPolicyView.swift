import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.PrimaryColor, Color.SecondaryColor]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Gizlilik Politikası")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Toplanan Bilgiler")
                        .foregroundColor(.white)
                    Text("Uygulama, kullanıcıların kilo ve boy gibi kişisel bilgileri girmesini sağlayabilir. Bu bilgiler, kullanıcının vücut kitle indeksi (BMI) hesaplanması için kullanılır. Uygulama, kişisel bilgileri cihazda yerel olarak saklar ve herhangi bir uzak sunucuya iletilmez.")
                    
                    Text("Bilgilerin Kullanımı")
                        .foregroundColor(.white)
                    Text("Toplanan bilgiler, kullanıcının vücut kitle indeksini (BMI) hesaplamak için kullanılır. Bu bilgiler, kullanıcının sağlığına ilişkin genel bir değerlendirme yapmak amacıyla kullanılır ve herhangi bir kişisel kimlik belirtisi içermez.")
                    
                    Text("Bilgilerin Paylaşılması")
                        .foregroundColor(.white)
                    Text("Uygulama tarafından toplanan kişisel bilgiler, üçüncü taraflarla paylaşılmaz veya satılmaz.")
                    Text("Çocukların Gizliliği")
                        .foregroundColor(.white)
                    Text("Uygulamamız 13 yaşın altındaki kullanıcılar için değildir. Bilerek çocukların kişisel bilgilerini toplamıyoruz. Ebeveynlerin, çocuklarının internet kullanımını denetlemesi ve çevrimiçi gizliliklerini sağlaması önemlidir.")
                    Text("Değişiklikler")
                        .foregroundColor(.white)
                    Text("Bu gizlilik politikası, uygulamamızdaki değişiklikler ve güncellemelerle birlikte gözden geçirilebilir. Yeni bir güncelleme yayınlandığında, bu sayfada güncellenmiş bir sürümünü yayınlarız.")
                    Text("İletişim")
                        .foregroundColor(.white)
                    Text("Gizlilik politikamızla ilgili herhangi bir sorunuz veya endişeniz varsa, lütfen bizimle iletişime geçmekten çekinmeyin: ismo.kurt1234@gmail.com - alperen.aydn16@hotmail.com")
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
