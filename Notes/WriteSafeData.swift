//
//  WriteSafeData.swift
//  Notes
//
//  Created by Nikita Fedotov on 11.02.2024.
//

import Foundation


class Layout {
    
    var Write: [String] = []
    
    init() {
        loadData()
    }
    
    func addWrite(nameWrite: String) {
        Write.append(nameWrite)
        saveData()
    }
    
    func removeWrite(atIndex index: Int) {
        Write.remove(at: index)
        saveData()
    }

    func changeWrite(atIndex index: Int, newWrite: String) {
        Write[index] = newWrite
        saveData()
    }

    func saveData() {
        UserDefaults.standard.set(Write, forKey: "NotesTextKey")
        UserDefaults.standard.synchronize()
    }

    func loadData() {
        if let array = UserDefaults.standard.array(forKey: "NotesTextKey") as? [String] {
            Write = array
            
        } else {
            Write = ["Написать приложение Заметки"]
        }
 
    }

}
