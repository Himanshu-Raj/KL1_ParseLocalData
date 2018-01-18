//
//  ViewController.swift
//  ParseLocalData
//
//  Created by Chaudhary Himanshu Raj on 17/01/18.
//  Copyright © 2018 Chaudhary Himanshu Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        parseLocalJson()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parseLocalJson() {
        guard let path = Bundle.main.path(forResource: "UserDetails", ofType: "json") else{ return }
        let url = URL(fileURLWithPath: path)
        
        do{
            let data = try Data(contentsOf: url)
            print("Data recieved is : \(data)")
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            print(json)
            
            // Parsing through the Json from here
            guard let array = json as? [Any] else { return }
                // Iterating through user details
            for user in array {
                guard let userDict = user as? [String : Any] else {
                    print("User Dictionary record not retrieved properly")
                    return
                }
                
                guard let id = userDict["id"] as? Int else {
                    print("Id is not Int")
                    return
                }
                
                guard let name = userDict["name"] as? String else {
                    print("Name is not String")
                    return
                }
                
                guard let username = userDict["username"]  as? String else {
                    print("username is not string")
                    return
                }
                
                guard let email = userDict["email"]  as? String else {
                    print("email is not string")
                    return
                }
                
                guard let phone = userDict["phone"]  as? String else {
                    print("phone is not String")
                    return
                }
                
                guard let website = userDict["website"]  as? String else {
                    print("website is not string")
                    return
                }
                
                
                    // Retrieving Company Details which is again a dictionary
                    guard let company = userDict["company"] as? [String : Any] else {
                        print("Company record not retrieved properly")
                        return
                    }
                
                    guard let compName = company["name"]  as? String else {
                        print("compName is not string")
                        return
                    }
                
                    guard let compCatchPhrase = company["catchPhrase"]  as? String else {
                        print("compCatchPhrase is not string")
                        return
                    }
                
                    guard let compBs = company["bs"]  as? String else {
                        print("compBs is not string")
                        return
                    }
                
                        // Retrieving Address Details which is again a dictionary
                        guard let address = userDict["address"] as? [String : Any] else {
                            print("Address record not retrieved properly")
                            return
                        }
                
                        guard let addrStreet = address["street"] as? String else {
                            print("addrStreet is not String")
                            return
                        }
                
                        guard let addrSuite = address["suite"] as? String else {
                            print("addrSuite is not String")
                            return
                        }
                
                        guard let addrCity = address["city"] as? String else {
                            print("addrCity is not String")
                            return
                        }
                
                        guard let addrZip = address["zipcode"] as? String else {
                            print("addrZip is not String")
                            return
                        }
                
                            guard let geo = address["geo"] as? [String : String] else {
                                print("Geo record not retrieved properly")
                                return
                            }
                
                            guard let geoLat = geo["lat"] else {
                                print("geoLat is not String")
                                return
                            }
                
                            guard let geoLng = geo["lng"] else {
                                print("geoLng is not String")
                                return
                            }
                print("*************************************************************************************")
                print("Id : \(id)")
                print("Name : \(name)")
                print("Username : \(username)")
                print("Email : \(email)")
                print("Address : [Suite - \(addrSuite), Street - \(addrStreet), City - \(addrCity), Zipcode - \(addrZip), {Latitude - \(geoLat), Longitude - \(geoLng),} ]")
                print("Phone : \(phone)")
                print("Website : \(website)")
                print("Company : [ \(compName), \(compCatchPhrase), \(compBs)] ")
            }
        } catch {
            print(error)
        }
    }
}












