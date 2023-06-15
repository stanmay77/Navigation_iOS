import Foundation

struct NetworkManager {
    
    enum AppConfiguration {

        case people
        case starships
        case planets
        
        var getURL: URL {
            switch self {
            case .people:
                return URL(string: "https://swapi.dev/api/people/8")!
            case .starships:
                return URL(string: "https://swapi.dev/api/starships/3")!
            case .planets:
                return URL(string: "https://swapi.dev/api/planets/5")!
            }
        }
    }
        
    static func request(for configuration: AppConfiguration) {
        
        let apiURL: URL
        
        switch configuration {
        case .people:
            apiURL = AppConfiguration.people.getURL
        case .planets:
            apiURL = AppConfiguration.planets.getURL
        case .starships:
            apiURL = AppConfiguration.starships.getURL
        }
        
        
        let request = URLRequest(url: apiURL)
        
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
    
}
