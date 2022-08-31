//
//  DateCellView.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/31.
//

import SwiftUI

struct DateCellView: View {

    let title: String
    @Binding var date: Date?
    @Binding var isValid: Bool

    private let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2006, month: 7, day: 15)  // Twitterのサービス開始日時
        return (calendar.date(from: startComponents) ?? Date())
            ...
            Date()
    }()

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            DatePicker("",
                       selection: Binding<Date>(
                        get: { date ?? Date() },
                        set: { date = $0 }
                       ),
                       in: dateRange,
                       displayedComponents: [.date]
            )
            Toggle(isOn: $isValid) {}
                .labelsHidden()
                .onChange(of: isValid) { newValue in
                    if newValue, date == nil {
                        date = Date()
                    }
                }
        }
    }
}

struct DebugDateCellView: View {

    @State private var date: Date?
    @State private var isValid = false

    var body: some View {
        VStack {
            DateCellView(title: "Ttite", date: $date, isValid: $isValid)
            Spacer()
            if let date = date,
               isValid {
                Text(date, style: .date)
            } else {
                Text("isEmpty")
            }
        }
    }
}

struct DateCellView_Previews: PreviewProvider {
    static var previews: some View {

        DebugDateCellView()

        //        DateCellView(title: "TestTitle", date: .constant(Date()))
        //            .previewLayout(.fixed(width: 400, height: 120))
        //            .padding()
    }
}
