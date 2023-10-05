//
//  NewEventViewController.swift
//  EventCalendar
//
//  Created by Nursat Sakyshev on 05.10.2023.
//

import UIKit

class NewEventViewController: UIViewController {
    
    let eventNameTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Event name"
        return textField
    }()
    
    let EventDate: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        datePicker.locale = Locale(identifier: "en_US_POSIX")
        return datePicker
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        [eventNameTextField].forEach {
            $0.delegate = self
        }
        
        self.navigationItem.title = "New Event"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(add))
        
        eventNameTextField.translatesAutoresizingMaskIntoConstraints = false
        [eventNameTextField, EventDate].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            eventNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            eventNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            eventNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            eventNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            EventDate.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            EventDate.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func add() {
        let comp = EventDate.calendar.dateComponents([.hour, .minute, .year, .month, .day], from: EventDate.date)
        let key = "\(comp.year!)-\(comp.month!)-\(comp.day!)"
        let newEvent = Event(name: eventNameTextField.text!, time: "\(comp.hour!):\(comp.minute!)")
        var events = getEvents(key: key)
        events.append(newEvent)
        saveData(key: key, events: events)
    }
    
    @objc func datePickerValueChanged(_ datePicker: UIDatePicker) {
    }

}

extension NewEventViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
