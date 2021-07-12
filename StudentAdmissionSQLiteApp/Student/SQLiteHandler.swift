//
//  SQLiteHandler.swift
//  StudentAdmissionSQLiteApp
//
//  Created by DCS on 08/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
import SQLite3

class SQLiteHandler {
    
    
    static let shared = SQLiteHandler()
    
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
        CREATE TABLE IF NOT EXISTS student(
        id  INTEGER PRIMARY KEY AUTOINCREMENT,
        spid TEXT,
        name TEXT,
        clas TEXT,
        div TEXT,
        sem INTEGER,
        mobileno TEXT,
        password TEXT);
        """
        
        var createTableStatement:OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                
                print("student table created successfully")
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
    func insert(stud:Students, completion: @escaping ((Bool) -> Void)) {
        
        let insertStatementString = "INSERT INTO student (spid,name, clas, div, sem, mobileno,password) VALUES (?, ?, ?,?,?,?,?);"
        var insertStatement:OpaquePointer? = nil
        
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            
            
            sqlite3_bind_text(insertStatement, 1, (stud.spid as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (stud.name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (stud.clas as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (stud.div as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 5, Int32(stud.sem))
            sqlite3_bind_text(insertStatement, 6, (stud.mobileno as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 7, (stud.password as NSString).utf8String, -1, nil)
            
            
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
    func update(stud:Students, completion: @escaping ((Bool) -> Void)){
        
        let updateatementString = "UPDATE student set spid = ?, name = ?, clas = ?, div = ?, sem = ?, mobileno = ?, password = ? WHERE id = ?;"
        var updateatement:OpaquePointer? = nil
        
        
        if sqlite3_prepare_v2(db, updateatementString, -1, &updateatement, nil) == SQLITE_OK {
             sqlite3_bind_text(updateatement, 1, (stud.spid as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateatement, 2, (stud.name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateatement, 3, (stud.clas as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateatement, 4, (stud.div as NSString).utf8String, -1, nil)
            sqlite3_bind_int(updateatement, 5, Int32(stud.sem))
            sqlite3_bind_text(updateatement, 6, (stud.mobileno as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateatement, 7, (stud.password as NSString).utf8String, -1, nil)
            sqlite3_bind_int(updateatement, 8, Int32(stud.id))
            
            
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
    
    
    func updatepwd(stud:Students , completion: @escaping ((Bool) -> Void))
    {
        let updateStatementString = "UPDATE student SET password = ? WHERE id = ?;"
        var updateStatement:OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK
        {
            sqlite3_bind_text(updateStatement, 1, (stud.password as NSString).utf8String, -1, nil)
            sqlite3_bind_int(updateStatement, 2, Int32(stud.id))
            //evaluate statement
            if sqlite3_step(updateStatement) == SQLITE_DONE
            {
                print("succesful Updated")
                completion(true)
            }
            else
            {
                print("not succesfully Updated")
                completion(false)
            }
        }
        else
        {
            print("Update statement could not be proccessed")
            completion(false)
        }
        sqlite3_finalize(updateStatement)
    }
    
    
    //fetch
    func fetch() -> [Students]{
        
        let fetchementString = "SELECT * FROM student"
        var fetchStatement:OpaquePointer? = nil
        
        var stud = [Students]()
        if sqlite3_prepare_v2(db, fetchementString, -1, &fetchStatement, nil) == SQLITE_OK {

            
            while sqlite3_step(fetchStatement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(fetchStatement, 0))
                 let spid  = String(cString: sqlite3_column_text(fetchStatement, 1))
                let name  = String(cString: sqlite3_column_text(fetchStatement, 2))
                let clas  = String(cString: sqlite3_column_text(fetchStatement, 3))
                let div  = String(cString: sqlite3_column_text(fetchStatement, 4))
                let sem = Int(sqlite3_column_int(fetchStatement, 5))
                let mobileno  = String(cString: sqlite3_column_text(fetchStatement, 6))
                let password  = String(cString: sqlite3_column_text(fetchStatement, 7))
                
                stud.append(Students(id: id, spid: spid, name: name, clas: clas, div: div, sem: sem, mobileno: mobileno, password: password))
                print("\(id) | \(spid) | \(name) | \(clas) | \(div) | \(sem) | \(mobileno) | \(password)")
            }
            
        } else {
            print("fetch statemet failed")
        }
        sqlite3_finalize(fetchStatement)
        
        return stud
    }
    
    
    //delete
    
    func delete(for id:Int, completion: @escaping ((Bool) -> Void)) {
        
        let deletestatementString = "DELETE FROM student WHERE id = ?;"
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
