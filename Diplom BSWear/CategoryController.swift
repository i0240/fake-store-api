import UIKit
import Alamofire
import AlamofireImage

class CategoryController: UIViewController{
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    let categoryLoader = CategoryLoader()
    var allCategory: [String] = []
    var categoryId = 1
    var allItems: [FakestoreapiCOMProduct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Category"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        categoryTableView.tableFooterView = UIView()
       
        loadData()
    }
    
    func loadData() {
        categoryLoader.loadCategories("\(categoryId)") { result in
            DispatchQueue.main.async {
                let titleArray = result.map { "\($0.category ?? "Error")" }
                self.allItems = result
                self.allCategory = Array(Set(titleArray))
                self.categoryTableView.reloadData()
            }
        }
    }
}

extension CategoryController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return allCategory.count
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoryCell
    cell.categoryLabel?.text = allCategory[indexPath.row]
    
    return cell
    }

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: .main)
    let viewController = storyboard.instantiateViewController(withIdentifier: "ItemsView") as! ItemsViewController
   
//    viewController.categoryId = allCategory[indexPath.row].id!
//    viewController.allTitle = allCategory[indexPath.row].titles!
//    viewController.subCPrice = allCategory[indexPath.row].price!
    let selectedCategory = allCategory[indexPath.row]
    viewController.allItems = allItems.filter { $0.category == selectedCategory }

    navigationController?.pushViewController(viewController, animated: true)
    categoryTableView.deselectRow(at: indexPath, animated: true)
    }
}
//extension Array where Element: Equatable {
//    func duplicate() -> [Element]{
//    var result = [Element]()
//    for el in self {
//        if result.contains(el) == false {
//            result.append(el)
//        }
//    }
//        return result
//    }
//}
//extension Sequence where Element: Hashable {
//    func uniqued() -> [Element] {
//        var set = Set<Element>()
//        return filter { set.insert($0).inserted }
//    }
//}
