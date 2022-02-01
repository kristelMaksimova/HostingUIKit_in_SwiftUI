//
//  ButtonView.swift
//  HostingUIKit_in_SwiftUI
//
//  Created by Kristel Maximova on 01.02.2022.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .foregroundColor(.blue)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Some Action", action: {})
    }
}
