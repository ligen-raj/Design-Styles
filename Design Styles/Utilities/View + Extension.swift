//
//  View + Extension.swift
//  DesignStyles
//
//  Created by Ligen Raj on 22/06/25.
//

import SwiftUI

extension View {
    
    @ViewBuilder func active(if condition: Bool) -> some View {
        if condition {
            self
        }
    }
    
}
