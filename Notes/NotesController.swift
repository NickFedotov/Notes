//
//  NotesController.swift
//  Notes
//
//  Created by Nikita Fedotov on 09.02.2024.
//

import UIKit



//var NotesText: [String] = ["Написать приложение Заметки"]

class NotesController: UITableViewController {
    
    var layout = Layout()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func AddAction(_ sender: Any) {
        InputText().displayText(in: self) { [weak self] text in
            //NotesText.append(text)
            self?.layout.addWrite(nameWrite: text)
            self?.tableView.reloadData()
        }
        //NotesText.append("Text")
        //tableView.reloadData()
    }
    // MARK: - Table view data source

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        //return NotesText.count
        return layout.Write.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var form = UIListContentConfiguration.cell()
        //form.text = NotesText[indexPath.row]
        form.text = layout.Write[indexPath.row]
        
        cell.contentConfiguration = form
       

        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "Удалить") { _, _, hideSwipe
            in
            self.layout.removeWrite(atIndex: indexPath.row)
            //NotesText.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            hideSwipe(true)
        }
        
        return UISwipeActionsConfiguration(actions: [action])

        }
        
    

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .normal, title: "Изменить") { _, _, hideSwipe
            in
            InputText().displayText(in: self) { [weak self] text in
                self?.layout.changeWrite(atIndex: indexPath.row, newWrite: text)
                
                //NotesText.remove(at: indexPath.row)
                //NotesText.insert(text, at: indexPath.row)
                
                self?.tableView.reloadData()
            }
            hideSwipe(true)

        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
}
