//
//  ViewController.swift
//  test
//
//  Created by zied alghamdi on 11/13/19.
//  Copyright © 2019 zied alghamdi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    struct Course: Decodable {
        let id: Int
        let name: String
        let link: String
        let imageUrl: String
        
        //constructor
        init (json: [String: Any]){
            id = json["id"] as? Int ?? -1
            name = json["name"] as? String ?? ""
            link = json["link"] as? String ?? ""
            imageUrl = json["imageUrl"] as? String ?? ""
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
        let jsonUrlString =  "https://api.letsbuildthatapp.com/jsondecodable/course"
               
        //https://l4gv9uqwpd.execute-api.us-west-1.amazonaws.com/prod/sensordata
               
              
       //url constructor
       guard let url = URL(string: jsonUrlString) else {return}
               
       //url session to fetch the data
       URLSession.shared.dataTask(with: url) { (data, response, err) in
                   
       //get data from the url
       guard let data = data else{return}
        
        
        //serilize the data
        do{
                       
           let course = try JSONDecoder().decode(Course.self, from: data)
         
            }catch let jsonErr{
            print("error serializing json:", jsonErr)
           }
          
               }.resume() //start the url session
   
    }


}

