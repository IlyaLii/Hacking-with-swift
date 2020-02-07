//
//  Person.swift
//  project10
//
//  Created by Li on 2/7/20.
//  Copyright © 2020 Li. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as? String ?? ""
        image = coder.decodeObject(forKey: "image") as? String ?? ""
    }
    
    func encode(with coder: NSCoder) {
           coder.encode(name, forKey: "name")
           coder.encode(image, forKey: "image")
    }
}
