//
//  ViewController.swift
//  ADS101 Assessment - Traffic Lights
//
//  Created by Chris Chong on 3/6/20.
//  Copyright © 2020 Chris. All rights reserved.
//

import UIKit

import QuartzCore

class ViewController: UIViewController {

    @IBOutlet weak var introductionLabel: UILabel!
    @IBOutlet weak var introductionSubtitleLabel: UILabel!
    @IBOutlet weak var pageButton: UIButton!
    @IBOutlet weak var segueButton: UIButton!
    
    //Variable used to change between the pages
    var info_state : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("mainViewController Loaded")
        
        //Add clear text to the background of the label
        introductionLabel.backgroundColor = UIColor.lightText
        
        //Add rounded corners to the introduction and title label
        introductionLabel.layer.cornerRadius = 20
        introductionLabel.layer.masksToBounds = true
        
        //Sets the subtitle header
        introductionSubtitleLabel.text = "WHAT ARE TRAFFIC LIGHTS ?"
        
        //Set text colour
        introductionLabel.textColor = .black
        introductionSubtitleLabel.textColor = .black
        
        //Sets the introdction body of the text
        introductionLabel.text = """
        The main purpose of Traffic lights is to control the flow of traffic. They are generally located at road intersections/ junctions and pedestrian crossings
        """
        
        //Add text to the button text
        pageButton.setTitle("Next", for: .normal)
        
        //Clear the button text and disable the button until the user has read through the introduction
        segueButton.setTitle("", for: .normal)
        segueButton.isEnabled = false
        
    }
    
    //Resets any widgets that were initially set up in viewDidLoad -> this is used when the user taps the back button on the next view
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
        
        //Set the subtitle header
        introductionSubtitleLabel.text = "WHAT ARE TRAFFIC LIGHTS ?"
        
        
        //Set the introdction body of the text
        introductionLabel.text = """
        The main purpose of Traffic lights is to control the flow of traffic. They are generally located at road intersections/ junctions and pedestrian crossings
        """

        //Add text to the button text
        pageButton.setTitle("Next", for: .normal)
        
        //Clear the button text and disable the button until the user has read through the introduction
        segueButton.setTitle("", for: .normal)
        segueButton.isEnabled = false
        
    }

    
    @IBAction func pageButton(_ sender: Any) {
        
        //Increment the variable to cycle through information displayed on the label
        info_state += 1
        
        //Controls the flow of the information
        switch(info_state)
        {
            case 1:
                
                //Set the title of the information body
                introductionSubtitleLabel.text = "TRAFFIC LIGHT COLOUR CODES"
                
                //Set the label text explaining about the color codes
                introductionLabel.text = """
                Traffic lights adhere to a colour standard consiting of three colours:
                
                GREEN
                YELLOW (AMBER)
                RED
                """
                
                //Set text for the button
                pageButton.setTitle("Next", for: .normal)
                
            break
            
            case 2:
                
                //Clear the subtitle
                introductionSubtitleLabel.text = ""
                
                //Set the information body text
                introductionLabel.text = "To find out more information click the button below"
                
                //Clear the text
                pageButton.setTitle("", for: .normal)
                
                //Enable the segue button and set the text
                segueButton.setTitle("NEXT PAGE", for: .normal)
                segueButton.isEnabled = true
                
                //Reset the state
                info_state = 0
                
            break
            
            default:
            break
            
        }
        
        

    }
    
    
    
    
    
    
    

}

