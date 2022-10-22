//
//  Persistance.swift
//  Diplom BSWear
//
//  Created by MyMac on 10/6/22.
//

import RealmSwift

class Persistance {
    static let shared = Persistance()
    
    let realm = try! Realm()
    
    var realmRead: [SelectedProduct] {
        return realm.objects(SelectedProduct.self).map{ $0 }
    }
    
    func realmWrite(_ product: SelectedProduct) {
        try! realm.write{
            realm.add(product)
        }
    }
    
    func realmDelete(_ product: SelectedProduct) {
        try! realm.write{
            realm.delete(product)
        }
    }
//    func realmRead() -> Results<SelectedProduct> {
//        let array = realm.objects(SelectedProduct.self)
//        return array
//    }
}
