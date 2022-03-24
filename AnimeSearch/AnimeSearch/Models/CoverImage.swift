import Foundation

struct CoverImage: Codable {
    var tiny: String
    var large: String
    var small: String
    var original: String
}
//             "dimensions":{
//                "tiny":{
//                   "width":840,
//                   "height":200
//                },
//                "large":{
//                   "width":3360,
//                   "height":800
//                },
//                "small":{
//                   "width":1680,
//                   "height":400
//                }
