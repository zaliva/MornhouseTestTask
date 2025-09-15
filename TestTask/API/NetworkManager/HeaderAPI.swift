import Foundation

enum UrlRequest: String {

    // MARK: - User
    case fact = "/"
    case randomFact = "/random/math"
    
    var fullUrl: String { "\(baseUrl)\(rawValue)" }
}
