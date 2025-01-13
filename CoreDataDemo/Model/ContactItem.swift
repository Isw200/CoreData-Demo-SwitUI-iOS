//
//  ContactItem.swift
//  CoreDataDemo
//
//  Created by Isuru Ariyarathna on 2024-11-06.
//

import Foundation

struct ContactItem: Hashable {
    let name: String
    let phoneNumber: String
    
    init(name: String, phoneNumber: String) {
        self.name = name
        self.phoneNumber = phoneNumber
    }
}
