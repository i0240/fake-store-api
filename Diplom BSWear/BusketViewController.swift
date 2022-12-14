//
//  BusketViewController.swift
//  Diplom BSWear
//
//  Created by MyMac on 10/20/22.
//

import UIKit

class BusketViewController: UIViewController {

    @IBOutlet weak var busketTableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    let persistance = Persistance.shared
    var productsInBasket: [SelectedProduct] = []
    var selectedCart: [SelectedProduct]?
    var totalSum = 0.0
    
    var finalPrice: String {
        guard productsInBasket.count > 0 else { return "0"}
        var totalSum: Double = 0.0
        for item in productsInBasket {
            if let sum = Double("\(item.productPrice)") {
                totalSum += sum
            }
        }
        return "\(totalSum) $"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productsInBasket = persistance.realmRead()
        navigationItem.title = "Basket"
        navigationController?.navigationBar.prefersLargeTitles = true
    
        busketTableView.tableFooterView = UIView()
        busketTableView.reloadData()
    }

override func viewWillAppear(_ animated: Bool) {
    updatePrice()
    busketTableView.reloadData()
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        selectedCart = [productsInBasket[sender.tag]]
//        let prods = self.productsInBasket
        self.persistance.realmDelete(product: selectedCart ?? [])
        self.productsInBasket = self.persistance.realmRead()
        self.busketTableView.reloadData()
        self.updatePrice()
    }
    
    private func updatePrice() {
        totalPriceLabel.text = finalPrice
    }
}

extension BusketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if productsInBasket.count == 0 {
            tableView.setEmptyMessage("Basket is empty")
                } else {
                    tableView.restore()
                }
        return productsInBasket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basketCell", for: indexPath) as! BasketTableViewCell
        
        let model = productsInBasket[indexPath.row]
        
        cell.basketNameLabel.text = "\(model.productName)"
        cell.basketPriceLabel.text = "\(model.productPrice) $"
        cell.removeRowButton.tag = indexPath.row
        
        if let url = URL(string: (model.productImage)) {
            cell.basketImage.af.setImage(withURL: url)
        }
                return cell
        }
    }

extension UITableView {
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 15)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
