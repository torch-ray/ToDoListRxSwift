import Foundation
import RxSwift

class MemoryStorage: MemoryStorageType {
    
    //Dummy Data
    private var list = [
        ToDoList(title: "RxSwift 공부하기", content: "RxSwift 활용하여 앱만들어보기", insertDate: Date().addingTimeInterval(-10)),
        ToDoList(title: "Delegate Proxy 공부하기", content: "오... 공부할거 너무 많다", insertDate: Date().addingTimeInterval(-20))
    ]
    
    private lazy var store = BehaviorSubject<[ToDoList]>(value: list)
    
    @discardableResult
    func createList(title: String, content: String) -> Observable<ToDoList> {
        let todoList = ToDoList(title: title, content: content)
        list.insert(todoList, at: 0)
        store.onNext(list)
        return Observable.just(todoList)
    }
    
    @discardableResult
    func lookupList() -> Observable<[ToDoList]> {
        return store
    }
    
    @discardableResult
    func update(list: ToDoList, title: String, content: String) -> Observable<ToDoList> {
        let updated = ToDoList(original: list, title: title, updateContent: content)
        if let index = self.list.firstIndex(where: { $0 == list}) {
            self.list.remove(at: index)
            self.list.insert(updated, at: index)
        }
        store.onNext(self.list)
        return Observable.just(updated)
    }
    
    @discardableResult
    func delete(list: ToDoList) -> Observable<ToDoList> {
        if let index = self.list.firstIndex(where: { $0 == list}) {
            self.list.remove(at: index)
        }
        store.onNext(self.list)
        return Observable.just(list)
    }
    
    
}
