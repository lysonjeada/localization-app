import Foundation

enum AddressFactory {
    case instance
    
    func build() -> AddressViewController {
        let view = AddressViewController()
        let presenter = AddressPresenter()
        let interactor = AddressInteractor(presenter: presenter)
        
        view.interactor = interactor
        
        return view
    }
}
