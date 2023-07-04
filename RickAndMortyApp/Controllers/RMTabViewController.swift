//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by User on 04/07/23.
//

import UIKit

final class RMTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setUpTabs()
        
    }
    
    private func setUpTabs() {
        let charactervc = RMCharacterViewController()
        let episodevc = RMEpisodeViewController()
        let locationvc = RMLocationViewController()
        let settingvc = RMSettingViewController()

        
        let nav1 = UINavigationController(rootViewController: charactervc)
        let nav2 = UINavigationController(rootViewController: episodevc)
        let nav3 = UINavigationController(rootViewController: locationvc)
        let nav4 = UINavigationController(rootViewController: settingvc)
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
    }
}

