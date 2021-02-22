//
//  SignInViewModel.swift
//  MVVM
//
//  Created by Mihaela Glavan on 19/02/2021.
//

import Foundation

class SignInViewModel {
    
    private var user: User
    let signInState: Bindable<Bool>
    
    init(user: User) {
        self.user = user
        self.signInState = Bindable(false)
    }
    
    var email: String {
        get { user.email }
        set { user.email = newValue
            updateSignInState()
        }
    }
    
    var password: String {
        get { user.password }
        set { user.password = newValue
            updateSignInState()
        }
    }
    
    func updateSignInState() {
        let state = canSignIn(user: user)
        guard state != signInState.value else { return }
        signInState.value = state
    }
    
    private func canSignIn(user: User) -> Bool {
        return user.email.count > 5 && user.password.count > 5
    }
}
