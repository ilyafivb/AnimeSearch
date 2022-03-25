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
    private let totalLengthLabel = UILabel()
    private let showTypeLabel = UILabel()
    private let trailerButton = UIButton()
    
    var anime: Anime?

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAll()
    }
    
    //MARK: - Setup
    
    private func setupAll() {
        setupImage()
        setupStyle()
        setupStack()
        setupLayout()
    }
    
    private func setupImage() {
        if let dataImage = anime?.attributes?.posterImage {
            let url = URL(string: dataImage.original)
            posterImageView.kf.setImage(with: url)
        } else if let dataImage = anime?.attributes?.coverImage {
            let url = URL(string: dataImage.original)
            posterImageView.kf.setImage(with: url)
        }
    }
    
    private func setupStyle() {
        view.backgroundColor = .white
        canonicalTitleLabel.text = anime?.attributes?.canonicalTitle
        canonicalTitleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        canonicalTitleLabel.textAlignment = .center
        canonicalTitleLabel.numberOfLines = 0
        
        posterImageView.layer.cornerRadius = 15
        posterImageView.clipsToBounds = true
        posterImageView.contentMode = .scaleAspectFill
        
        trailerButton.setTitle("Click to see Trailer", for: .normal)
        trailerButton.addTarget(self, action: #selector(showTrailer), for: .touchUpInside)
        trailerButton.titleLabel?.fillContainer(padding: 10)
        trailerButton.backgroundColor = .blue
        trailerButton.layer.cornerRadius = 15
        
        descriptionLabel.text = anime?.attributes?.description
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
        stackView.addArrangedSubview(totalLengthLabel)
        stackView.addArrangedSubview(showTypeLabel)
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        
        startDateLabel.text = "Start date: \(anime?.attributes?.startDate ?? "")"
        endDateLabel.text = "End date: \(anime?.attributes?.endDate ?? "")"
        ageRatingGuideLabel.text = "Age rating: \(anime?.attributes?.ageRatingGuide ?? "")"
        statusLabel.text = "Status anime: \(anime?.attributes?.status ?? "")"
        episodeCountLabel.text = "Episode count: \(anime?.attributes?.episodeCount?.description ?? "")"
        episodeLengthLabel.text = "Episode length: \(anime?.attributes?.episodeLength?.description ?? "") min."
        totalLengthLabel.text = "Total length: \(anime?.attributes?.totalLength?.description ?? "") min."
        showTypeLabel.text = "Type: \(anime?.attributes?.showType ?? "")"
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
        player.anime = anime
        navigationController?.pushViewController(player, animated: true)
    }
}
