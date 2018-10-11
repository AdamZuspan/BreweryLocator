//
//  ViewController.swift
//  Breweries
//
//  Created by Admin on 8/25/18.
//  Copyright © 2018 MobileAppsCompany. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher
import MapKit
import CoreLocation
import UserNotifications



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate, CLLocationManagerDelegate {
   
    var arrData = [JsonModel]()


    @IBOutlet weak var myVC: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // request access from the notificationCenter
        let notiCenter = UNUserNotificationCenter.current()
        notiCenter.requestAuthorization(options: [[.alert, .sound, .badge]],
                                        completionHandler: { (granted, error) in
                                         
        })
        
        //Parse BeerBrew API
        jsonParsing()
    }
    
    func jsonParsing(){
        
        let url = URL(string: "https://api.openbrewerydb.org/breweries")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else {return}
            do {
                let json = try JSON(data:data)
                
                for data in json.arrayValue {
                
                    self.arrData.append(JsonModel(json: data))
                    
                }
                DispatchQueue.main.async {
                    self.myVC.reloadData()
                
                }
  
            }
            catch {
                print("Error was \(error.localizedDescription)")
            }
            
            }.resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyTableViewCell
        
        let vm = arrData[indexPath.row]
        
        cell.myCell.text = vm.company
        cell.myCellState.text = arrData[indexPath.row].state
        cell.myCellCity.text = arrData[indexPath.row].city
        cell.dividerImage.image = UIImage(named: "coin")
        cell.dividerTopImage.image = UIImage(named: "dividerBar")
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let lbldetails:ImageViewController = self.storyboard?.instantiateViewController(withIdentifier: "adam") as! ImageViewController
        
        lbldetails.mainlbl1 = arrData[indexPath.row].company
        lbldetails.mainlbl2 = arrData[indexPath.row].city
        lbldetails.mainlbl3 = arrData[indexPath.row].websiteUrl
        
        self.navigationController?.pushViewController(lbldetails, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            arrData.remove(at: indexPath.row)
            myVC.reloadData()
            
        }
    }


}



