//
//  EditingManagerProfileController.swift
//  IDStore
//
//  Created by Александр Старков on 03.06.2022.
//

import UIKit
import RealmSwift

class EditingManagerProfileController: UIViewController {
 
    private let editingProfileLabel: UILabel = {
       let label = UILabel()
        label.text = "EDITING PROFILE"
        label.font = .avenirMedium24()
        label.textColor = .specialBlackColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstNameLabel = UILabel(text: "  Имя")
    
    private let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .specialBackground
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .specialGray
        textField.font = .avenirNextDemiBold20()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.addShadowOnView(setColor: .black, setOpacity: 0.2, setRadius: 0.3)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let secondNameLabel = UILabel(text: "  Фамилия")
    
    private let secondNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .specialBackground
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .specialGray
        textField.font = .avenirNextDemiBold20()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.addShadowOnView(setColor: .black, setOpacity: 0.2, setRadius: 0.3)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let jobTitleLabel = UILabel(text: "  Должность")
    
    private let jobTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .specialBackground
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .specialGray
        textField.font = .avenirNextDemiBold20()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.addShadowOnView(setColor: .black, setOpacity: 0.2, setRadius: 0.3)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let numberPhoneLabel = UILabel(text: "  Номер телефона")
    
    private let numberPhoneTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .specialBackground
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .specialGray
        textField.font = .avenirNextDemiBold20()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.addShadowOnView(setColor: .black, setOpacity: 0.2, setRadius: 0.3)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let emailLabel = UILabel(text: "  Почта")
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .specialBackground
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .specialGray
        textField.font = .avenirNextDemiBold20()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.addShadowOnView(setColor: .black, setOpacity: 0.2, setRadius: 0.3)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialRed
        button.setTitle("SAVE", for: .normal)
        button.titleLabel?.font = .avenirNextDemiBold16()
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    @objc private func saveButtonTapped() {
        print("saveButtonTapped")
    }
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "CloseButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func closeButtonTapped() {
        
    }
    
    
    
    private let localRealm = try! Realm()
    private var profileArray: Results<ProfileManagerModel>!
    
    private var profileManagerModel = ProfileManagerModel()
    
    //MARK: - setupViews()
    private func setupViews() {
        
        view.backgroundColor = .specialBackground
        view.addSubview(editingProfileLabel)
        view.addSubview(firstNameLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(secondNameLabel)
        view.addSubview(secondNameTextField)
        view.addSubview(jobTitleLabel)
        view.addSubview(jobTextField)
        view.addSubview(numberPhoneLabel)
        view.addSubview(numberPhoneTextField)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(saveButton)
        view.addSubview(closeButton)
        
    }
    
    
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
    }
    
    
    
    
}

//MARK: - setConstraints
extension EditingManagerProfileController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            editingProfileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            editingProfileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.centerYAnchor.constraint(equalTo: editingProfileLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            firstNameLabel.topAnchor.constraint(equalTo: editingProfileLabel.bottomAnchor, constant: 30),
            firstNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            firstNameTextField.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 10),
            firstNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            secondNameLabel.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 30),
            secondNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            secondNameTextField.topAnchor.constraint(equalTo: secondNameLabel.bottomAnchor, constant: 10),
            secondNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            secondNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            secondNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            jobTitleLabel.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: 30),
            jobTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            jobTextField.topAnchor.constraint(equalTo: jobTitleLabel.bottomAnchor, constant: 10),
            jobTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            jobTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            jobTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            numberPhoneLabel.topAnchor.constraint(equalTo: jobTextField.bottomAnchor, constant: 30),
            numberPhoneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            numberPhoneTextField.topAnchor.constraint(equalTo: numberPhoneLabel.bottomAnchor, constant: 10),
            numberPhoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            numberPhoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            numberPhoneTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: numberPhoneTextField.bottomAnchor, constant: 30),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 200),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
    }
}
