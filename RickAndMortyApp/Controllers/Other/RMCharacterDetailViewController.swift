//
//  RMCharacterDetailViewController.swift
//  RickAndMortyApp
//
//  Created by User on 17/07/23.
//

import UIKit

final class RMCharacterDetailViewController: UIViewController {

    init(viewModel: RMCharacterDetailViewViewModel) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsuported")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
