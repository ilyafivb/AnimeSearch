import Foundation

struct Attributes: Codable {
       var description: String
       var canonicalTitle: String
       var averageRating: String
       var userCount: Int
       var favoritesCount: Int
       var startDate: String
       var endDate: String
       var popularityRank: Int
       var ratingRank: Int
       var ageRatingGuide: String
       var status: String
       var posterImage: PosterImage
       var coverImage: CoverImage?
       var episodeCount: Int
       var episodeLength: Int?
       var totalLength: Int
       var showType: String
}
