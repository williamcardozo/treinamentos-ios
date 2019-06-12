//
//  MoveListViewController.swift
//  Pokedex
//
//  Created by William Cardozo on 11/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class MoveListViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    let requestMaker = RequestMaker()
    
    var moveList = [Move]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchData()
        self.configTable()
    }
    
    private func configTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension MoveListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.moveList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "move", for: indexPath)
        
        if let moveCell = cell as? MoveTableViewCell {
            moveCell.config(with: self.moveList[indexPath.row])
        }
        
        return cell
    }
    
    
}

extension MoveListViewController: UITableViewDelegate {
 
}


extension MoveListViewController {
    
    func fetchData() {
        requestMaker.make(withEndpointUrl: .moves) { (moveList: [Move]) in
            self.moveList = moveList
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
