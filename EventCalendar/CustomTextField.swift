//
//  CustomTextField.swift
//  EventCalendar
//
//  Created by Nursat Sakyshev on 05.10.2023.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private let accentColor = UIColor.black
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        autocapitalizationType = .none
        tintColor = UIColor.black
        layer.cornerRadius = 17
        backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
    }
    
    var padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 5)
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func becomeFirstResponder() -> Bool {
        let didSetFirstResponder = super.becomeFirstResponder()
        
        if didSetFirstResponder {
            layer.borderColor = accentColor.cgColor
            layer.borderWidth = 2.0
        }
        return didSetFirstResponder
    }
    
    override func resignFirstResponder() -> Bool {
        let didResignFirstResponder = super.resignFirstResponder()
        
        if didResignFirstResponder {
            layer.borderColor = UIColor.clear.cgColor
        }
        return didResignFirstResponder
    }
}
