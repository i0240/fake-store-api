//
//  FullBusketViewController.swift
//  Diplom BSWear
//
//  Created by MyMac on 5/11/22.
//

import UIKit

//class FullBasketViewController: UIViewController {
//
//    @IBOutlet weak var totalPriceLabel: UILabel!
//
//    @IBOutlet weak var fullBasketTableView: UITableView!
//    @IBOutlet weak var customView: UIView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()

//        navigationItem.title = "Basket"
//        navigationController?.navigationBar.prefersLargeTitles = true
//        
//        fullBasketTableView.tableFooterView = customView
//    }
    
//    @IBAction func delButton(_ sender: Any) {
            
//            func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//                return true
//            }
//
//            func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//                if editingStyle == .delete {
//                    let product = self.productsInBasket[indexPath.row]
//
//                    self.productsInBasket.remove(at: indexPath.row)
//
//                    if let sum = Double(product.productPrice, nil) {
//                        totalSum -= sum
//                    }
//                    totalPriceLabel.text = "\(totalSum)"
//
//                    tableView.deleteRows(at: [indexPath], with: .automatic)
//            }
//        }
//    }
    
//    var productsInBasket: [SelectedProduct] = []
//    var totalSum = 0.0
//
//    override func viewWillAppear(_ animated: Bool) {
//        productsInBasket.removeAll()
//        totalSum = 0.0
//        let basketProducts = Persistance.shared.realmRead {
//        for prod in basketProducts {
//            productsInBasket.append(prod)
//            if let sum = Double(prod.productPrice, nil) {
//                totalSum += sum
//            }
//        }
//        totalPriceLabel.text = "\(totalSum)"
//        basketTableView.reloadData()
//        }
//    }
//}

//extension FullBasketViewController: UITableViewDataSource, UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(Persistance.shared.realmRead.count)
//        return 0
//        if Persistance.shared.realmRead.count == 0 {
//            tableView.setEmptyMessage("Basket is empty")
//        } else {
//            tableView.restore()
//        }
//        return Persistance.shared.realmRead.count
//    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "basketCell", for: indexPath) as! BasketTableViewCell
//        let model = Persistance.shared.realmRead[indexPath.row]
        
//        cell.basketNameLabel.text = "model.productName"
//        cell.basketPriceLabel.text = "model.productPrice"
//
//        if let url = URL(string: (model.productImage)) {
//            cell.basketImage.af.setImage(withURL: url)
//        }
            
//        return cell
//    }
//}

//extension UITableView {
//    func setEmptyMessage(_ message: String) {
//        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
//        messageLabel.text = message
//        messageLabel.textColor = .black
//        messageLabel.numberOfLines = 0
//        messageLabel.textAlignment = .center
//        messageLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 15)
//        messageLabel.sizeToFit()
//
//        self.backgroundView = messageLabel
//        self.separatorStyle = .none
//    }
//
//    func restore() {
//        self.backgroundView = nil
//        self.separatorStyle = .singleLine
//    }
//}
