//
//  ViewController.swift
//  collectionviewTOdo
//
//  Created by Mohan K on 18/02/23.
//

import UIKit

class todoList: UICollectionViewCell {
    @IBOutlet weak var mytxt: UILabel!
}
class ViewController: UIViewController {

    @IBOutlet weak var myTodo: UICollectionView!
    @IBOutlet weak var enterText: UITextField!
    var TodoArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTodo.delegate = self
        myTodo.dataSource = self
        
        if let data = UserDefaults.standard.object(forKey: "todo list") as? [String]
        {
            TodoArray = data
            
        }
        else
        {
            
        }
    }

    @IBAction func updatBtn(_ sender: Any) {
        if enterText.text != ""
        {
            TodoArray.append(enterText.text!)
            UserDefaults.standard.set(TodoArray,forKey: "todolist")
            myTodo.reloadData()
            enterText.text = ""
        }
        else {
            
        }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TodoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = myTodo.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! todoList
        cell.mytxt.text = TodoArray[indexPath.row]
        return cell
    }
    
    
}
