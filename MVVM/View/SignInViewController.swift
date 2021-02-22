//
//  SignInViewController.swift
//  MVVM
//
//  Created by Mihaela Glavan on 19/02/2021.
//

import Foundation
import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    var viewModel: SignInViewModel? {
        didSet{
            loadViewIfNeeded()
            setupUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        password.delegate = self
    }
    
    func setupUI() {
        guard let viewModel = viewModel else {
            return
        }
        emailTextField.text = viewModel.email
        password.text = viewModel.password
        viewModel.signInState.bindAndFire { [unowned self] in
            self.signInButton.isEnabled = $0
        }
    }
}

extension SignInViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField === emailTextField {
            viewModel?.email = emailTextField.text?.appending(string) ?? ""
        } else {
            viewModel?.password = password.text?.appending(string) ?? ""
        }
        return true
    }
}
