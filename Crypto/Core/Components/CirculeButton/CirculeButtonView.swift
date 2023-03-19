//
//  CirculeButtonView.swift
//  Crypto
//
//  Created by Utsav busa on 19/03/23.
//

import SwiftUI

struct CirculeButtonView: View {
    
    let iconeName:String
    
    var body: some View {
       Image(systemName: iconeName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50,height: 50)
            .background{
                Circle()
                    .foregroundColor(Color.theme.background)
            }
            .shadow(color: Color.theme.accent.opacity(0.25), radius: 10,x: 0,y: 0)
            .padding()
    }
}

struct CirculeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CirculeButtonView(iconeName: "heart.fill")
                .previewLayout(.sizeThatFits)
            
            CirculeButtonView(iconeName: "pluse")
                .previewLayout(.sizeThatFits)
                .colorScheme(.dark)
        }
    }
}
