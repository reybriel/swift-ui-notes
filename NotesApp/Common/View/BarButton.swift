//
//  BarButton.swift
//  NotesApp
//
//  Created by gabriel.n.reynoso on 23/09/19.
//  Copyright © 2019 greynoso. All rights reserved.
//

import SwiftUI

struct BarButton<BarButtonLabel>: View where BarButtonLabel: View {

    let action: () -> Void
    let label: BarButtonLabel

    var body: some View {
        Button(action: action, label: { self.label })
            .foregroundColor(.green)
    }
}
