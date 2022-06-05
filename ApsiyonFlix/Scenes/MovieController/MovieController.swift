//
//  MovieController.swift
//  ApsiyonFlix
//
//  Created by Arslan Kaan AYDIN on 6.06.2022.
//

import UIKit

class MovieController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar(largeTitleColor: .black, backgoundColor: .white, tintColor: .black, title: "Movies", preferredLargeTitle: false)
    }

}
