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
        contentView.backgroundColor = .lightGray
        
        coverImageView.layer.cornerRadius = 30
        coverImageView.clipsToBounds = true
        
        titleAnimeLabel.font = UIFont(name: "Chalkduster", size: 25)
        titleAnimeLabel.textColor = .white
        titleAnimeLabel.textAlignment = .center
        
        titleView.backgroundColor = .orange
                
        ratingButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        ratingButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        ratingButton.backgroundColor = .orange
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
        coverImageView.Top == contentView.Top + 20
        coverImageView.Leading == contentView.Leading + 20
        coverImageView.Trailing == contentView.Trailing - 20
        coverImageView.Height == coverImageView.Width
        coverImageView.Bottom == contentView.Bottom - 20

        ratingButton.Top == coverImageView.Top + 20
        ratingButton.Leading == coverImageView.Leading
        
        titleAnimeLabel.CenterY == titleView.CenterY
        titleAnimeLabel.Leading == coverImageView.Leading
        titleAnimeLabel.Trailing == coverImageView.Trailing
        
        titleView.Bottom == coverImageView.Bottom
        titleView.Leading == coverImageView.Leading
        titleView.Trailing == coverImageView.Trailing
        titleView.Height == 40
    }
    
    func setupCell(anime: Anime) {
        if let dataImage = anime.attributes?.coverImage {
            let url = URL(string: dataImage.original)
            coverImageView.kf.setImage(with: url)
        } else if let dataImage = anime.attributes?.posterImage {
            let url = URL(string: dataImage.original)
            coverImageView.kf.setImage(with: url)
        }
        ratingButton.setTitle(anime.attributes?.averageRating, for: .normal)
        titleAnimeLabel.text = anime.attributes?.canonicalTitle
        if let textLenght = titleAnimeLabel.text, textLenght.count > 30 {
            titleAnimeLabel.font = UIFont(name: "Chalkduster", size: 16)
        }
    }
}
