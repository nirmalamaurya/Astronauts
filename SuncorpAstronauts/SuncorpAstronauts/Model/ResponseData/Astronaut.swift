//
//  Astronaut.swift
//  SuncorpAstronauts
//
//  Created by Nirmala on 19/6/21.
//

import Foundation


extension Astronaut {
    func makeImageUrl() -> URL? {
        let urlString:String = profile_image_thumbnail ?? ""
        return URL(string: urlString)
    }
}

struct Astronaut : Codable {
    
    let id : Int?
    let name : String?
    let nationality : String?
    let profile_image_thumbnail :String?
    let bio :String?
    let date_of_birth : String?
    
    /** As of now, this data is not being used, hence commented */
    /*
   
    let url : String?
    let status :[Status]?
    let type : [Status]?
    let date_of_birth : String?
    let date_of_death : String?
    let bio :String?
    let twitter:String?
    let instagram :String?
    let wiki : String?
    let agency : [Agency]?
    let profile_image : String?
    let last_flight : String?
    let first_flight : String?
 */
}
