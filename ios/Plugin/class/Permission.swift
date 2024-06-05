//
//  Permission.swift
//  Plugin
//
//  Created by Diadal on 04.06.24.
//  Copyright © 2024 Diadal Nigeria Ltd. All rights reserved.
//

import Foundation
import Contacts

class Permissions {

    class func contactPermission(completionHandler: @escaping (_ accessGranted: Bool) -> Void) {
        let contactStore = CNContactStore()
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            completionHandler(true)
        case .denied:
            completionHandler(false)
        case .restricted, .notDetermined:
            contactStore.requestAccess(for: .contacts) { granted, error in
                if granted {
                    completionHandler(true)
                } else {
                    DispatchQueue.main.async {
                        completionHandler(false)
                    }
                }
            }
        @unknown default:
            completionHandler(false)
        }
    }
}


