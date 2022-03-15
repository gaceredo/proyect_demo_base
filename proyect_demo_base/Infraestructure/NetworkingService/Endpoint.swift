//
//  Endpoint.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//

import Foundation

protocol Endpoint {
    
    var base: String { get }
    var path: String { get }
    var headers: [String: String] { get }
    var httpMethod: RequestMethod { get }
}

extension Endpoint {
    
    var headers: [String: String] {
        return ["content-type": "application/json"]
    }
    
    var base : String {
        return AppEnvironment.baseURL
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        return components
    }
    
    func request(query items: [URLQueryItem] = [],
                 body : [String: Any] = [:]) -> URLRequest {
        var url = urlComponents
        if !items.isEmpty {
            url.queryItems = items
        }
        var request = URLRequest(url: url.url!)
        request.allHTTPHeaderFields = headers
        request.httpMethod = httpMethod.rawValue
        
        if body.isEmpty {
            let data = try! JSONSerialization.data(withJSONObject: body)
            request.httpBody = data
        }
        return request
    }
    
    func request(image: Data) -> URLRequest {
        var url = URLRequest(url: urlComponents.url!)
        let boundary = UUID()
        let body = NSMutableData()
        
        body.appendString("--\(boundary)\r\n")
        body.appendString("Content-Disposition: form-data; name=\"image\"; filename=\"image.png\"\r\n")
        body.appendString("Content-Type: image/png\r\n\r\n")
        body.append(image)
        body.appendString("\r\n")
        url.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        body.appendString("--\(boundary)--\r\n")
        url.setValue("TOKEN_VALUE", forHTTPHeaderField:"x-access-token")
        // TODO: - change the token_value variable to the actual value of the token
        url.setValue("\(body.length)", forHTTPHeaderField:"Content-Length")
        
        url.httpBody = body as Data
        url.httpMethod = httpMethod.value
        return url
    }
}
