import Foundation


protocol Networker {
    
    func callApi(url: URL) async throws -> Data
    
}
