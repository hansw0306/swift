//
//  DBManager.swift
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/08/06.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit
import SQLite3

class DBManager: NSObject {
    
    let dbPath: String = "placeDB.sqlite"
    var db:OpaquePointer?
    
    override init()
    {
        super.init()
        db = self.openDatabase()
    }
        
    //MARK:- SQLite 함수
    /**
     설명 : SQLite 파일생성, 테이블 생성, 데이터 입력
     */

    //MARK: DB를 사용할수 있게 open한다
    func openDatabase() -> OpaquePointer?
    {
        self.copyandpasteDB()
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK
        {
            print("error opening database")
            return nil
        }
        else
        {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        }
    }

    //MARK: DB로컬파일을 앱 내부에 저장한다.
    func copyandpasteDB() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let dbpath: NSString = path[0] as NSString
        
        let strdbpath =  dbpath.strings(byAppendingPaths: ["placeDB.sqlite"])[0]
        print(strdbpath)
        let fmnager  =  FileManager.default
        
        if !fmnager.fileExists(atPath: strdbpath) {
            let local  = Bundle.main.path(forResource: "placeDB", ofType: "sqlite")
            do {
                try fmnager.copyItem(atPath: local!, toPath: strdbpath)
            } catch {
                print("Error creating directory: \(error.localizedDescription)")
            }
        }
    }
    
    //MARK: createTable
    func createTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS person(Id INTEGER PRIMARY KEY,name TEXT,age INTEGER);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("person table created.")
            } else {
                print("person table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    //MARK: insert
    func insert(id:Int, name:String, age:Int)
    {
        let insertStatementString = "INSERT INTO person (Id, name, age) VALUES (?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(insertStatement, 1, Int32(id))
            sqlite3_bind_text(insertStatement, 2, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 3, Int32(age))
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    //MARK: select
    func select(selctStr:String) -> [NSObject] {
        let queryStatementString = selctStr
        var queryStatement: OpaquePointer? = nil
        var psns : [NSObject] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
//                let id = sqlite3_column_int(queryStatement, 0)
//                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
//                let year = sqlite3_column_int(queryStatement, 2)
//                psns.append(Person(id: Int(id), name: name, age: Int(year)))
//                print("Query Result:")
//                print("\(id) | \(name) | \(year)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return psns
    }
    
    //MARK: deleteByID
    func deleteByID(id:Int) {
        let deleteStatementStirng = "DELETE FROM person WHERE Id = ?;"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(deleteStatement, 1, Int32(id))
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        sqlite3_finalize(deleteStatement)
    }
    
    
    //MARK:- 지역정보 가져오는 쿼리
    func selectKorPlace() -> [KorPlace] {
        let queryStatementString = "SELECT * FROM KOR_PLACE"
        var queryStatement: OpaquePointer? = nil
        var selctData : [KorPlace] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let nameDB = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
                let codeDB = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let pxDB = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let pyDB = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                selctData.append(KorPlace(name: nameDB, code: codeDB, px: pxDB, py: pyDB))
                //print("Query Result:")
                //print("\(nameDB) | \(nameDB) | \(pxDB)| \(pyDB)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return selctData
    }
    
//MARK:- 커스텀
    func getAllPlace()->[KorPlace] {
        return self.selectKorPlace()
    }


}


//MARK:- 테이블's
class KorPlace
{
    var name: String = ""
    var code: String = ""
    var px: String = ""
    var py: String = ""
    
    init(name:String, code:String, px:String, py:String)
    {
        self.name = name
        self.code = code
        self.px = px
        self.py = py
    }
    
}
