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

        charactervc.navigationItem.largeTitleDisplayMode = .automatic
        episodevc.navigationItem.largeTitleDisplayMode = .automatic
        locationvc.navigationItem.largeTitleDisplayMode = .automatic
        settingvc.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: charactervc)
        let nav2 = UINavigationController(rootViewController: episodevc)
        let nav3 = UINavigationController(rootViewController: locationvc)
        let nav4 = UINavigationController(rootViewController: settingvc)
        
        nav1.tabBarItem = UITabBarItem(title: Character", image: UIImage(systemName: "person"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Episode", image: UIImage(systemName: "tv"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Location", image: UIImage(systemName: "map"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(systemName: "gear"), tag: 4)
        
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
    }
}

