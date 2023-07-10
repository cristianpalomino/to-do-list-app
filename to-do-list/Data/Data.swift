//
//  Data.swift
//  to-do-list
//
//  Created by David Palomino on 6/13/23.
//

import Foundation

var data = Data()

class Data {
    
    var dataSource: [Task] = []
    
    init() {
        dataSource.append(Task(title: "Funcione", description: "B"))
    }
    
    func addTask(task: Task) {
        dataSource.append(task)
    }
    
    func delete(index: Int){
        dataSource.remove(at: index)
    }
}
