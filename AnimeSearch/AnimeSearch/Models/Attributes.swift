import Foundation

struct Attributes: Codable {
       var createdAt: String
       var updatedAt: String
       var slug: String
       var description: String
       var titles: Titles?
       var canonicalTitle: String
       var abbreviatedTitles: [String]
       var averageRating: String
//       "ratingFrequencies":{
//
//       },
       var userCount: Int
       var favoritesCount: Int
       var startDate: String
       var endDate: String
       var popularityRank: Int
       var ratingRank: Int
       var ageRatingGuide: String
       var subtype: String
       var status: String
       var posterImage: PosterImage
       var coverImage: CoverImage?
       var episodeCount: Int
       var episodeLength: Int?
       var totalLength: Int
       var showType: String
}
