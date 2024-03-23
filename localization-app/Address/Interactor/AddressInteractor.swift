import Foundation

protocol AddressInteractorProtocol {
    func fetchAddress(cep: Int)
}

class AddressInteractor: AddressInteractorProtocol {
    
    private var presenter: AddressPresenterProtocol?
    
    init(presenter: AddressPresenterProtocol?) {
        self.presenter = presenter
    }
    
    func fetchAddress(cep: Int) {
        let apiManager = APIManager(cep: cep)
        
        apiManager.fetchData { [weak self] result in
            switch result {
            case .success(let success):
                self?.presenter?.showValues(cep: success.cep, state: success.state, city: success.city, neighborhood: success.neighborhood, street: success.street, service: success.service)
            case .failure(_):
                self?.presenter?.showError()
            }
        }
    }
}
