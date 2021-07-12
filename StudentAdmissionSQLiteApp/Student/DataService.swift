//
//  DataService.swift
//  StudentAdmissionSQLiteApp
//
//  Created by DCS on 09/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation


class DataService {
    
    static func getDocDir() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print("doc dir : \(paths[0])")
        return paths[0]
        
        
     
    
    }

}
