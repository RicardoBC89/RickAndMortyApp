//
//  Extenions.swift
//  RickAndMortyApp
//
//  Created by User on 05/07/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
