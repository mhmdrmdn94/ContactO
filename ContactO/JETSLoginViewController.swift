//
//  JETSLoginViewController.swift
//  ContactO
//
//  Created by JETS on 4/29/17.
//  Copyright © 2017 JETS. All rights reserved.
//

import UIKit
import Alamofire

class JETSLoginViewController: UIViewController {

    @IBOutlet weak var passwordLogin: UITextField!
    @IBOutlet weak var emailLogin: UITextField!
   
    
    @IBAction func loginBtn(sender: AnyObject) {
       // print (">>>> \( emailLogin.text! ) --- \( passwordLogin.text! )")
        
        Alamofire.request(.GET, "http://192.168.205.2:5030/contactListProject/rest/users/login", parameters: ["email": emailLogin.text!,"password": passwordLogin.text!])
            .responseJSON { response in switch response.result {
           
            
            case .Success(let JSON):
                print("Success with JSON: \(JSON)")
                
                let response = JSON as! NSDictionary
               
                let status : String = response.objectForKey("status")! as! String
               
                if status  == "SUCCESS"{
                
                    /////// 1. save user in NSUserDefaults
                
                    
                    /////// 2. redirect to contctsList
                    
                    var homeCtrl : JESTContactsTableViewController = self.storyboard?.instantiateViewControllerWithIdentifier("contactsCtrl") as! JESTContactsTableViewController
                    
                    
                    self.navigationController?.pushViewController(homeCtrl, animated: true)
                    
                    
                
                }else{
                    /////// login failed; show an Alert with the reason
                    print("ERROR while logging in .. ")
                    
                    let message : String = response.objectForKey("result")! as! String
                    
                    let alert = UIAlertController(title: "Login Failed", message: message, preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)

                
                }
                
            case .Failure(let error):
                print("Request failed with error: \(error)")
                }
                
                
                
        }
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Login page is Loaded .. :) ")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
