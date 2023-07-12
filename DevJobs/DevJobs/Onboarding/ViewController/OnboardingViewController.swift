//
//  OnboardingViewController.swift
//  DevJobs
//
//  Created by Lucas Gomesx on 10/07/23.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var arrowImage: UIImageView!
    
    private var viewModel: OnboardingViewModel = OnboardingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configCollectionView()
    }
    
    private func setupView() {
        navigationController?.navigationBar.isHidden = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(naviWelcomeScreen))
        arrowImage.addGestureRecognizer(gesture)
        arrowImage.isUserInteractionEnabled = true
        arrowImage.image = UIImage(systemName: "arrow.right")
        arrowImage.tintColor = .black
        arrowImage.isHidden = true
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .gray
        pageControl.numberOfPages = viewModel.getOnbordingCount
    }
    
    private func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 0
            layout.minimumLineSpacing = 0
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
        }
        collectionView.register(OnboardingCollectionViewCell.nib(), forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
    }
    
    @objc private func naviWelcomeScreen() {
        let vc: WelcomeViewController? = UIStoryboard(name: "WelcomeViewController", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }

}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getOnbordingCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as? OnboardingCollectionViewCell
        cell?.setupCell(onboardingImage: viewModel.getOnbordingImage(index: indexPath.row))
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height + 20)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        pageControl.currentPage = currentPage
        arrowImage.isHidden = viewModel.isFinalImage(index: currentPage)
    }
    
}
