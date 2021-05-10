import Foundation
import RxSwift
import RxCocoa

class ToDoListViewModel:CommonViewModel {
    
    var todoList: Observable<[ToDoList]> {
        return storage.lookupList()
    }
}
