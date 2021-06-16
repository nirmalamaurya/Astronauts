//
//  ServiceManager.swift
//  SuncorpAstronauts
//
//  Created by Nirmala on 10/6/21.
//

import Foundation

enum AstonautEnum{
    case List
    case Detail
    
}
let BASE_URL = "http://spacelaunchnow.me/api/3.5.0/astronaut/"

class ServiceManager {
    
    var urlString:String{
        
//        switch (AstonautEnum).self {
//        case List:
//            return BASE_URL
//        default:
//            return BASE_URL + ""
//        }
        
        return BASE_URL
//
    }


    var url = URL(string: BASE_URL)!
  static  let sharedInstance = ServiceManager()
    
    func getAstronaunts(completion:()->()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            print(data)
            
        }.resume()
        
    }

}
