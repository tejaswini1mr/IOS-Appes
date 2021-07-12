//
//  ViewController.swift
//  JsonEncode
//
//  Created by Tejaswini MR on 02/02/21.
//

import UIKit


class ViewController: UITableViewController {
    //var jsondata : JsonData?
    var employeesArry=[Employees]()
    var employeesform=[Employees(userId: "Teju", jobTitle: "Deve", firstName: "Teju", lastName: "MR", employeeCode: "123", region: "Bangl", phoneNumber: "45678", emailAddress: "tmr@gmail.com")]
    var employees="""
    [
        {
          "userId": "krish",
          "jobTitle": "Developer",
          "firstName": "Krish",
          "lastName": "Lee",
          "employeeCode": "E1",
          "region": "CA",
          "phoneNumber": "123456",
          "emailAddress": "krish.lee@learningcontainer.com"
        },
        {
          "userId": "devid",
          "jobTitle": "Developer",
          "firstName": "Devid",
          "lastName": "Rome",
          "employeeCode": "E2",
          "region": "CA",
          "phoneNumber": "1111111",
          "emailAddress": "devid.rome@learningcontainer.com"
        },
        {
          "userId": "tin",
          "jobTitle": "Program Directory",
          "firstName": "tin",
          "lastName": "jonson",
          "employeeCode": "E3",
          "region": "CA",
          "phoneNumber": "2222222",
          "emailAddress": "tin.jonson@learningcontainer.com"
        }
        ]
    """
    override func viewDidLoad() {
        super.viewDidLoad()
        employeesform.append(Employees(userId: "Nanu", jobTitle: "No work", firstName: "Tee", lastName: "Coffee", employeeCode: "2345", region: "farm", phoneNumber: "000", emailAddress: "teco@mail.com"))
        parse(json:employees)
        enco(employeesform)
        employeesArry.append(contentsOf: employeesform)//two encoded values get parsed
        print(employeesArry.count)
        enco(employeesArry)
        
        
    }
    func parse(json:String){
        let jsonData = json.data(using: .utf8)!
        let users = try! JSONDecoder().decode([Employees].self, from: jsonData)
        employeesArry=users
        print(employeesArry.count)
        for user in users {
            print(user.emailAddress)
        }
        
    }
    func enco(_ employees2:[Employees]){
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
        encoder.outputFormatting = .prettyPrinted

        do {
            let jsonData = try encoder.encode(employees2)
            print(jsonData)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeesArry.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let emp=employeesArry[indexPath.row]
        cell.textLabel?.text=emp.firstName
        return cell
    }
    
    
    

}


