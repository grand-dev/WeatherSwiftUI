//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Gheorghi Petis on 15.06.2024.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .appText))
    }
}
