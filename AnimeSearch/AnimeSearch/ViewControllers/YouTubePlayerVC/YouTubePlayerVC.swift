import Foundation
import Stevia
import YouTubeiOSPlayerHelper

class YouTubePlayerVC: UIViewController {
    
    var content: Content?
    
    private let player = YTPlayerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAll()
    }
    
    private func setupAll() {
        setupLayout()
        guard let url = content?.attributes.youtubeVideoId else { return }
        player.load(withVideoId: url)
    }
    
    private func setupLayout() {
        
        view.subviews {
            player
        }
        player.fillContainer()
    }
}
