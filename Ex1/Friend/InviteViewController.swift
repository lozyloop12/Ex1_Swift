//
//  InviteViewController.swift
//  Ex1
//
//  Created by LozyLoop on 20/02/2021.
//  Copyright © 2021 LozyLoop. All rights reserved.
//

import UIKit

class InviteViewController: UIViewController {
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var inviteView: UITableView!
    
    var data = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpUI()
        setupTableView()
    }
    
    private func setUpUI() {
        self.navigationController?.isNavigationBarHidden = true
        
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = #colorLiteral(red: 0.8941176471, green: 0.8941176471, blue: 0.8980392157, alpha: 1)
        searchView.layer.cornerRadius = 8
        
        data = Array.init(repeating: Person(name: "sssss", avatar: "asaa"), count: 10)
    }
    
    @IBAction func Back(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    private func setupTableView() {
        inviteView.dataSource = self
        
        inviteView.register(UINib(nibName: "InviteItemTableViewCell", bundle: nil), forCellReuseIdentifier: "InviteItemTableViewCell")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension InviteViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InviteItemTableViewCell", for: indexPath) as? InviteItemTableViewCell else {
            return UITableViewCell()
        }

        let person = data[indexPath.row]
        cell.person = person
        return cell
    }
}
