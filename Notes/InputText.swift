//
//  InputText.swift
//  Notes
//
//  Created by Nikita Fedotov on 09.02.2024.
//

import UIKit

class InputText {
    
    func displayText(in viewController: UIViewController, completion: @escaping ((String)->Void) ) {
        let alertController = UIAlertController(title: "Заметка", message: nil, preferredStyle: .alert)
        
        alertController.addTextField()
        
        let actionReady = UIAlertAction(title: "Готово", style: .default) { _ in
            if let text = alertController.textFields?[0].text, text != "" {
                completion(text)
            }
        }
        
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel)
        alertController.addAction(actionReady)
        alertController.addAction(actionCancel)
        
        viewController.present(alertController, animated: true)
        
    }

}

