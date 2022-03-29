import Foundation

protocol ContentServicable {
    func getAnime(_ completion: @escaping ([Content]) -> Void)
    func getManga(_ completion: @escaping ([Content]) -> Void)
}

class ContentService: ContentServicable {
    let networking: Networkable
    
    init(networking: Networkable) {
        self.networking = networking
    }
    
    func getAnime(_ completion: @escaping ([Content]) -> Void) {
        networking.request(parameters: RequestParameters.anime) { (result: Result<ContentData, Error>) in
            switch result {
            case .success(let contentData):
                let content = contentData.data
                DispatchQueue.main.async {
                    completion(content)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getManga(_ completion: @escaping ([Content]) -> Void) {
        networking.request(parameters: RequestParameters.manga) { (result: Result<ContentData, Error>) in
            switch result {
            case .success(let contentData):
                let content = contentData.data
                DispatchQueue.main.async {
                    completion(content)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}


