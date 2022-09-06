//
//  DateEditCellView.swift
//  SearchBoyAdvance
//
//  Created by HIROKI IKEUCHI on 2022/08/31.
//

import SwiftUI

struct DateEditCellView: View {

    let title: String
    @Binding var date: Date?
    @State private var selectedDate = Date()
    @State private var isValid = false
    private let dateRange: ClosedRange<Date> = {
        (Date.twitterStartedAt ?? Date())
        ...
        Date()
    }()

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            DatePicker("",
                       selection: $selectedDate,
                       in: dateRange,
                       displayedComponents: [.date]
            )
            .onChange(of: selectedDate) { _ in
                if isValid {
                    date = selectedDate
                }
            }
            Toggle(isOn: $isValid) {}
                .labelsHidden()
                .onChange(of: isValid) { isOn in
                    date = isOn ? selectedDate : nil
                }
        }
        .onAppear {
            if let date = date {
                selectedDate = date
                isValid = true
            }
        }
    }
}

extension Date {
    static var twitterStartedAt: Date? {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2006, month: 7, day: 15)  // Twitterのサービス開始日時
        return calendar.date(from: startComponents)
    }
}

struct DateCellView_Previews: PreviewProvider {
    static var previews: some View {
        DateEditCellView(title: "Title", date: .constant(Date()))
            .previewLayout(.fixed(width: 400, height: 120))
            .padding()
    }
}
