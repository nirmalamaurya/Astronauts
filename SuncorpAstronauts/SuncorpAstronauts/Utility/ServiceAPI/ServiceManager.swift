//
//  ServiceManager.swift
//  SuncorpAstronauts
//
//  Created by Nirmala on 10/6/21.
//

import Foundation
import Alamofire

let BASE_URL = "http://spacelaunchnow.me/api/3.5.0/astronaut/"


enum ErrorTypes : Error {
    case networkError
    case badUrl
    case invalidResponse
}

typealias successHandler = ([Astronaut])->()
typealias errorHandler = (ErrorTypes)->()

protocol RequestHandler {
    
    func getAstronauts( successHandler : @escaping (Data)->(), errorHandler : @escaping errorHandler )
}

enum AstronautUrlType: String {
    case list
    case detail
}

struct ServiceManager : ConnectionProvider, RequestHandler {
    
    let urlType : AstronautUrlType
    let endPoint : String?
    
    init(urlType: AstronautUrlType, endPoint : String){
        self.urlType = urlType
        self.endPoint = endPoint
    }
    
    var neworkAvailable : Bool{
        get{
            isNetworkAvailable()
        }
    }
    
    func getAstronauts( successHandler: @escaping (Data)->(), errorHandler: @escaping errorHandler) {
        
        if neworkAvailable {
            
            fetchDataFromAPI { data in
                successHandler(data)
            } errorHandler: { error in
                errorHandler(.badUrl)
            }
        }
        else{
            errorHandler(.networkError)
        }
    }
    
    private func fetchDataFromAPI (successHandler: @escaping (Data)->(),
                                   errorHandler: @escaping errorHandler) {
        
        /**
         Using third party API Alamofire to reduce code managent like, Checking Network Checking and  to mange URL
         */
        do{
            AF.request(try asURL()).responseData {  responseData in
                
                guard let data =  responseData.data, responseData.response?.statusCode == 200 else{
                    errorHandler(.invalidResponse)
                    return
                }
                successHandler(data)
            }
        }
        catch{
            errorHandler(.badUrl)
        }
    }
}

extension ServiceManager : URLConvertible{
    
    func asURL() throws -> URL {
        
        return try photoUrl()
    }
    
    func photoUrl() throws -> URL {
        
        var urlString =  ""
        
        /** Here at this point, switch statement is not very useful
         urlString =  BASE_URL + endPoint!
         will also provide desired output, but when app will grow, below code will be helpful.
         */
        
        switch self.urlType {
        case .list:
            urlString = BASE_URL
        case .detail:
            urlString = BASE_URL + endPoint!
        }
        guard let url = URL(string: urlString) else {
            throw ErrorTypes.badUrl
        }
        return url
    }
    
}
