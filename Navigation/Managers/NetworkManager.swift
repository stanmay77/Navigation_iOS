import Foundation


enum NetworkError: Error {
    case wrongResponseCode
    case someConnectionError
    case noDataReceived
}

struct apiObject1: Decodable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}

struct apiObject2: Decodable {
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
    let residents, films: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}


class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    enum AppConfiguration: String, CaseIterable {
        
        case people = "https://swapi.dev/api/people"
        case starships = "https://swapi.dev/api/starships"
        case planets = "https://swapi.dev/api/planets"
        
        var getURL: URL? {
            URL(string: self.rawValue)
        }
    }
    
    static func request(for url: URL?) {
        
        guard let url else {
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                guard let error else {
                    print("Unknow error!")
                    return
                }
                
                print(error.localizedDescription)
                return
            }
            
            if let data = data {
                let decodedData = String(decoding: data, as: UTF8.self)
                print(decodedData)
                print("\nResponse status code: \(response.statusCode)")
                print("\nResponse all header fields: \(response.allHeaderFields)")
            }
        }.resume()
    }
    
    // func for API 1
    func requestSerialization(for url: URL?, completion: @escaping (Result<[String: Any]?, NetworkError>) -> Void) {
        
        let request = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                guard let error else {
                    completion(.failure(.wrongResponseCode))
                    return
                }
                
                completion(.failure(.someConnectionError))
                return
            }
            
            if let data = data {
                do {
                    var decodedData = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
                    completion(.success(decodedData))
                }
                catch {
                    completion(.failure(.noDataReceived))
                    return
                }
                
                
            }
        }.resume()
    }
    
    // func for API 2
    func requestDecode<T:Decodable>(at url: URL?, for: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        let request = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                guard let error else {
                    completion(.failure(.wrongResponseCode))
                    return
                }
                
                completion(.failure(.someConnectionError))
                return
            }
            
            if let data = data {
                do {
                    var decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                }
                catch {
                    completion(.failure(.noDataReceived))
                    return
                }
                
                
            }
        }.resume()
    }
    
    
    
    
    
}

