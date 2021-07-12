//
//  ViewController.swift
//  tableView
//
//  Created by Tejaswini MR on 01/02/21.
//

import UIKit

class ViewController: UITableViewController {
    var pictures=[String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Maps"
        navigationController?.navigationBar.prefersLargeTitles=true
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items{
            if item.hasSuffix(".png"){
                pictures.append(item)
            }
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let index=pictures[indexPath.row].firstIndex(of: "@")
        let country = pictures[indexPath.row].substring(to: index!)
        cell.textLabel?.text="\(country)"
        cell.detailTextLabel?.text="\(country) flag"
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DidSelectViewController{
            vc.image = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)

        }
        
    }


}

