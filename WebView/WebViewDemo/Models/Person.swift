//
//  Person.swift
//  WebViewDemo

import Foundation
class Person {
    
    var id: Int
    
    var first_name: String
    
    var last_name: String
    
    var avatarPath: String
    
    var avatarURL: URL?
    
    init (_ json: [String: AnyObject]) {
        
        if let id = json["id"] as? Int { self.id = id }
        else { self.id = 0 }
        
        if let first_name = json["first_name"] as? String { self.first_name = first_name }
        else { self.first_name = "" }
        
        if let last_name = json["last_name"] as? String { self.last_name = last_name }
        else { self.last_name = "" }
        
        if let avatarPath = json["avatar"] as? String {
            
            self.avatarPath = avatarPath
            
            avatarURL = URL(string: avatarPath)
            
        }
        else {  self.avatarPath = "" }
        
    }
}
