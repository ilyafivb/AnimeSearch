import UIKit
import Stevia

class RatingView: UIView {

    private let stackView = UIStackView()
    private let image = UIImageView()
    var ratingLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        setupAll()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    private func setupAll() {
        setupStack()
        setupLayout()
        setupStyle()
    }
    
    private func setupStyle() {
        self.layer.cornerRadius = 15
        self.backgroundColor = .blue
        image.tintColor = .yellow
        ratingLabel.font = UIFont.boldSystemFont(ofSize: 20)
        ratingLabel.textColor = .white
    }
    
    private func setupStack() {
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(ratingLabel)
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        
        image.image = UIImage(systemName: "star.fill")
    }
    
    private func setupLayout() {
        subviews {
            stackView
        }
        stackView.Top == self.Top + 10
        stackView.Leading == self.Leading + 10
        stackView.Trailing == self.Trailing - 10
        stackView.Bottom == self.Bottom - 10
    }
}
