//
//  ViewController.swift
//  EventCalendar
//
//  Created by Nursat Sakyshev on 04.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
//    let calendarView: UICalendarView = {
//       let calendarView = UICalendarView()
//        return calendarView
//    }()
    let calendarView = UICalendarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createCalendar()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 30),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        view.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        self.navigationItem.title = "Event Calendar"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(add))
    }
    
    func createCalendar() {
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.calendar = .current
        calendarView.locale = Locale(identifier: "en_US_POSIX")
        calendarView.fontDesign = .rounded
        calendarView.delegate = self
        calendarView.backgroundColor = .systemBackground
        
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior = dateSelection
        
        view.addSubview(calendarView)
        
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: view.topAnchor),
            calendarView.rightAnchor.constraint(equalTo: view.rightAnchor),
            calendarView.leftAnchor.constraint(equalTo: view.leftAnchor),
            calendarView.heightAnchor.constraint(equalToConstant: 550),
        ])
    }
    
    @objc func add() {
        navigationController?.pushViewController(NewEventViewController(), animated: true)
    }
}

extension ViewController: UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        let key = "\(dateComponents!.year!)-\(dateComponents!.month!)-\(dateComponents!.day!)"
        let events = getEvents(key: key)
    }
    
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        return nil
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.backgroundColor = .systemBackground
        cell.isUserInteractionEnabled = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

