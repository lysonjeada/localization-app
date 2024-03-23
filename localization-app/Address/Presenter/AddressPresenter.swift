import Foundation

protocol AddressPresenterProtocol {
    func showValues(cep: String, state: String, city: String, neighborhood: String, street: String, service: String)
    func showError()
}

class AddressPresenter: AddressPresenterProtocol {
    
    private var view: AddressProtocol?
    
    func showValues(cep: String, state: String, city: String, neighborhood: String, street: String, service: String) {
        view?.showAddressView(cep: cep, state: state, city: city, neighborhood: neighborhood, street: street, service: service)
    }
    
    func showError() {
        
    }
    
}
