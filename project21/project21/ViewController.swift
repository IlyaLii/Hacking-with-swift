//
//  ViewController.swift
//  project21
//
//  Created by Li on 2/10/20.
//  Copyright © 2020 Li. All rights reserved.
//
import UserNotifications
import UIKit

class ViewController: UIViewController {

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
}

