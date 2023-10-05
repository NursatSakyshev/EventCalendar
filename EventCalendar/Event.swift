//
//  Event.swift
//  EventCalendar
//
//  Created by Nursat Sakyshev on 05.10.2023.
//

import Foundation

struct Event: Codable {
    var name: String
    var time: String
}

func getEvents(key: String) -> [Event] {
    let defaultValue: [Event] = []
    guard let data = try? UserDefaults.standard.object(forKey: key) as? Data else {
        return defaultValue
    }
    
    let value = try? JSONDecoder().decode([Event].self, from: data)
    return value ?? defaultValue
}

func saveData(key: String, events: [Event]) {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(events) {
        UserDefaults.standard.set(encoded, forKey: key)
    }
}
