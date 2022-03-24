import Foundation

struct PosterImage: Codable {
    var tiny: String
    var large: String
    var small: String
    var medium: String
    var original: String
}
//          "meta":{
//             "dimensions":{
//                "tiny":{
//                   "width":110,
//                   "height":156
//                },
//                "large":{
//                   "width":550,
//                   "height":780
//                },
//                "small":{
//                   "width":284,
//                   "height":402
//                },
//                "medium":{
//                   "width":390,
//                   "height":554
//                }
