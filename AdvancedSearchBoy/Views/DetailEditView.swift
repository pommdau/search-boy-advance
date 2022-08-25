//
//  DetailEditView.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/25.
//

import SwiftUI

struct DetailEditView: View {
    
    @Binding var includings: [String]
    @Binding var excludings: [String]
    
    @State private var newIncluding = ""
    @State private var newExcluding = ""
    
    var body: some View {
        Form {
            Section(header: Text("Including")) {
                ForEach(includings, id: \.self) { including in
                    Text(including)
                }
                .onDelete { indices in
                    includings.remove(atOffsets: indices)
                }
                
                HStack {
                    TextField("New", text: $newIncluding)
                    Button {
                        withAnimation {
                            includings.append(newIncluding)
                            newIncluding = ""
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newIncluding.isEmpty)
                }
            }
            
            Section(header: Text("Excluding")) {
                ForEach(excludings, id: \.self) { excluding in
                    Text(excluding)
                }
                .onDelete { indices in
                    excludings.remove(atOffsets: indices)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(includings: .constant(["include1", "include2"]),
                       excludings: .constant(["exclude1", "exclude2"]))
    }
}
