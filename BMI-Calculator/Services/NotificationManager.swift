//
//  NotificationManager.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 26.01.2024.
//

import Foundation
import NotificationCenter
class NotificationViewModel:ObservableObject{
    @Published var notificationHourAndMinute: Date = Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date()) ?? Date()
    @Published var notificationDailyRepeatCount:Int = 2
    @Published var notificationAccess:Bool = false
    @Published var startTime:Date = Calendar.current.date(bySettingHour: 9, minute: 0, second: 0, of: Date()) ?? Date()
    @Published var endTime:Date = Calendar.current.date(bySettingHour: 22, minute: 0, second: 0, of: Date()) ?? Date()
    
    init(){
        requestNotificationAccess()
    }
    
    
    func deleteAllNotification()async throws{
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
    func requestNotificationAccess(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Access Granted")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func scheduleNotification() async throws {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        
        let content = UNMutableNotificationContent()
        content.title = "BMI Calculator App"
        content.subtitle = "Daily Guidance: Your Right to Measure BMI Has Come!"
        content.sound = UNNotificationSound.default
        
        var notificationIDs: [String] = []
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.hour = 12
        dateComponents.minute = 0
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let id = UUID().uuidString
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        try await UNUserNotificationCenter.current().add(request)
        
        notificationIDs.append(id)
    }
    
    func formattedDate(_ date: Date, bySubtractingMinutes minutes: Int) -> String {
        let calendar = Calendar.current
        //let components = calendar.dateComponents([.hour, .minute], from: date)
        let modifiedDate = calendar.date(byAdding: .minute, value: -minutes, to: date) ?? date
        let formattedTime = modifiedDate.formatDate()
        
        return "\(formattedTime)"
    }
    
}
