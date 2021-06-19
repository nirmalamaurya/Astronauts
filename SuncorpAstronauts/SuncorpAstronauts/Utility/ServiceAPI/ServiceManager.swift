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
    
    func getAstronauts( successHandler : @escaping successHandler, errorHandler : @escaping errorHandler )
}

enum AstronautUrlType: String {
    case list = ""
    case detail = "id"
}

struct ServiceManager : ConnectionProvider, RequestHandler {
    
    let urlType : AstronautUrlType
    
    init(urlType: AstronautUrlType){
        self.urlType = urlType
         }
    
    var neworkAvailable : Bool{
        get{
            isNetworkAvailable()
        }
    }
    
    func getAstronauts( successHandler: @escaping successHandler, errorHandler: @escaping errorHandler) {
        
        if neworkAvailable {
            
            fetchDataFromAPI { results in
                successHandler(results)
            } errorHandler: { error in
                errorHandler(.badUrl)
            }
        }
        else{
            errorHandler(.networkError)
        }
    }
    
    private func fetchDataFromAPI (successHandler: @escaping successHandler,
                                   errorHandler: @escaping errorHandler) {
        
        do{
            AF.request(try asURL()).responseData {  responseData in
                
                guard let data =  responseData.data, responseData.response?.statusCode == 200 else{
                    errorHandler(.invalidResponse)
                    return
                }
                if let response:ResponseData = try? JSONDecoder().decode(ResponseData.self, from: data)  {
                    successHandler(response.results)
                
            }else{
                }
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
        
        switch self.urlType {
        case .list:
            urlString = BASE_URL
        case .detail:
            urlString = BASE_URL + "/"
        }
        guard let url = URL(string: urlString) else {
            throw ErrorTypes.badUrl
        }
        
        
        return url
    }
    
}
