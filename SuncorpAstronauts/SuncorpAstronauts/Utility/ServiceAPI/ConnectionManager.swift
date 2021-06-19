//
//  ConnectionManager.swift
//  SuncorpAstronauts
//
//  Created by Nirmala on 17/6/21.
//

import Foundation
import Alamofire

protocol ConnectionProvider{
    
    func isNetworkAvailable()->Bool
}

extension ConnectionProvider{
    
    func isNetworkAvailable()->Bool{
        
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
    




