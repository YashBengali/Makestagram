//
//  User.swift
//  Makestagram
//
//  Created by Yash on 7/11/18.
//  Copyright © 2018 Yash. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User {
    let uid: String
    let username: String
    private static var _current: User?
    
    static var current: User {
        guard let currentUser = _current else{
            fatalError("Error: current user dosen't exist")
        }
        return currentUser
    }
    
    static func setCurrent(_ user: User){
        _current = user
    }
    
    init(uid: String, username: String){
        self.uid = uid
        self.username = username
    }
    
    init?(snapshot: DataSnapshot){
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String
            else{
                return nil
        }
        self.uid = snapshot.key
        self.username = username
    }
}
