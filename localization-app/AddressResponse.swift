struct AddressResponse: Decodable {
    let cep: String
    let state: String
    let city: String
    let neighborhood: String
    let street: String
    let service: String
    let location: Location
    
    struct Location: Decodable {
        let type: String
        let coordinates: [Double]
    }
}
