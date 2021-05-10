import UIKit

class ToDoCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func configure(title: String, content: String) {
        titleLabel.text = title
        contentLabel.text = content
    }
}
