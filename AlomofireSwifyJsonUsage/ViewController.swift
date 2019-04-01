//
//  ViewController.swift
//  AlomofireSwifyJsonUsage
//
//  Created by Akhil on 30/03/19.
//  Copyright © 2019 Akhil. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var myResponse : JSON? = nil
    var users = [userModel]()
     let url = "https://jsonplaceholder.typicode.com/users"
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchUserJson()
    }
    
    func fetchUserJson(){
        APIManager.sharedInstance.getUsersFromUrl(url: url) { (userResponse) in
            if userResponse != ""{
                self.myResponse = userResponse
                for i in 0...self.myResponse!.count - 1{
                    let singleUser = userModel(userJson: (self.myResponse?[i])!)
                    self.users.append(singleUser)
                }
                
                DispatchQueue.main.async {
                     self.tableView.reloadData()
                }
               
            }else{
                print("getting false sssss")
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let singleUser = users[indexPath.row]
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? userCell
        //cell?.name1.text = singleUser.name
//        cell?.textLabel?.text = singleUser.name
//        cell?.detailTextLabel?.text = singleUser.address?.city
        cell?.name.text = singleUser.phone
       // cell?.phone.text = singleUser.phone
//        cell?.city.text = singleUser.address?.city
//        cell?.phrase.text = singleUser.company?.catchPhase
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }


}

