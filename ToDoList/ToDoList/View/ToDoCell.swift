import UIKit
import RandomColor

class ToDoCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var leadingView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellElement()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCellElement()
    }
    
    func configure(title: String, content: String) {
        let color = RC.color()
        titleLabel.text = title
        titleLabel.textColor = color
        contentLabel.text = content
        leadingView.backgroundColor = color
    }
}

private extension ToDoCell {
    private func setupCellElement() {
        layer.masksToBounds = true
        layer.cornerRadius = 5
    }
}
