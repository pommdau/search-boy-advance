//
//  Home.swift
//  SearchBoyAdvance
//
//  Created by HIROKI IKEUCHI on 2022/09/01.
//

import SwiftUI

struct Home: View {
    
    @AppStorage("launchingAtFirstTime") var launchingAtFirstTime = true
    @StateObject private var store = TwitterOptionStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some View {
        NavigationView {
            SearchesView(options: $store.options) {
                // SaveAction
                Task {
                    do {
                        try await TwitterOptionStore.save(options: store.options)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .task {
            do {
                store.options = try await TwitterOptionStore.load()
                if launchingAtFirstTime {
                    store.options += TwitterOption.recommendedData
                    launchingAtFirstTime = false
                }
            } catch {
                errorWrapper = ErrorWrapper(error: error,
                                            guidance: "will load sample data and continue.")
            }
        }
        .sheet(item: $errorWrapper) {
            // onDismiss
            store.options = TwitterOption.recommendedData
        } content: { wrapper in
            ErrorView(errorWrapper: wrapper)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
