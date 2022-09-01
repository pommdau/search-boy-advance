//
//  SearchesView.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/25.
//

import SwiftUI

struct SearchesView: View {

    @State var options = [TwitterOption.sampleData[0], TwitterOption.sampleData[1]]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewOptionView = false
    @State private var newOptionData = TwitterOption.Data()
    let saveAction: () -> Void

    var body: some View {
        List {
            ForEach($options) { $option in
                NavigationLink {
                    DetailView(option: $option)
                } label: {
                    HStack {
                        Text("\(option.title)")
                        Spacer()

                        Button {
                            print("copy...")
                        } label: {
                            Image(systemName: "doc.on.doc")
                                .foregroundColor(.blue)
                        }
                        Button {
                            guard let url = option.url else {
                                return
                            }
                            UIApplication.shared.open(url)  // TODO: Handle macOS
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundColor(.blue)
                                .padding(.trailing, 10)
                        }
                    }
                }
            }
        }
        .buttonStyle(.plain)
        .navigationTitle("Searches")
        .toolbar {
            Button {
                isPresentingNewOptionView = true
            } label: {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Option")
        }
        .sheet(isPresented: $isPresentingNewOptionView) {
            NavigationView {
                DetailEditView(data: $newOptionData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewOptionView = false
                                newOptionData = TwitterOption.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                let newOption = TwitterOption(data: newOptionData)
                                options.append(newOption)
                                isPresentingNewOptionView = false
                                newOptionData = TwitterOption.Data()
                            }
                        }
                    }
            }
        }
    }
}

struct SearchesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchesView {}
        }
    }
}
