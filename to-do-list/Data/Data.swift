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
        dataSource.append(Task(title: "Funcione", description: "B23456"))
        dataSource.append(Task(title: "Funci2342one", description: "B325642"))
        dataSource.append(Task(title: "Func1234ione", description: "625674B"))
        dataSource.append(Task(title: "Fun424cione", description: "523456B"))
        dataSource.append(Task(title: "Fun12341234cione", description: "B76346"))
        dataSource.append(Task(title: "Fun1342cione", description: "B"))
        dataSource.append(Task(title: "Fun3214cione", description: "12415B"))
        dataSource.append(Task(title: "Fu14ncione", description: "B3523"))
        dataSource.append(Task(title: "Fu31ncione", description: "6345B"))
        dataSource.append(Task(title: "Fu4231ncione", description: "12354B"))
        dataSource.append(Task(title: "132441234", description: "B1234"))

    }
    
    func addTask(task: Task) {
        dataSource.append(task)
    }
    
    func delete(index: Int){
        dataSource.remove(at: index)
    }
}
