//
//  CalendarView.swift
//  UICalendarView_SwiftUI
//
//  Created by Samet Çağrı Aktepe on 29.11.2023.
//

import SwiftUI

struct CalendarView: UIViewRepresentable {
    let interval: DateInterval
    @ObservedObject var eventStore: EventStore
    
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        return view
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }
    
    
   
    
}
