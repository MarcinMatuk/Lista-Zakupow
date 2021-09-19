//
//  ViewController.swift
//  kamienMilowy4-6
//
//  Created by Marcin Matuk on 31/07/2021.
//

import UIKit

class ViewController: UITableViewController {
    
    var shopList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Lista zakupów"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(dodajProdukt))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(kasujListe))
    }
    
    
    @objc func kasujListe(){
        shopList.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    
    @objc func dodajProdukt(){
        let ac = UIAlertController(title: "Wprowadź produkt", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let potwierdzenieDodaniaProduktu = UIAlertAction(title: "Potwierdź", style: .default) { [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
            ac.addAction(potwierdzenieDodaniaProduktu)
            present(ac, animated: true)
    }
    
    func submit(_ answer: String) {
        shopList.insert(answer, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopList", for: indexPath)
        cell.textLabel?.text = shopList[indexPath.row]
        return cell
    }
}

