import Foundation
import Stevia
import YouTubeiOSPlayerHelper

class YouTubePlayerVC: UIViewController {
    
    var anime: Anime?
    
    private let player = YTPlayerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAll()
    }
    
    private func setupAll() {
        setupLayout()
        guard let url = anime?.attributes?.youtubeVideoId else { return }
        player.load(withVideoId: url)
    }
    
    private func setupLayout() {
        
        view.subviews {
            player
        }
        player.fillContainer()
    }
}
