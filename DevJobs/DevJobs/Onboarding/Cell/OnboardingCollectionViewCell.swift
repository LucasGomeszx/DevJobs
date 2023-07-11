//
//  OnboardingCollectionViewCell.swift
//  DevJobs
//
//  Created by Lucas Gomesx on 10/07/23.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: OnboardingCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    @IBOutlet weak var onboardingImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .blue
        onboardingImage.contentMode = .scaleAspectFill
        onboardingImage.clipsToBounds = true
    }
    
    public func setupCell(onboardingImage: String) {
        self.onboardingImage.image = UIImage(named: onboardingImage)
    }

}
