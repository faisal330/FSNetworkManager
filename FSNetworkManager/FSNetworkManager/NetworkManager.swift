//
//  NetworkManager.swift
//  FSNetworkManager
//
//  Created by Faisal Shahzad on 13/04/2024.
//

import Foundation

public typealias completionHandler = ((Data?, URLResponse?, Error?, URLRequest?)->Void)

public protocol RequestProtocol {
    
    func sendGetRequest(_ url: String, params: [String:Any], headers: [String: Any], onComplete: @escaping completionHandler)
    
    func sendRequest(method: HTTPMethod, _ url: String, body: [String: Any], headers: [String: Any], params: [String: Any], onComplete: @escaping completionHandler)
}

public enum HTTPMethod:String {
    case POST
    case PATCH
    case PUT
    case DELETE
}

public class NetworkManager: RequestProtocol {
   
    public static let shared = NetworkManager()
    private init() {}
    private var APIKey: String!
    
    public func provideAPIKey(_ apiKey: String) {
        if apiKey.isEmpty {
            fatalError("Provided API key cannot be empty.")
        } else {
            APIKey = apiKey
        }
    }
    
    private func appendAPIKey(in params: inout [String:Any]) {
        if APIKey.isEmpty || APIKey == nil {
            fatalError("API key is missing.")
        } else {
            params["api_key"] = APIKey
        }
    }
    
    public func sendGetRequest(_ url: String, params: [String : Any] = [:], headers: [String : Any] = [:], onComplete: @escaping completionHandler) {
        var modifiedParams = params
        self.appendAPIKey(in: &modifiedParams)
        
        var queryParams = ""
        for (key, val) in modifiedParams {
            queryParams += "&\(key)=\(val)"
        }
        
        let urlStr = url + "?" + queryParams
        let allowed = CharacterSet.whitespacesAndNewlines.inverted
        
        
        
        guard let url = URL(string: urlStr.addingPercentEncoding(withAllowedCharacters: allowed)!) else {
            onComplete(nil, nil, nil, nil)
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        for (key, value) in headers {
            request.addValue("\(value)", forHTTPHeaderField: key)
        }
        
        self.startURLSession(request: request, onComplete: onComplete);
    }
    
    
    public func sendRequest(method: HTTPMethod, _ url: String, body: [String: Any], headers: [String: Any] = [:], params: [String: Any] = [:], onComplete: @escaping completionHandler) {
        
        var modifiedParams = params
        self.appendAPIKey(in: &modifiedParams)
        
        var queryParams = ""
        for (key, val) in modifiedParams {
            queryParams += "&\(key)=\(val)"
        }
        
        let urlStr = url + "?" + queryParams
        let allowed = CharacterSet.whitespacesAndNewlines.inverted
        
        guard let url = URL(string: urlStr.addingPercentEncoding(withAllowedCharacters: allowed)!) else {
            onComplete(nil, nil, nil, nil)
            return
        }
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        for (key, value) in headers {
            request.addValue("\(value)", forHTTPHeaderField: key)
        }
        
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        self.startURLSession(request: request, onComplete: onComplete);
        
    }
    
    func startURLSession(request: URLRequest, onComplete: @escaping completionHandler) {
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        session.dataTask(with: request) { (data, response, error) in
            
            if data != nil {
                print("### API - NETWORK ###")
                print(request.url?.absoluteString ?? "null invalid url string");
                
                if let requestHeader = request.allHTTPHeaderFields{
                    print("Header : \(String(describing: requestHeader))")
                }
                
                print("Response : ")
                print(String(data: data!, encoding: String.Encoding.utf8) ?? "failed to convert to string")
                
                print("##############################################################################")
            }
            
            onComplete(data, response, error, request);
            
        }.resume()
    }
    
}
