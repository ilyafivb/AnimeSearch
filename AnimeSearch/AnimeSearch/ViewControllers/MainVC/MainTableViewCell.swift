import UIKit
import Stevia
import Kingfisher

class MainTableViewCell: UITableViewCell {

    static let id = "MainTableViewCellId"
    
    private let coverImageView = UIImageView()
    private let titleView = UIView()
    private let ratingButton = UIButton()
    private let titleAnimeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAll()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    private func setupAll() {
        setupStyle()
        setupLayout()
    }
    
    private func setupStyle() {
        coverImageView.layer.cornerRadius = 15
        coverImageView.clipsToBounds = true
        coverImageView.contentMode = .scaleAspectFill
        
        titleAnimeLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleAnimeLabel.numberOfLines = 0
        titleAnimeLabel.textColor = .white
        titleAnimeLabel.textAlignment = .center
        
        titleView.backgroundColor = .blue
                
        ratingButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        ratingButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        ratingButton.backgroundColor = .blue
        ratingButton.tintColor = .yellow
        ratingButton.layer.cornerRadius = 10
    }
    
    private func setupLayout() {
        contentView.subviews {
            coverImageView.subviews {
                ratingButton
                titleView
                titleAnimeLabel
            }
        }
        coverImageView.Top == contentView.Top + 5
        coverImageView.Leading == contentView.Leading + 5
        coverImageView.Trailing == contentView.Trailing - 5
        coverImageView.Height == coverImageView.Width
        coverImageView.Bottom == contentView.Bottom - 5

        ratingButton.Top == coverImageView.Top + 20
        ratingButton.Leading == coverImageView.Leading + 10
        
        titleAnimeLabel.Bottom == coverImageView.Bottom - 10
        titleAnimeLabel.Leading == coverImageView.Leading + 40
        titleAnimeLabel.Trailing == coverImageView.Trailing - 40
        
        titleView.Top == titleAnimeLabel.Top - 10
        titleView.Leading == coverImageView.Leading
        titleView.Trailing == coverImageView.Trailing
        titleView.Bottom == coverImageView.Bottom
    }
    
    func setupCell(anime: Anime) {
        if let dataImage = anime.attributes?.coverImage {
            let url = URL(string: dataImage.original)
            coverImageView.kf.setImage(with: url)
        } else
        if let dataImage = anime.attributes?.posterImage {
            let url = URL(string: dataImage.original)
            coverImageView.kf.setImage(with: url)
        }
        ratingButton.setTitle(anime.attributes?.averageRating, for: .normal)
        titleAnimeLabel.text = anime.attributes?.canonicalTitle
    }
}
