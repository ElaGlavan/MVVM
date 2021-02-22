//
//  SignInViewModelTests.swift
//  MVVMTests
//
//  Created by Mihaela Glavan on 21/02/2021.
//

import XCTest
@testable import MVVM

class SignInViewModelTests: XCTestCase {
    
    var subject: SignInViewModel!
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown(){
        subject = nil
        super.tearDown()
    }

    func test_email_emailIsSet_emailReturnsExpectedValue() {
        subject = SignInViewModel(user: User(email: "Test@email.com", password: "TestPassword"))
        XCTAssertEqual(subject.email, "Test@email.com")
    }

    func test_password_passwordIsSet_passwordReturnsExpectedValue() {
        subject = SignInViewModel(user: User(email: "Test@email.com", password: "TestPassword"))
        XCTAssertEqual(subject.password, "TestPassword")
    }
    
    func test_email_emailIsValid_passwordIsInvalid_canNotSignIn() {
        subject = SignInViewModel(user: User(email: "", password: ""))
        
        subject.email = "valid@email.com"
        
        XCTAssertFalse(subject.signInState.value)
    }
    
    func test_email_emailIsValid_passwordIsValid_canSignIn() {
        subject = SignInViewModel(user: User(email: "", password: "ValidPassword"))
        
        subject.email = "valid@email.com"
        
        XCTAssertTrue(subject.signInState.value)
    }
    
    func test_password_emailIsInvalid_passwordIsValid_canNotSignIn() {
        subject = SignInViewModel(user: User(email: "", password: ""))
        
        subject.password = "ValidPassword"
        
        XCTAssertFalse(subject.signInState.value)
    }
    
    
}

