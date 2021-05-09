import UIKit

enum Scene {
    case list(ToDoListViewModel)
    case detail(DetailViewModel)
    case compose(ComposeViewModel)
}

extension Scene {
    func instantiate(from storyboard: String = "Main") -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        
        switch self {
        case .list(let viewModel):
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ListNav") as? UINavigationController else {
                fatalError()
            }
            guard var listVC = nav.viewControllers.first as? ToDoListViewController else {
                fatalError()
            }
            listVC.bind(viewModel: viewModel)
            return nav
        case .detail(let viewModel):
            guard var detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailViewController else {
                fatalError()
            }
            detailVC.bind(viewModel: viewModel)
            return detailVC
        case .compose(let viewModel):
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ComposeNav") as? UINavigationController else {
                fatalError()
            }
            guard var composeVC = nav.viewControllers.first as? ComposeViewController else {
                fatalError()
            }
            composeVC.bind(viewModel: viewModel)
            return nav
        }
    }
}
