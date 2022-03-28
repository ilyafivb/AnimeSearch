import UIKit
import Stevia
import Kingfisher

class MainTableViewCell: UITableViewCell {

    static let id = "MainTableViewCellId"
    
    private let coverImageView = UIImageView()
    private let titleView = UIView()
    private let titleAnimeLabel = UILabel()
    private let raitingView = RatingView()
    
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
        coverImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        coverImageView.layer.cornerRadius = 15
        coverImageView.clipsToBounds = true
        coverImageView.contentMode = .scaleAspectFill
        
        titleAnimeLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleAnimeLabel.numberOfLines = 0
        titleAnimeLabel.textColor = .white
        titleAnimeLabel.textAlignment = .center
        
        titleView.backgroundColor = .blue
        titleView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        titleView.layer.cornerRadius = 15
    }
    
    private func setupLayout() {
        contentView.subviews {
            coverImageView.subviews {
                raitingView
            }
            titleView
            titleAnimeLabel
        }
        coverImageView.Top == contentView.Top + 5
        coverImageView.Leading == contentView.Leading + 5
        coverImageView.Trailing == contentView.Trailing - 5
        coverImageView.Height == coverImageView.Width

        raitingView.Top == coverImageView.Top + 20
        raitingView.Leading == coverImageView.Leading + 10
        
        titleView.Top == coverImageView.Bottom
        titleView.Leading == coverImageView.Leading
        titleView.Trailing == coverImageView.Trailing
        titleView.Bottom == contentView.Bottom - 5

        titleAnimeLabel.Top == titleView.Top + 5
        titleAnimeLabel.Leading == titleView.Leading + 40
        titleAnimeLabel.Trailing == titleView.Trailing - 40
        titleAnimeLabel.Bottom == titleView.Bottom - 5
        
    }
    
    func setupCell(content: Content) {
        if let dataImage = content.attributes.coverImage {
            let url = URL(string: dataImage.original)
            coverImageView.kf.setImage(with: url)
        } else
        if let dataImage = content.attributes.posterImage {
            let url = URL(string: dataImage.original)
            coverImageView.kf.setImage(with: url)
        }
        raitingView.ratingLabel.text = content.attributes.averageRating
        titleAnimeLabel.text = content.attributes.canonicalTitle
    }
}
