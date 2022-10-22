import UIKit

class ItemsViewController: UIViewController {
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    var allItems: [FakestoreapiCOMProduct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Items"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension ItemsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemsCell", for: indexPath) as! ItemsCollectionViewCell
        let item = allItems[indexPath.row]
        cell.nameItemLabel.text = item.titles
        cell.priceLabel.text = item.price != nil ? "\(item.price!) $" : "unknown"

        if let url = URL(string: (item.image)!) {
            cell.itemImageView.af.setImage(withURL: url)
        }
        return cell
    }
}

extension ItemsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "CardView") as! CardViewController
        
        viewController.product = allItems[indexPath.row]
        
        navigationController?.pushViewController(viewController, animated: true)
        itemCollectionView.deselectItem(at: indexPath, animated: true)
    }
}
