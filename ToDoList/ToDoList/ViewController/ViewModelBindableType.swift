import UIKit

protocol ViewModelBindableType {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType { get set }
    func bindViewModel()
}

extension ViewModelBindableType where Self: UIViewController {
    // 개별 뷰 컨트롤러에서 바인드 뷰모델 메서드를 직접호출할 필요가 없도록(코드 간결성)
    mutating func bind(viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        loadView()
        bindViewModel()
    }
}
