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
            Text("\(qiita.url!.absoluteString)")
            Text("Qiita02")
        }
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
