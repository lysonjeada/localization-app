import Foundation

enum DataError: Error {
    case invalidData
    case invalidResponse
    case message(_ error: Error?)
}

class APIManager {
    
    var cep: Int
    
    init(cep: Int) {
        self.cep = cep
    }

    func fetchData(completion: @escaping (Result<AddressResponse, DataError>) -> Void) {
        let url = URL(string: "https://brasilapi.com.br/api/cep/v2/\(cep)")
        guard let url = url else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse, 200 ... 299  ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let products = try JSONDecoder().decode(AddressResponse.self, from: data)
                completion(.success(products))
            }
            catch {
                completion(.failure(.message(error)))
            }
        }.resume()
    }
}
