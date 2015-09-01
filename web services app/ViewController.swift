//
//  ViewController.swift
//  web services app
//
//  Created by Quabblejack.com on 9/1/15.
//  Copyright (c) 2015 CQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        //weather api call
        let manager = AFHTTPRequestOperationManager()
        
        manager.GET( "http://api.openweathermap.org/data/2.5/forecast/daily?q=London&mode=json&units=metric&cnt=1",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                println("Response: " + responseObject.description)
                if let listOfDays = responseObject["list"] as? NSArray {
                    if let tomorrow = listOfDays[0] as? NSDictionary {
                        if let tomorrowsWeather = tomorrow["weather"] as? NSArray {
                            if let firstWeatherOfDay = tomorrowsWeather[0] as? NSDictionary {
                                if let forecast = firstWeatherOfDay["description"] as? String {
                                    self.forecastLabel.text = forecast
                                }
                            }
                        }
                    }
                }
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error: " + error.localizedDescription)
        })
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

