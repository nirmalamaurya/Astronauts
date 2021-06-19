//
//  ResponseData.swift
//  SuncorpAstronauts
//
//  Created by Nirmala on 18/6/21.
//

import Foundation

/**
 
 Although we are not using these data, but created structure for later use
 
struct Status: Codable {
    
    let id : Int?
    let name : String?
}
 
struct Agency: Codable {
    let id :Int?
    let url : String?
    let name : String?
    let featured :Bool?
    let type :String?
    let country_code : String?
    let abbrev : String?
    let description : String?
    let administrator : String?
    let founding_year :String?
    let launchers :String?
    let spacecraft : String?
    let parent : String?
    let image_url : String?
}
 
 */



struct ResponseData : Codable {
    
   //let count : Int?
   //let next :String?
   //let  previous : String?
   let results : [Astronaut]
   
}
