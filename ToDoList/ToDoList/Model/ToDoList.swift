import Foundation

struct ToDoList: Equatable {
    var title: String
    var content: String
    var insertDate: Date
    var identity: String
    
    init(title: String, content: String, insertDate: Date = Date()) {
        self.title = title
        self.content = content
        self.insertDate = insertDate
        self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    init(original: ToDoList, title: String, updateContent: String) {
        self = original
        self.title = title
        self.content = updateContent
    }
}
