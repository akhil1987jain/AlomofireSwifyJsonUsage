//
//  APIManager.swift
//  AlomofireSwifyJsonUsage
//
//  Created by Akhil on 31/03/19.
//  Copyright © 2019 Akhil. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager {
    static var sharedInstance = APIManager()
    private init(){}
    
    func getUsersFromUrl(url: String, onCompletion:@escaping (JSON)-> Void){
         
        Alamofire.request(url).responseJSON { response in
            switch response.result{
            case .success(let data):
                print("succesfully grab data:", data)
                let response = JSON(data)
                onCompletion(response)
                
            case .failure(let error):
                print("error:", error)
                let error = JSON(error)
                onCompletion(error)
            }
        }
    }
}
