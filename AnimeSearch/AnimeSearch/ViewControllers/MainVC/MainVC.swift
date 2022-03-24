import UIKit
import Stevia

class MainVC: UIViewController {
    
    private let networking = Networking()
    private let tableView = UITableView()
    
    private var anime: [Anime] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAll()
    }
    
    //MARK: - Setup
    
    private func setupAll() {
        getAnime()
        setupLayout()
        setupTable()
    }
    
    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.id)
    }
    
    private func setupLayout() {
        view.subviews {
            tableView
        }
        tableView.fillContainer()
    }
    
    //MARK: - Action
    
    private func getAnime() {
        networking.getAnime { anime in
            DispatchQueue.main.async {
                self.anime = anime
            }
        }
    }
    
    private func showDetailVC(selectedAnime: Anime) {
        let detailVC = DetailVC()
        detailVC.anime = selectedAnime
        navigationController?.pushViewController(detailVC, animated: true)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedAnime = anime[indexPath.row]
        showDetailVC(selectedAnime: selectedAnime)
    }
}

