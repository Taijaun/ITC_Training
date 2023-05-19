//
//  NetworkManager.swift
//  MVVM_Assignment
//
//  Created by Taijaun Pitt on 19/04/2023.
//

import Foundation

class NetworkManager: NSObject, Networker{
    
    func callApiWithClosure<T>(urlString: String, type: T.Type, handler: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        

        let url = URL(string: urlString)
        guard let url = url else { return }
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        //URLSession.shared

        let task = session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                handler(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                #if DEBUG
                print("Http error")
                #endif
                return
            }
            
            guard let data = data else {
                #if DEBUG
                print("Couldnt retrieve products data from API")
                #endif
                return
            }
            
            
            do {
                let products = try JSONDecoder().decode(type.self, from: data)
                // Pass the array
                handler(.success(products))
            } catch {
                print(error.localizedDescription)
                
            }
            
            
        }
        task.resume()
    }
}
    
    

extension NetworkManager: URLSessionDelegate{
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        //create server certificate
        
        // extract cert from host
        guard let serverTrust = challenge.protectionSpace.serverTrust else{
            return (completionHandler(.cancelAuthenticationChallenge, nil))
        }
        
        let certificate = SecTrustGetCertificateAtIndex(serverTrust, 0)
        
        //SSL policies for domain check
        let policy = NSMutableArray()
        policy.add(SecPolicyCreateSSL(true, challenge.protectionSpace.host as CFString))
        
        //Evaluate the server certificate
        let isServerTrusted = SecTrustEvaluateWithError(serverTrust, nil)
        
        //local and remote cert data
        let remoteCert: NSData = SecCertificateCopyData(certificate! as! SecCertificate)
//        let bundle = Bundle(for: NetworkManager.self)
        
        guard let localCertPath = Bundle.main.path(forResource: "dummyjson.com", ofType: "cer") else {return}
        
        let localCertData = try? NSData(contentsOfFile: localCertPath)
        
        if (isServerTrusted && remoteCert.isEqual(localCertData)){
            #if DEBUG
            print("SSL Pinning is successful")
            #endif
            let credential = URLCredential(trust: serverTrust)
            return (completionHandler(.useCredential, nil))
        } else {
            #if DEBUG
            print("SSL Pinning failed")
            #endif
            return (completionHandler(.cancelAuthenticationChallenge, nil))
        }
        
    }
    
}
    
    
