import UIKit

protocol AddressProtocol {
    func showAddressView(cep: String,
                          state: String,
                          city: String,
                          neighborhood: String,
                          street: String,
                          service: String)
}

class AddressViewController: UIViewController, UITextFieldDelegate, AddressProtocol {
    
    var interactor: AddressInteractorProtocol?
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Place holder text"
        textField.borderStyle = UITextField.BorderStyle.line
        textField.backgroundColor = UIColor.white
        textField.textColor = UIColor.blue
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.setTitle("Buscar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    private var addressView: AddressView = {
        let addressView = AddressView(cep: "", state: "", city: "", neighborhood: "", street: "", service: "")
        addressView.isHidden = true
        return addressView
    }()
    
    @objc func buttonTapped() {
        print("aaaaaa")
//        // Get the value from the text field
//        guard let text = textField.text else {
//            print("Text field is empty")
//            return
//        }
//        
//        interactor?.fetchAddress(cep: text)
//        addressView.reloadInputViews()
//        
//        // Use the value as needed
//        print("Value from text field: \(text)")
    }
    
    func showAddressView(cep: String,
                          state: String,
                          city: String,
                          neighborhood: String,
                          street: String,
                          service: String) {
        addressView = AddressView(cep: cep, state: state, city: city, neighborhood: neighborhood, street: street, service: service)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.addSubview(textField)
        view.addSubview(searchButton)
        view.addSubview(addressView)
        
        // SE QUISER DEIXAR O BOTÃO OCUPANDO O WIDTH PODE COMENTAR ESSA LINHA
        //searchButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            searchButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 24),
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.centerYAnchor.constraint(equalTo: textField.bottomAnchor, constant: 48),
            
            addressView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 24),
            addressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            addressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
    }
    
}
