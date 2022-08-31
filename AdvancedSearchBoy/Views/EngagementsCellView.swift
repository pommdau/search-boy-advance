//
//  EngagementsCellView.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/30.
//

import SwiftUI

struct EngagementsCellView: View {

    @Binding var value: Double
    let suffixLabelText: String
    let sliderTextForVoiceOver: String

    var body: some View {
        HStack {
            Slider(value: $value,
                   in: 0...1000,
                   step: 10) {
                Text(sliderTextForVoiceOver)  // For VoiceOver
            }
            Spacer()
            Text("\(Int(value)) \(suffixLabelText)")
        }
    }
}

struct EngagementsCellView_Previews: PreviewProvider {
    static var previews: some View {
        EngagementsCellView(value: .constant(10),
                            suffixLabelText: "favorites",
                            sliderTextForVoiceOver: "")
            .previewLayout(.fixed(width: 400, height: 120))
            .padding()
    }
}
