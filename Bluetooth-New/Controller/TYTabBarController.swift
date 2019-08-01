//
//  TYTabBarController.swift
//  Bluetooth-New
//
//  Created by Yi Tong on 7/30/19.
//  Copyright © 2019 Yi Tong. All rights reserved.
//

import UIKit
import SnapKit

class TYTabBarController: UIViewController {
    
    var currentIndex: Int = 0
    var viewControllers: [UIViewController]?
    
    private weak var buttonStack: UIStackView!
    private weak var contentScrollView: UIScrollView!
    private weak var slider: UIView!
    private weak var container: UIView!
    
    private let navigationBarHeight: CGFloat = 30
    private let gap: CGFloat = 0
    private let sliderHeight: CGFloat = 2
    private let sliderWidth: CGFloat = 20

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    @objc func itemButtonTapped(sender: UIButton) {
        guard let index = buttonStack.arrangedSubviews.firstIndex(of: sender) else { return }
        
        contentScrollView.scrollRectToVisible(CGRect(x: CGFloat(index) * contentScrollView.bounds.width, y: 0, width: contentScrollView.bounds.width, height: contentScrollView.bounds.height), animated: true)
    }
    
    private func updateButtonTitle() {
        guard let viewControllers = viewControllers, viewControllers.count != 0 else { return }
        
        for (i, subView) in buttonStack.arrangedSubviews.enumerated() {
            guard let button = subView as? UIButton else { break }
            
            if i == currentIndex {
                button.setAttributedTitle(NSAttributedString(string: viewControllers[i].title ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .medium)]), for: .normal)
            } else {
                button.setAttributedTitle(NSAttributedString(string: viewControllers[i].title ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .regular)]), for: .normal)
            }
        }
    }
    
    private func updateSliderPosition(_ index: Int) {
        guard let viewControllers = viewControllers, viewControllers.count != 0 else { return }
        let x = 0.5 * CGFloat(index + 1) * buttonStack.bounds.width / CGFloat(viewControllers.count) - sliderWidth * 0.5
        let y = navigationBarHeight - sliderHeight
        slider.frame = CGRect(x: x, y: y, width: sliderWidth, height: sliderHeight)
    }
    
    private func updateSliderPosition(_ offsetX: CGFloat) {
        guard let viewControllers = viewControllers, viewControllers.count != 0 else { return }
        let buttonWidth = contentScrollView.bounds.width / CGFloat(viewControllers.count)
        let sliderOffsetX = buttonWidth / contentScrollView.bounds.width * offsetX + (buttonWidth - sliderWidth) * 0.5
        
        slider.frame = CGRect(x: sliderOffsetX, y: slider.frame.origin.y, width: sliderWidth, height: sliderHeight)
    }
    
    private func addChildren(_ viewContronllers: [UIViewController]) {
        contentScrollView.contentSize = CGSize(width: CGFloat(viewContronllers.count) * contentScrollView.bounds.width, height: contentScrollView.bounds.height)
        
        for (i, viewController) in viewContronllers.enumerated() {
            //add content view
            viewController.willMove(toParent: self)
            addChild(viewController)
            contentScrollView.addSubview(viewController.view)
            viewController.view.bounds.size = contentScrollView.bounds.size
            viewController.view.frame.origin = CGPoint(x: CGFloat(i) * contentScrollView.bounds.width, y: 0)
            
            //add navigation bar
            let item = UIButton()
            item.addTarget(self, action: #selector(itemButtonTapped), for: .touchUpInside)
            buttonStack.addArrangedSubview(item)
        }
    }
    
    private func setup() {
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        navigationController?.navigationBar.setBackgroundImage(UIImage.from(.white), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let container = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: navigationBarHeight))
        container.backgroundColor = .white
        self.container = container
        view.addSubview(container)
        
        let buttonStack = UIStackView(frame: container.bounds)
        buttonStack.distribution = .fillEqually
        buttonStack.axis = .horizontal
        self.buttonStack = buttonStack
        container.addSubview(buttonStack)
        
        let contentScrollView = UIScrollView(frame: CGRect(x: 0, y: container.frame.maxY + gap, width: view.bounds.width, height: view.bounds.height - navigationBarHeight - gap))
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        contentScrollView.delegate = self
        contentScrollView.bounces = false
        contentScrollView.isPagingEnabled = true
        contentScrollView.showsHorizontalScrollIndicator = false
        contentScrollView.showsVerticalScrollIndicator = false
        self.contentScrollView = contentScrollView
        view.addSubview(contentScrollView)
        
        let slider = UIView()
        slider.backgroundColor = .black
        self.slider = slider
        buttonStack.addSubview(slider)
        
        if let viewControllers = viewControllers {
            addChildren(viewControllers)
            updateSliderPosition(currentIndex)
            updateButtonTitle()
        }
    }
}

extension TYTabBarController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateSliderPosition(scrollView.contentOffset.x)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        getCurrentIndex(scrollView.contentOffset.x)
        updateButtonTitle()
    }
    
    private func getCurrentIndex(_ offsetX: CGFloat) {
        let contentScrollViewWidth = contentScrollView.bounds.width
        currentIndex = Int((offsetX / contentScrollViewWidth).rounded())
    }
}
