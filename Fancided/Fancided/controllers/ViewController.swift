//
//  ViewController.swift
//  Fancided
//
//  Created by Tejaswini MR on 25/03/21.
//

import UIKit
import SQLite
import Network

class ViewController: UITableViewController, XMLParserDelegate,DataUpdateDeligate {
    let monitor = NWPathMonitor()
    var titles2 = [Fansided]()
    var parse = ParserFile()
    var dataBase: Connection!
    let newsTable = Table("news")
    let id = Expression<Int>("id")
    let titles = Expression<String>("title")
    let descriptions = Expression<String>("description")
    
    @IBOutlet weak var fansidedNews: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("news").appendingPathExtension("sqlite3")
            if !fileUrl.isFileURL {
                createDataBaseTable()
            }
            let dataBase = try Connection(fileUrl.path)
            print(fileUrl.path)
            self.dataBase = dataBase
            
        } catch  {
            print(error)
        }
        MonitorAndLoad()
        
    }
    func createDataBaseTable(){
        let createtable = self.newsTable.create{(table) in table.column(self.id,primaryKey: true)
            table.column(self.titles,primaryKey: false)
            table.column(self.descriptions)
        }
        do{
            try self.dataBase.run(createtable)
        }catch{
            print(error)
        }
        
    }
    func MonitorAndLoad(){
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied{
                DispatchQueue.main.async {
                    self.parse.deligate = self
                    self.parse.getparsData()
                    print("net work connected ")
                }
            }else{
                DispatchQueue.main.async {
                    print("not connected")
                    self.updateTableDataFromDB()
                }
            }
            
        }
        let queue = DispatchQueue(label: "Network")
        monitor.start(queue: queue)
    }
    func updateTableDataFromDB(){
        do {
            let newsInfo = try self.dataBase.prepare(self.newsTable)
            for news in newsInfo {
                let new = Fansided(title: news[self.titles], description: news[self.descriptions])
                titles2.append(new)
                DispatchQueue.main.async { self.tableView.reloadData()}
                print(titles2)
            }
        } catch {
            print(error)
        }
    }
    func updateTableData(titles: [Fansided]) {
        self.titles2.append(contentsOf: titles)
        DispatchQueue.main.async { self.tableView.reloadData()}
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles2.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = titles2[indexPath.row]
        //print(item)
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.description.withoutHtml
        let insertValues = self.newsTable.insert(self.titles <- item.title,self.descriptions <- item.description.withoutHtml )
        do {
            try self.dataBase.run(insertValues)
            print("INSERTED USER")
            print(newsTable)
        } catch {
            print(error)
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "detail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail"{
            if let destVC = segue.destination as? DestiViewController{
                let item = titles2[(fansidedNews.indexPathForSelectedRow?.row)!].description
                destVC.newsdetail = item.description.withoutHtml
            }
        }
    }
    
}
extension String {
    public var withoutHtml: String {
        guard let data = self.data(using: .utf8) else {
            return self
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return self
        }
        
        return attributedString.string
    }
    
}

