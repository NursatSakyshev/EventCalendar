//
//  CustomCell.swift
//  EventCalendar
//
//  Created by Nursat Sakyshev on 06.10.2023.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    let eventName = UILabel()
    let eventTime = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [eventName, eventTime].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            eventName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            eventName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            eventTime.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            eventTime.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
