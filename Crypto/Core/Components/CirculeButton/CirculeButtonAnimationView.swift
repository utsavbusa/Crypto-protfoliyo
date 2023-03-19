//
//  CirculeButoonAnimationView.swift
//  Crypto
//
//  Created by Utsav busa on 19/03/23.
//

import SwiftUI

struct CirculeButtonAnimationView: View {
    
    @Binding var animate:Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none)
            
    }
}

struct CirculeButoonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CirculeButtonAnimationView(animate: .constant(false))
    }
}
