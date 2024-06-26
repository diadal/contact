//
//  Contacts.swift
//  Plugin
//
//  Created by Diadal on 04.06.24..
//  Copyright © 2024 Diadal Nigeria Ltd. All rights reserved.
//

import Foundation
import Contacts

class Contacts {
    class func getContactFromCNContact() throws -> [CNContact] {

        let contactStore = CNContactStore()
        let keysToFetch = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactPhoneNumbersKey,
            CNContactGivenNameKey,
            CNContactMiddleNameKey,
            CNContactFamilyNameKey,
            CNContactEmailAddressesKey,
            CNContactThumbnailImageDataKey,
            CNContactBirthdayKey,
            CNContactOrganizationNameKey,
            CNContactJobTitleKey,
            ] as [Any]

        //Get all the containers
        var allContainers: [CNContainer] = []
        allContainers = try contactStore.containers(matching: nil)


        var results: [CNContact] = []

        // Iterate all containers and append their contacts to our results array
        for container in allContainers {

            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)

            let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
            results.append(contentsOf: containerResults)
        }

        return results
    }
}


