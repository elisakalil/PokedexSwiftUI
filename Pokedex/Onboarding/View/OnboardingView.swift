//
//  OnboardinView.swift
//  Pokedex
//
//  Created by Elisa Kalil on 24/06/24.
//

import SwiftUI

struct OnboardinView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        TabView(selection: $viewModel.currentStep) {
            ForEach(
                0..<viewModel.onboardingSteps.count,
                id: \.self
            ) { index in
                VStack(spacing: 24) {
                    Icons()
                    TitleAndDescriptions(
                        title: viewModel.onboardingSteps[index].title,
                        description: viewModel.onboardingSteps[index].description
                    )
                    OnboardingProgressBar()
                    OnboardingButton(title: viewModel.onboardingSteps[index].buttonText)
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .bottom
                )
                .padding(.horizontal, 24)
                .padding(.vertical, 40)
            }
        }
        .tabViewStyle(
            PageTabViewStyle(
                indexDisplayMode: .never
            )
        )
    }
    
    @ViewBuilder private func Icons() -> some View {
        if viewModel.currentStep == 0 {
            FirstStepView()
        } else {
           SecondStepView()
        }
    }
    
    @ViewBuilder private func TitleAndDescriptions(
        title: String,
        description: String
    ) -> some View {
        VStack(spacing: 16) {
            Text(title)
                .font(Font.custom("Poppins-Medium", size: 26))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Primary"))
            Text(description)
                .font(Font.custom("Poppins-Regular", size: 14))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Secondary"))
        }
    }
    
    @ViewBuilder private func OnboardingProgressBar() -> some View {
        if viewModel.currentStep == 0 {
            HStack {
                Rectangle()
                    .frame(width: 28, height: 9)
                    .clipShape(.capsule)
                    .foregroundStyle(Color("DarkBlue"))
                Circle()
                    .frame(width: 9, height: 9)
                    .foregroundStyle(Color(.lightGray))
            }
        } else {
            HStack {
                Circle()
                    .frame(width: 9, height: 9)
                    .foregroundStyle(Color(.lightGray))
                Rectangle()
                    .frame(width: 28, height: 9)
                    .clipShape(.capsule)
                    .foregroundStyle(Color("DarkBlue"))
            }
        }
    }
    
    @ViewBuilder private func OnboardingButton(
        title: String
    ) -> some View {
        Button(action: {
            viewModel.currentStep = 1
        }, label: {
            Rectangle()
                .frame(height: 58)
                .clipShape(.capsule)
                .foregroundStyle(Color("DarkBlue"))
                .overlay {
                    Text(title)
                        .foregroundStyle(.white)
                        .font(Font.custom("Poppins-SemiBold", size: 18))
                }
        })
    }
    
    @ViewBuilder private func FirstStepView() -> some View {
        ZStack {
            Image("Trainer1")
                .offset(x: 50)
                .background {
                    Image("shadowTrainer1")
                        .offset(x: 55, y: 125)
                }
            Image("Trainer2")
                .offset(x: -50, y: 12)
                .background {
                    Image("shadowTrainer2")
                        .offset(x: -65, y: 125)
                }
        }
    }
    
    @ViewBuilder private func SecondStepView() -> some View {
        ZStack {
            Image("Trainer3")
                .background {
                    Image("shadowTrainer3")
                        .offset(x: 0, y: 125)
                }
        }
    }
    
    @ViewBuilder private func ThridStepView() -> some View {
        ZStack {
            Image("Trainer4")
                .offset(x: 50)
                .background {
                    Image("shadowTrainer4")
                        .offset(x: 55, y: 125)
                }
            Image("Trainer5")
                .offset(x: -50, y: 12)
                .background {
                    Image("shadowTrainer5")
                        .offset(x: -65, y: 125)
                }
        }
    }
}

#Preview {
    OnboardinView(viewModel: OnboardingViewModel())
}
