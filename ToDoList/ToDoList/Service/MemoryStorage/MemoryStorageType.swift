import Foundation
import RxSwift

protocol MemoryStorageType {
    
    @discardableResult
    func createList(title: String, content:String) -> Observable<ToDoList>
    
    @discardableResult
    func lookupList() -> Observable<[ToDoList]>
    
    @discardableResult
    func update(list: ToDoList, title: String, content:String) -> Observable<ToDoList>
    
    @discardableResult
    func delete(list: ToDoList) -> Observable<ToDoList>
}
