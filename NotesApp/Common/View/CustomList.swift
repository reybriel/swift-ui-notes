//
//  CustomList.swift
//  NotesApp
//
//  Created by gabriel.n.reynoso on 23/09/19.
//  Copyright © 2019 greynoso. All rights reserved.
//

import SwiftUI

struct CustomList<ElementView, Element>: View where ElementView: View, Element: Identifiable {

    let items: [Element]
    let forEach: (Element) -> ElementView

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(items) { item in
                    self.forEach(item)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}
