//
//  DaysEventListViewView.swift
//  UICalendarView_SwiftUI
//
//  Created by Samet Çağrı Aktepe on 2.12.2023.
//

import SwiftUI

struct DaysEventListViewView: View {
    @EnvironmentObject var eventStore: EventStore
    @Binding var dateSelected: DateComponents?
    @State private var formType: EventFormType?
    
    var body: some View {
        NavigationStack {
            Group {
                if let dateSelected {
                    let foundEvents = eventStore.events
                        .filter { $0.date.startOfDay == dateSelected.date!.startOfDay }
                    List {
                        ForEach(foundEvents) { event in
                            ListViewRow(event: event, formType: $formType)
                                .swipeActions {
                                    Button(role: .destructive) {
                                        eventStore.delete(event)
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                    .sheet(item: $formType) {$0}
                                }
                        }
                        
                    }
                }
            }
            .navigationTitle(dateSelected?.date?.formatted(date: .long, time: .omitted) ?? "")
        }
    }
}

#Preview {
    var dateComponents: DateComponents{
        var dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: Date())
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }
    
    return DaysEventListViewView(dateSelected: .constant(dateComponents))
        .environmentObject(EventStore(preview: true))
}
