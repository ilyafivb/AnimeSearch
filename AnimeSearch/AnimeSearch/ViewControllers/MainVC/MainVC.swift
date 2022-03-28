import UIKit
import Stevia

class MainVC: UIViewController {
    
    private let contentService = ContentService()
    private let tableView = UITableView()
    
    private var content: [Content] = [] {
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
        getContent()
        setupLayout()
        setupTable()
    }
    
    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.id)
        tableView.separatorStyle = .none
    }
    
    private func setupLayout() {
        view.subviews {
            tableView
        }
        tableView.fillContainer()
    }
    
    //MARK: - Action
    
    private func getContent() {
        contentService.getAnime { [weak self] content in
            DispatchQueue.main.async {
            self?.content = content
            }
        }
    }
    
    private func showDetailVC(selectedContent: Content) {
        let detailVC = DetailVC()
        detailVC.content = selectedContent
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.id, for: indexPath) as! MainTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.setupCell(content: content[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedContent = content[indexPath.row]
        showDetailVC(selectedContent: selectedContent)
    }
}

