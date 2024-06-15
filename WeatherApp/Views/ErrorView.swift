//
//  ErrorView.swift
//  WeatherApp
//
//  Created by Gheorghi Petis on 15.06.2024.
//

import SwiftUI

struct ErrorView: View {
    
    let title: String
    let message: String
    var onRetryTap: () -> Void

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            Text(title)
                .foregroundColor(.appText)
                .multilineTextAlignment(.center)
                .font(.appBodyBold)
            
            Text(message)
                .foregroundColor(.appText)
                .multilineTextAlignment(.center)
                .font(.appBody)
            
            Spacer()
            
            Button(action: onRetryTap) {
                Text("Retry")
                    .foregroundColor(.appText)
                    .font(.appBodyBold)
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.appAccent)
                    .cornerRadius(10.0)
                    .padding(.horizontal, 24.0)
            }
        }
        
    }
}
