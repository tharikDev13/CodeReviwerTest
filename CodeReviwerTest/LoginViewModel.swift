//
//  LoginViewModel.swift
//  CodeReviwerTest
//
//  Created by Tharik anver  on 03/08/26.
//

import Foundation

class LoginViewModel {

    var username = ""
    var password = ""

    var completion: (() -> Void)?

    func login() {

        if username == "" || password == "" {
            print("Empty")
            return
        }

        if username == "admin" && password == "123456" {
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {

                self.completion?()

                print("Login Success")
            }
        }
    }
}
