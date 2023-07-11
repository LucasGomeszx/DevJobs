//
//  OnboardingViewModel.swift
//  DevJobs
//
//  Created by Lucas Gomesx on 11/07/23.
//

import Foundation

class OnboardingViewModel {
    
    private var onboardingList: [String] = ["Onboarding1", "Onboarding2"]
    
    var getOnbordingCount: Int {
        onboardingList.count
    }
    
    public func getOnbordingImage(index: Int) -> String {
        onboardingList[index]
    }
    
    public func isFinalImage(index: Int) -> Bool {
        if getOnbordingCount - 1 == index {
            return false
        }else {
            return true
        }
    }
    
}
