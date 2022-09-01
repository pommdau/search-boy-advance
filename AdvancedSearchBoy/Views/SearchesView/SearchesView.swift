//
//  SearchesView.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/25.
//

import SwiftUI

struct SearchesView: View {

    // MARK: - Properties
    
    @State var options = [TwitterOption.sampleData[0], TwitterOption.sampleData[1]]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewOptionView = false
    @State private var newOptionData = TwitterOption.Data()
    let saveAction: () -> Void
    
    // MARK: - View

    var body: some View {
        List {
            ForEach($options) { $option in
                SearchCellView(option: $option)
            }
        }
        .navigationTitle("Searches")
        .toolbar { newOptionButton() }
        .sheet(isPresented: $isPresentingNewOptionView) {
            detailEditView()
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
    
    // MARK: - ViewBuilder
    
    @ViewBuilder
    private func newOptionButton() -> some View {
        Button {
            isPresentingNewOptionView = true
        } label: {
            Image(systemName: "plus")
        }
        .accessibilityLabel("New Option")
    }
    
    @ViewBuilder
    private func detailEditView() -> some View {
        NavigationView {
            DetailEditView(data: $newOptionData)
                .navigationTitle(newOptionData.title)
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

struct SearchesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchesView {}
        }
    }
}
