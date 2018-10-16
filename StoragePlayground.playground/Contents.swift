
//: Playground - noun: a place where people can play

import UIKit
// получить папку ДОКУМЕНТЫ для текущего приложения и пользователя
let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
print(directory.absoluteString)
let url = directory.appendingPathComponent("notes").appendingPathExtension("plist")
print(url.absoluteString)

//Заметка
struct Note: Codable {
    //Заголовок заметки
    let title: String
    let text: String
    let timestamp: Date
    
}

let note = Note(title: "Список покупок", text: "Яблоки, груши", timestamp: Date())
let notes = [
    Note(title: "Список покупок", text: "Яблоки, груши, сыр", timestamp: Date()),
    Note(title: "Список дел", text: "Яблоки, груши", timestamp: Date()),
    Note(title: "Важное", text: "Яблоки, груши", timestamp: Date()),
    Note(title: "Почитать", text: "Яблоки, груши", timestamp: Date()),
    Note(title: "Расходы", text: "Яблоки, груши", timestamp: Date()),
    Note(title: "Идеи", text: "Яблоки, груши", timestamp: Date()),

]
// создаем
let encoder = PropertyListEncoder()
if let encodedNote = try? encoder.encode(notes) {
    print(encodedNote)
    try? encodedNote.write(to: url, options: .noFileProtection)
    if let data = try? Data(contentsOf: url) {
    
    let decoder = PropertyListDecoder()
    
    if let decodedNote = try? decoder.decode([Note].self, from: data) {
        print(decodedNote)
        }
    }
}
