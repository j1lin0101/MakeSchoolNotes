//
//  RealmHelper.swift
//  MakeSchoolNotes
//
//  Created by Jeremy Lin on 6/23/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    //static methods will go here
    static func addNote(note: Note){
        let realm = try! Realm()
        try! realm.write() {
            // save, modify, or delete some object(s) here
            realm.add(note)
        }
    }
    
    static func deleteNote(note: Note){
        let realm = try! Realm()
        try! realm.write() {
            // save, modify, or delete some object(s) here
            realm.delete(note)
        }
    }
    
    static func updateNote(noteToBeUpdated: Note, newNote: Note){
        let realm = try! Realm()
        try! realm.write(){
            noteToBeUpdated.content = newNote.content
            noteToBeUpdated.modificationTime = newNote.modificationTime
            noteToBeUpdated.title = newNote.title
        }
    }
    
    static func retrieveNotes() -> Results<Note>{
        let realm = try! Realm()
        return realm.objects(Note).sorted("modificationTime", ascending: false)
    }
}

