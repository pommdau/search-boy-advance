//
//  SearchesView.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/25.
//

import SwiftUI

struct SearchesView: View {
    
    @State var option = QiitaOption.sampleData[0]
    
    var body: some View {
        List {
            NavigationLink {
                DetailView(option: $option)
            } label: {
                HStack {
                    Text("\(option.name)")
                    Spacer()
                    Button {
                        guard let url = option.url else { return }
                        UIApplication.shared.open(url)
                    } label: {
                        Text("Open")
                            .foregroundColor(.blue)
                    }
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
