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
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Buscar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private lazy var formStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textField, searchButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    private var addressView: AddressView = {
        let addressView = AddressView(cep: "", state: "", city: "", neighborhood: "", street: "", service: "")
        addressView.isHidden = true
        return addressView
    }()
    
    @objc func buttonTapped() {
        print("aaaaaa")
        // Get the value from the text field
        guard let text = textField.text else {
            print("Text field is empty")
            return
        }
        
        let cep = (text as NSString).integerValue
        
        interactor?.fetchAddress(cep: cep)
        addressView.reloadInputViews()
        
        // Use the value as needed
        print("Value from text field: \(text)")
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
        
        searchButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        setupViews()
    }
    
    func setupViews() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.addSubview(formStackView)
        view.addSubview(addressView)
        
        NSLayoutConstraint.activate([
            formStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            formStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            formStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            formStackView.heightAnchor.constraint(equalToConstant: 200),
            
            addressView.topAnchor.constraint(equalTo: formStackView.bottomAnchor, constant: 24),
            addressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            addressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
    }
    
}
