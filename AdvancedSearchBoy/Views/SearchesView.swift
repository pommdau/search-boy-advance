//
//  SearchesView.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/25.
//

import SwiftUI

struct SearchesView: View {
    
    let qiita = QiitaOptions(titles: ["macOS", "Unix"])
    
    var body: some View {
        List {
            HStack {
                Text("\(qiita.url!.absoluteString)")
                Spacer()
                Button {
                    guard let url = qiita.url else { return }
                    UIApplication.shared.open(url)
                } label: {
                    Text("Open")
                        .foregroundColor(.blue)
                }

            }
            Text("Qiita02")
        }
        .buttonStyle(.plain)
        .navigationTitle("Searches")
    }
}

struct SearchesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchesView()
        }
    }
}
