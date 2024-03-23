import UIKit

class AddressView: UIStackView {
    let cep: String
    let state: String
    let city: String
    let neighborhood: String
    let street: String
    let service: String
    
    init(cep: String, state: String, city: String, neighborhood: String, street: String, service: String) {
        self.cep = cep
        self.state = state
        self.city = city
        self.neighborhood = neighborhood
        self.street = street
        self.service = service
        
        super.init(frame: .zero)
    }
    
    public func build(cep: String, state: String, city: String, neighborhood: String, street: String, service: String) -> AddressView {
        return AddressView(cep: cep, state: state, city: city, neighborhood: neighborhood, street: street, service: service)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private lazy var cepLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = cep
        return label
    }()
    
    private lazy var stateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = state
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = city
        return label
    }()
    
    private lazy var neighborhoodLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = neighborhood
        return label
    }()
    
    private lazy var streetLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = street
        return label
    }()
    
    private lazy var serviceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = service
        return label
    }()
    
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = 4
        
        addArrangedSubview(cepLabel)
        addArrangedSubview(stateLabel)
        addArrangedSubview(cityLabel)
        addArrangedSubview(neighborhoodLabel)
        addArrangedSubview(streetLabel)
        addArrangedSubview(serviceLabel)
        
        
    }
}
