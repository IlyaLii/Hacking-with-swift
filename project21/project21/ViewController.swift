//
//  ViewController.swift
//  project21
//
//  Created by Li on 2/10/20.
//  Copyright © 2020 Li. All rights reserved.
//
import UserNotifications
import UIKit

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerLocal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Shedule", style: .plain, target: self, action: #selector(sheduleLocal))
    }

    @objc func registerLocal() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.sound, .badge, .alert]) { (granted, error) in
            if granted {
                print("Greate!")
            } else {
                print("O no(")
            }
        }
    }

    @objc func sheduleLocal() {
        registerCategories()
        
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()

        let content = UNMutableNotificationContent()
        content.title = "Get up"
        content.body = "Tebya otchislyat"
        content.categoryIdentifier = "alarm"
        content.sound = .default
        content.userInfo = ["CustomData" : "Ilya"]
    
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }
    
    func registerCategories() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        let show = UNNotificationAction(identifier: "Show", title: "Tell me more...", options: .foreground)
        let remindLater = UNNotificationAction(identifier: "remind", title: "Remind me later", options: .foreground)
        let category = UNNotificationCategory(identifier: "alarm", actions: [show, remindLater], intentIdentifiers: [], options: [])
        
        center.setNotificationCategories([category])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        if let customData = userInfo["CustomData"] as? String {
            print(customData)
            
            
            var title = ""
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
                print("default")
                title = "Default"
            case "Show":
                print("show")
                title = "Show"
            case "remind":
                title = "Remind"
                sheduleLocal()
            default:
                break
            }
            let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            completionHandler()
        }
    }
}

