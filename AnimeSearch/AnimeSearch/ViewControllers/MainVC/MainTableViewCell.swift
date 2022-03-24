import UIKit
import Stevia
import Kingfisher

class MainTableViewCell: UITableViewCell {

    static let id = "MainTableViewCellId"
    
    private let posterImageView = UIImageView()
    private let stackView = UIStackView()
    private let idLabel = UILabel()
    private let typeLabel = UILabel()
    private let createdAtLabel = UILabel()
    private let updatedAtLabel = UILabel()
    private let slugLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAll()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAll() {
        setupStack()
        setupLayout()
    }
    
    private func setupStack() {
        stackView.addArrangedSubview(idLabel)
        stackView.addArrangedSubview(typeLabel)
        stackView.addArrangedSubview(createdAtLabel)
        stackView.addArrangedSubview(updatedAtLabel)
        stackView.addArrangedSubview(slugLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        
        descriptionLabel.numberOfLines = 0
    }
    
    private func setupLayout() {
        contentView.subviews {
            posterImageView
            stackView
        }
        posterImageView.layer.cornerRadius = 50
        posterImageView.clipsToBounds = true
        posterImageView.Top == contentView.Top + 20
        posterImageView.Leading == contentView.Leading + 20
        posterImageView.Trailing == contentView.Trailing - 20
        posterImageView.Height == posterImageView.Width
        stackView.Top == posterImageView.Bottom + 20
        stackView.Leading == contentView.Leading + 20
        stackView.Trailing == contentView.Trailing - 20
        stackView.Bottom == contentView.Bottom - 20
    }
    
    func setupCell(anime: Anime) {
        if let url = URL(string: anime.attributes!.posterImage.original) {
            posterImageView.kf.setImage(with: url)
        }

        createdAtLabel.text = anime.attributes?.createdAt
        updatedAtLabel.text = anime.attributes?.updatedAt
        slugLabel.text = anime.attributes?.slug
        descriptionLabel.text = anime.attributes?.description
    }
    
}
