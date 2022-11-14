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
    
    func realmWrite(product: SelectedProduct) {
        try! realm.write{
            realm.add(product)
        }
    }
    
    func realmDelete(product: [SelectedProduct]) {
        try! realm.write{
            realm.delete(product)
        }
    }
    func realmRead() -> [SelectedProduct] {
        let results: Results<SelectedProduct> = realm.objects(SelectedProduct.self)
        return Array(results)
    }
}
