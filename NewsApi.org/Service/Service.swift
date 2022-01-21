//
//  Service.swift
//  NewsApi.org
//
//  Created by Kaan İzgi on 20.01.2022.
//

import Foundation

class WebServer {
    enum CustomError:Error {
        case invalidUrl
        case invalidData
    }
    func requestUrl<T: Codable>(
    url:URL?,
    expecting:T.Type,
    completion: @escaping(Result<T,Error>) -> Void)    {
     
        guard let url = url else{
            completion(.failure(CustomError.invalidUrl))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { Data, _, Error in
            guard let data = Data else{
                if let Error = Error {
                    completion(.failure(Error))
                } else{
                    completion(.failure(CustomError.invalidUrl))
                }
                return
            }
            do{
                let results = try JSONDecoder().decode(expecting, from: data)
                completion(.success(results))
            }
            catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
