//
//  ParserFile.swift
//  Fancided
//
//  Created by Tejaswini MR on 29/03/21.
//

import Foundation
import UIKit
protocol DataUpdateDeligate {
    func updateTableData(titles:[Fansided])
}

class ParserFile: UITableViewController,XMLParserDelegate {
    private var titles = [Fansided]()
    var elementName: String = String()
    var newsTitle = String()
    var newsDescription = String()
    var dataurl = DataUrl()
    var data : Data?
    var deligate: DataUpdateDeligate!
    
    func getparsData(){
        dataurl.performRequest { (data) in
            let parser = XMLParser(data: data)
            //print(data)
            parser.delegate = self
            parser.parse()
        }
        
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "item" {
            newsTitle = String()
            newsDescription = String()
        }
        self.elementName = elementName
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let news = Fansided(title: newsTitle, description: newsDescription)
            titles.append(news)
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        if (!data.isEmpty) {
            if self.elementName == "title" {
                newsTitle += data
            } else if self.elementName == "description" {
                newsDescription += data
            }
        }
    }
    func parserDidEndDocument(_ parser: XMLParser){
        deligate.updateTableData(titles: titles)
    }




}

