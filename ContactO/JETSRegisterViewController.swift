//
//  JETSRegisterViewController.swift
//  ContactO
//
//  Created by JETS on 4/29/17.
//  Copyright © 2017 JETS. All rights reserved.
//

import UIKit
import Alamofire

class JETSRegisterViewController: UIViewController {

    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var mobile: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBAction func registerBtn(sender: AnyObject) {
        Alamofire.request(.GET, "http://192.168.205.2:5030/contactListProject/rest/users/register", parameters: ["email": email.text!,"password": password.text!,"mobile": mobile.text!,"phone": phone.text!,"userName": "7amada","fullName": fname.text!])
        .responseString { response in
            print(">>> Success: \(response.result.isSuccess)")
            print(">>> Response String: \(response.result.value!)")
            
            
            if response.result.value == "DONE" {
            
                //////// 1. save user in NSUserDefaults
                
                
                
                //////// 2.  redirect to contactsList tableview
                
                var homeCtrl : JESTContactsTableViewController = self.storyboard?.instantiateViewControllerWithIdentifier("contactsCtrl") as! JESTContactsTableViewController
                
                
                self.navigationController?.pushViewController(homeCtrl, animated: true)
            
            }else{
                
                //////// ehaaaaab :::: backend do not check for email existence
                //////// we will show an Alert
                print("ERROR while registering new contact .. ")
                
                let alert = UIAlertController(title: "ERROR", message: "This email is already registered on ContactO!", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Try again!", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            
            }
            
            
        }
    
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Register page is Loaded .. :) ")
        
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
