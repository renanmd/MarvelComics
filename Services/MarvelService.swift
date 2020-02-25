//
//  MarvelService.swift
//  MarvelComicsAPI
//
//  Created by Renan Diniz on 24/02/20.
//  Copyright © 2020 RMD Goup. All rights reserved.
//

import Foundation
import Alamofire
import CryptoSwift

class MarvelService {
    private static let publicKey = "5774cae2235b52533d2fac143d0c0ecd"
    private static let privatekey = "4baa89da68ebc85a45e37aee6b2c2d4d224c1f39"
    
    private static func addAuthorization(url: String) -> String {
        let ts = String(Int.random(in: Int.min...Int.max))
        let hash = (ts + privatekey + publicKey).md5()
        let authorizedUrl = url + "?apikey=\(publicKey)&ts=\(ts)&hash=\(hash)"
        
        return authorizedUrl
    }
    
    public static func getCharacters(completion: @escaping (_ characters: [Character]?)->()) {
        let authorizedURL = addAuthorization(url: "https://gateway.marvel.com:443/v1/public/characters")
        
        AF.request(authorizedURL).responseDecodable(of: BaseResponse.self) { (response) in
            guard let baseResponse = response.value else {
                completion(nil)
                return
            }
            
            completion(baseResponse.data?.results)
        }
    }
}
