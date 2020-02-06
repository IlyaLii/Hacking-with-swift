//
//  Petitions.swift
//  project7
//
//  Created by Li on 2/6/20.
//  Copyright © 2020 Li. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
