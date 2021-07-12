//
//  Constant.swift
//  Flash Chat iOS13
//
//  Created by Tejaswini MR on 24/11/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation

struct Constant {
    static let registerSegue="RegistreToChat"
    static let loginSegue="loginToChat"
    static let appName="⚡️FlashChat"
    static let cellIdentifier="ReusableCell"
    static let cellNibName="MessageCell"
    
    
    struct  BrandColor {
        static let purple="BrandPurple"
        static let lightPurple="BrnadLightPurple"
        static let blue="BrandBlue"
        static let lightBlue="BrandLightBlue"
    }
    struct FStore {
        static let collectionName="messages"
        static let senderField="sender"
        static let bodyField="body"
        static let dateField="date"
    }
}
