//
//  Person.swift
//  project10
//
//  Created by Li on 2/7/20.
//  Copyright © 2020 Li. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
