//
//  CardViewController.swift
//  Diplom BSWear
//
//  Created by MyMac on 5/3/22.
//

import UIKit

class CardViewController: UIViewController {
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var priceCardLabel: UILabel!
    @IBOutlet weak var descriptionCardLabel: UILabel!
    
    var product: FakestoreapiCOMProduct?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedProduct = product {
            cardNameLabel.text = selectedProduct.titles
            priceCardLabel.text = selectedProduct.price != nil ? "\(selectedProduct.price!) $" : "unknown price"
            descriptionCardLabel.text = selectedProduct.description
            
            if let url = URL(string: (product?.image)!) {
                cardImage.af.setImage(withURL: url)
            }
        }
    }
    
    @IBAction func orderProduct(_ sender: Any) {
        if let prod = product {
            let selectedProduct = SelectedProduct()
                selectedProduct.productImage = prod.image ?? ""
                selectedProduct.productName = prod.titles ?? ""
                selectedProduct.productPrice = prod.price!
            
            Persistance.shared.realmWrite(selectedProduct)
        }
    }
    
    
}
