//
//  data.swift
//  to-do-list
//
//  Created by David Palomino on 6/11/23.
//

import Foundation

struct Task {
    
    let title: String
    let description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}

