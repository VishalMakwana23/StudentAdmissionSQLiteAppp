//
//  Students.swift
//  StudentAdmissionSQLiteApp
//
//  Created by DCS on 08/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation

class Students {
    var id:Int = 0
    var spid:String = ""
    var name:String = ""
    var clas:String = ""
    var div:String = ""
    var sem:Int = 0
    var mobileno:String = ""
    var password:String = ""
    
    init(id:Int, spid:String, name:String, clas:String, div:String, sem:Int, mobileno:String, password:String){
        
        self.id = id
        self.spid = spid
        self.name = name
        self.clas = clas
        self.div = div
        self.sem = sem
        self.mobileno = mobileno
        self.password = password
    }
}
