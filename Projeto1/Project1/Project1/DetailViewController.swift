//
//  DetailViewController.swift
//  Project1
//
//  Created by Yasmin on 27/11/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectImage: String?
    var selectedPictureNumber = 1
    var totalPictures = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Imagem \(selectedPictureNumber) de \(totalPictures)"
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}
