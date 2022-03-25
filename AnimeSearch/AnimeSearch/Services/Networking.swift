import Foundation

class Networking {
    
    let baseUrl = "https://kitsu.io/api/edge/anime?page[limit]=20"
    
    func getAnime(_ completion: @escaping ([Anime]) -> Void) {
        guard let url = URL(string: baseUrl) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("error")
            } else {
                guard let data = data else { return }
                if let animeData = try? JSONDecoder().decode(AnimeData.self, from: data) {
                     let anime = animeData.data
                        completion(anime)
                } else {
                    print("not working")
                }
            }
        }.resume()
    }
}
