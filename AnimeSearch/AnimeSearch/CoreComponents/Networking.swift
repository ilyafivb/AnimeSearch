import Foundation

protocol Networkable {
    func request<Model: Decodable>(parameters: RequestComponents, _ completion: @escaping (Result<Model, Error>) -> Void)
}

class Networking: Networkable {
    
    enum Errors: Error {
        case wrongUrl
    }
        
    func request<Model: Decodable>(parameters: RequestComponents, _ completion: @escaping (Result<Model, Error>) -> Void) {
        guard let url = parameters.url else {
            completion(.failure(Errors.wrongUrl))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = parameters.method.rawValue
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print("error")
            } else {
                guard let data = data else { return }
                if let model = try? JSONDecoder().decode(Model.self, from: data) {
                        completion(.success(model))
                } else {
                    print("not working")
                }
            }
        }.resume()
    }
}
