//
//  API.swift
//  WebViewDemo
//


import Foundation
import Alamofire

final class Webservice{
    
    static let shared = Webservice()
    
    init(){
        
    }
    
    func getPerson(completion: @escaping (Person?)->()){
        
        var person: Person?
        
        Alamofire.request("https://reqres.in/api/users/2", method: .get, parameters: nil).responseJSON { (response) in
            
            if let response = response.result.value as? [String: AnyObject]{
                
                if let personData = response["data"] as? [String: AnyObject]{
                    
                    person = Person(personData)
                    
                    completion(person)
                    
                }
                
            }
            
        }
    }
    
    func passUDID(completion: @escaping (Any)->()){
        
        let UDID = UIDevice.current.identifierForVendor!.uuidString
        
        Alamofire.request("https://reqres.in/api/users/\(UDID)()", method: .get, parameters: nil).responseJSON { (response) in
            
            completion(response)
            
        }
    }
}
