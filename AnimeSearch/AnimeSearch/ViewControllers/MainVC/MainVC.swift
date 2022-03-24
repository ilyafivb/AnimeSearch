import UIKit
import Stevia

class MainVC: UIViewController {
    
    private var anime: [Anime] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let networking = Networking()
    
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAll()
    }
    
    private func setupAll() {
        networking.getAnime { anime in
            DispatchQueue.main.async {
                self.anime = anime
            }
        }
        setupLayout()
        setupTable()
    }
    
    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.id)
    }
    
    private func setupLayout() {
        view.backgroundColor = .brown
        view.subviews {
            tableView
        }
        tableView.fillContainer()
    }


}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        anime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.id, for: indexPath) as! MainTableViewCell
        cell.setupCell(anime: anime[indexPath.row])
        return cell
    }
}

