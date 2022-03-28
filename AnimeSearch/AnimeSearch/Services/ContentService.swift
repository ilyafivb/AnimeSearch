import Foundation

protocol ContentServicable {
    func getContent(_ completion: @escaping ([Content]) -> Void)
}

class ContentService: ContentServicable {
            
    let networking: Networkable = Networking()
    
    func getContent(_ completion: @escaping ([Content]) -> Void) {
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
}


