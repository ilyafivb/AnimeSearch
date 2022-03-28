import Foundation

protocol RequestComponents {
    var url: URL? { get }
    var method: HTTPMethod { get }
}

enum RequestParameters: RequestComponents {
    case anime
    case manga
    
    var path: String {
        switch self {
        case .anime:
            return "/anime"
        case .manga:
            return "/manga"
        }
    }
    
    var url: URL? {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "kitsu.io"
        component.path = "/api/edge" + path
        component.queryItems = [URLQueryItem(name: "page[limit]", value: "20"),
                                URLQueryItem(name: "page[offset]", value: "0")]
        return component.url
    }
    
    var method: HTTPMethod {
        return .get
    }
}

enum HTTPMethod: String {
    case get
    case put
    case post
    case delete
}


