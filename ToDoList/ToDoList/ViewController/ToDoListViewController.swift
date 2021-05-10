import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class ToDoListViewController: UIViewController, ViewModelBindableType {
    
    var viewModel: ToDoListViewModel!
    @IBOutlet weak var listCollectionView: UICollectionView!
    @IBOutlet weak var addListButton: UIBarButtonItem!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        viewModel.todoList
            .bind(to: listCollectionView.rx.items(cellIdentifier: "Cell", cellType: ToDoCell.self)) { _, list, cell in
                cell.configure(title: list.title, content: list.content)
            }
            .disposed(by: rx.disposeBag)
    }
}
