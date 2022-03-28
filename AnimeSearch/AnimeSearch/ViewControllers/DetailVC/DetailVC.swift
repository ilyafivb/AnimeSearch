import UIKit
import Stevia
import Kingfisher
import AVKit

class DetailVC: UIViewController {
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    private let descriptionLabel = UILabel()
    private let canonicalTitleLabel = UILabel()
    private let startDateLabel = UILabel()
    private let endDateLabel = UILabel()
    private let ageRatingGuideLabel = UILabel()
    private let statusLabel = UILabel()
    private let posterImageView = UIImageView()
    private let episodeCountLabel = UILabel()
    private let episodeLengthLabel = UILabel()
    private let showTypeLabel = UILabel()
    private let trailerButton = UIButton()
    
    var content: Content?

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAll()
    }
    
    //MARK: - Setup
    
    private func setupAll() {
        setupImage()
        setupStyle()
        setupButton()
        setupStack()
        setupLayout()
    }
    
    private func setupImage() {
        if let dataImage = content?.attributes.posterImage {
            let url = URL(string: dataImage.original)
            posterImageView.kf.setImage(with: url)
        } else if let dataImage = content?.attributes.coverImage {
            let url = URL(string: dataImage.original)
            posterImageView.kf.setImage(with: url)
        }
    }
    
    private func setupButton() {
        if content?.attributes.youtubeVideoId == nil {
            trailerButton.isHidden = true
        } else {
            trailerButton.isHidden = false
        }
        trailerButton.setTitle("Click to see Trailer", for: .normal)
        trailerButton.addTarget(self, action: #selector(showTrailer), for: .touchUpInside)
    }
    
    private func setupStyle() {
        view.backgroundColor = .white
        canonicalTitleLabel.text = content?.attributes.canonicalTitle
        canonicalTitleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        canonicalTitleLabel.textAlignment = .center
        canonicalTitleLabel.numberOfLines = 0
        
        posterImageView.layer.cornerRadius = 15
        posterImageView.clipsToBounds = true
        posterImageView.contentMode = .scaleAspectFill
        
        trailerButton.titleLabel?.fillContainer(padding: 10)
        trailerButton.backgroundColor = .blue
        trailerButton.layer.cornerRadius = 15
        
        descriptionLabel.text = content?.attributes.description
        descriptionLabel.font = UIFont.systemFont(ofSize: 20)
        descriptionLabel.numberOfLines = 0
    }
    
    private func setupStack() {
        stackView.addArrangedSubview(startDateLabel)
        stackView.addArrangedSubview(endDateLabel)
        stackView.addArrangedSubview(ageRatingGuideLabel)
        stackView.addArrangedSubview(statusLabel)
        stackView.addArrangedSubview(episodeCountLabel)
        stackView.addArrangedSubview(episodeLengthLabel)
        stackView.addArrangedSubview(showTypeLabel)
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        
        startDateLabel.text = "Start date: \(content?.attributes.startDate ?? "")"
        endDateLabel.text = "End date: \(content?.attributes.endDate ?? "")"
        ageRatingGuideLabel.text = "Age rating: \(content?.attributes.ageRatingGuide ?? "")"
        statusLabel.text = "Status: \(content?.attributes.status ?? "")"
        episodeCountLabel.text = "Episode count: \(content?.attributes.episodeCount?.description ?? "")"
        episodeLengthLabel.text = "Episode length: \(content?.attributes.episodeLength?.description ?? "") min."
        showTypeLabel.text = "Type: \(content?.attributes.showType ?? "")"
    }
    
    private func setupLayout() {
        view.subviews {
            scrollView.subviews {
                canonicalTitleLabel
                posterImageView
                trailerButton
                descriptionLabel
                stackView
            }
        }
        scrollView.fillContainer()

        canonicalTitleLabel.Top == scrollView.Top + 20
        canonicalTitleLabel.Leading == view.Leading + 10
        canonicalTitleLabel.Trailing == view.Trailing - 10
        
        posterImageView.Top == canonicalTitleLabel.Bottom + 20
        posterImageView.Leading == canonicalTitleLabel.Leading
        posterImageView.Trailing == canonicalTitleLabel.Trailing
        posterImageView.Height == posterImageView.Width
        
        trailerButton.Trailing == posterImageView.Trailing - 20
        trailerButton.Bottom == posterImageView.Bottom - 20
        
        descriptionLabel.Top == posterImageView.Bottom + 20
        descriptionLabel.Leading == canonicalTitleLabel.Leading
        descriptionLabel.Trailing == canonicalTitleLabel.Trailing
        
        stackView.Top == descriptionLabel.Bottom + 20
        stackView.Leading == canonicalTitleLabel.Leading
        stackView.Trailing == canonicalTitleLabel.Trailing
        stackView.Bottom == scrollView.Bottom - 20
    }
    
    @objc func showTrailer() {
        
        let player = YouTubePlayerVC()
        player.content = content
        navigationController?.pushViewController(player, animated: true)
    }
}
