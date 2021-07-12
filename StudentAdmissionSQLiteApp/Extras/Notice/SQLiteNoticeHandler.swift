//
//  SQLiteNoticeHandler.swift
//  StudentAdmissionSQLiteApp
//
//  Created by DCS on 12/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
import SQLite3

class SQLiteNoticeHandler {
    
    
    static let shared = SQLiteNoticeHandler()
    
    let dbpath = "studentsDB.sqlite"
    var db:OpaquePointer?
    
    private init(){
        
        db = openDatabase()
        createTable()
    }
    
    
    //DB connection
    func openDatabase() -> OpaquePointer? {
        
        let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = docURL.appendingPathComponent(dbpath)
        
        var database: OpaquePointer? = nil
        
        if sqlite3_open(fileURL.path, &database) == SQLITE_OK {
            
            print("open connection Successfuly at : \(fileURL)")
            return database
        } else {
            
            print("database not connected")
            return nil
        }
        
    }
    
    
    
    //Create table
    func createTable() {
        
        let createTableString = """
        CREATE TABLE IF NOT EXISTS notice(
        id  INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        notice TEXT);
        """
        
        var createTableStatement:OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                
                print("notice table created successfully")
            } else {
                
                print("cant created table")
            }
            
        } else {
            
            print("table not created")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    //Crud
    
    //insert
    func insert(note:Notice, completion: @escaping ((Bool) -> Void)) {
        
        let insertStatementString = "INSERT INTO notice (name, notice) VALUES (?, ?);"
        var insertStatement:OpaquePointer? = nil
        
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            
            

            sqlite3_bind_text(insertStatement, 1, (note.name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (note.notice as NSString).utf8String, -1, nil)
           
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                
                print("insert row successfully")
                completion(true)
            } else {
                print("row not inserted")
                completion(false)
            }
            
        } else {
            print("insert statemet failed")
            completion(false)
        }
        
        sqlite3_finalize(insertStatement)
    }
    
    //update
    func update(note:Notice, completion: @escaping ((Bool) -> Void)){
        
        let updateatementString = "UPDATE notice set name = ?, notice = ? WHERE id = ?;"
        var updateatement:OpaquePointer? = nil
        
        
        if sqlite3_prepare_v2(db, updateatementString, -1, &updateatement, nil) == SQLITE_OK {
            sqlite3_bind_text(updateatement, 2, (note.name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateatement, 3, (note.notice as NSString).utf8String, -1, nil)
            sqlite3_bind_int(updateatement, 8, Int32(note.id))
            
            
            if sqlite3_step(updateatement) == SQLITE_DONE {
                
                print("row update successfully")
                completion(true)
                
            } else {
                print("row not update")
                completion(false)
            }
            
        } else {
            print("updatetatemet failed")
            completion(false)
        }
        sqlite3_finalize(updateatement)
    }
    
    //fetch
    func fetch() -> [Notice]{
        
        let fetchementString = "SELECT * FROM notice"
        var fetchStatement:OpaquePointer? = nil
        
        var note = [Notice]()
        if sqlite3_prepare_v2(db, fetchementString, -1, &fetchStatement, nil) == SQLITE_OK {
            
            
            while sqlite3_step(fetchStatement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(fetchStatement, 0))
                let name  = String(cString: sqlite3_column_text(fetchStatement, 1))
                let notice  = String(cString: sqlite3_column_text(fetchStatement, 2))
                
                note.append(Notice(id: id,name: name, notice: notice))
                print("\(id) | \(name) | \(notice) ")
            }
            
        } else {
            print("fetch statemet failed")
        }
        sqlite3_finalize(fetchStatement)
        
        return note
    }
    
    
    //delete
    
    func delete(for id:Int, completion: @escaping ((Bool) -> Void)) {
        
        let deletestatementString = "DELETE FROM notice WHERE id = ?;"
        var deletestatement:OpaquePointer? = nil
        
        
        if sqlite3_prepare_v2(db, deletestatementString, -1, &deletestatement, nil) == SQLITE_OK {
            
            sqlite3_bind_int(deletestatement, 1, Int32(id))
            
            if sqlite3_step(deletestatement) == SQLITE_DONE {
                
                print("row delete successfully")
                completion(true)
            } else {
                print("row not delete")
                completion(false)
            }
            
        } else {
            print("delete failed")
            completion(false)
        }
        sqlite3_finalize(deletestatement)
    }
    
}
