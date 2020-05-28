//
//  User.swift
//  SwiftUI_@Published@EnvironmentObject
//
//  Created by Paymint on 2020/05/28.
//  Copyright © 2020 Paymint. All rights reserved.
//

import Foundation

class User: ObservableObject{
    let name = "Tester Name"
    
    
    /**
     @Published를 사용한 경우
     */
    //@Published var score = 0
    
    /**
        objectWillChange를 사용한 경우
     */
    let objectWillChange = ObjectWillChangePublisher()
    var score = 0 {
        willSet {objectWillChange.send()}
    }
}
