//
//  Notice.swift
//  StudentAdmissionSQLiteApp
//
//  Created by DCS on 12/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation

class Notice {
    var id:Int = 0
    var name:String = ""
    var notice:String = ""

    
    init(id:Int, name:String, notice:String){
        
        self.id = id
        self.name = name
        self.notice = notice
    }
}
