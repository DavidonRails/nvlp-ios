//
//  APIService.swift
//  Test
//
//  Created by Admin on 10/15/20.
//

import Foundation
import Alamofire

class APIService {
    
    static let shared = APIService()
    private init() {
        
    }
    
    func login(body: [String: Any], completion: @escaping (Error?, Any?)->()) {
            
        let url = Constants.LOGIN
    
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(URL(string: url)!, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON {
            response in
            
            switch response.result {
            case .success(let data):
                completion(nil, data)
            case .failure(let error):
                completion(error, nil)
            }
        }
    }
}
