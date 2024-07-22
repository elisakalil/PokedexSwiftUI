//
//  ContentView.swift
//  Pokedex
//
//  Created by Elisa Kalil on 17/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        OnboardinView(viewModel: OnboardingViewModel())
    }
}

#Preview {
    ContentView()
}
