//
//  InfoViewController.swift
//  ADS101 Assessment - Traffic Lights
//
//  Created by Chris Chong on 6/6/20.
//  Copyright © 2020 Chris. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var subtitleHeaderLabel: UILabel!
    @IBOutlet weak var informationBodyLabel: UILabel!
    
    @IBOutlet weak var redLight: UIButton!
    @IBOutlet weak var yellowLight: UIButton!
    @IBOutlet weak var greenLight: UIButton!
    
    @IBOutlet weak var userPageButton: UIButton!
    
    //Variable used to represent the quiz questions
    var quiz_question : Int = 0
    
    //Variable used to cycle through pages in the information body
    var page_state : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("infoViewController Loaded")
        
        //Add clear text to the background of the label
        informationBodyLabel.backgroundColor = UIColor.lightText
        
        //Add rounded corners to the introduction and title label
        informationBodyLabel.layer.cornerRadius = 20
        informationBodyLabel.layer.masksToBounds = true
        
        //Set the header and information body
        subtitleHeaderLabel.text = "TRAFFIC LIGHT SEQUENCE"
        informationBodyLabel.text = """
        Traffic lights run in a sequential loop, cycling from Green to Yellow, Yellow to Red, and then Red to Green
        
        Click the button below to proceed
        """
        
        //Set text colour
        subtitleHeaderLabel.textColor = .black
        informationBodyLabel.textColor = .black
        
        //Set the button text
        userPageButton.setTitle("Next", for: .normal)
        
        //Clears the button labels
        redLight.setTitle("", for: .normal)
        yellowLight.setTitle("", for: .normal)
        greenLight.setTitle("", for: .normal)
        
    }
    
    @IBAction func infoPageButton(_ sender: Any) {
        
        //Increment to the next body of info
        page_state += 1
        
        //Controls the flow of pages and quiz questions
        switch page_state {
        case 1:
            
            //Display the green light image
            greenLight.setImage(UIImage(named: "green_light.png"), for: .normal)
            
            //Set label texts to explain the Green light
            subtitleHeaderLabel.text = "GREEN - GO"
            informationBodyLabel.text = """
            The green light means it is okay for drivers to 'GO'
            """

        break
            
        case 2:
            
            //Disable the green light button. A shaded look is produced. Prevent user from tapping the button
            greenLight.isEnabled = false
            
            //Talk about the meaning of the yellow light
            yellowLight.setImage(UIImage(named: "yellow_light.png"), for: .normal)
            
            //Set label texts to explain the Yellow (Amber) light
            subtitleHeaderLabel.text = "YELLOW (AMBER) - SLOW DOWN"
            informationBodyLabel.text = """
            The yellow light a.k.a amber light means that the driver should be prepared to slow down or stop. This color always comes after the green light.
            """
            
        break
            
        case 3:
            
            //Disable the yellow light button. A shaded look is produced. Prevent user from tapping the button
            yellowLight.isEnabled = false
            
            //Talk about the meaning of the red light
            redLight.setImage(UIImage(named: "red_light.png"), for: .normal)
            
            //Set label texts to explain the Red light
            subtitleHeaderLabel.text = "RED - STOP"
            informationBodyLabel.text = """
            The red light means for the driver to stop until the light turns green. This color always comes after the yellow light. The light will turn green after a specific amount of time.
            """
            
        break
            
        case 4:
            
            //Disable the red light button. Prevent user from tapping the button
            redLight.isEnabled = false
            
            //Set label texts to explain the Quiz information
            subtitleHeaderLabel.text = "************** QUIZ TIME **************"
            informationBodyLabel.text = """
            Time to test your knowledge!
            
            Read the questions and tap the correct light color
            
            Click the button below when you are ready
            """
                        
            userPageButton.setTitle("READY", for: .normal)

            
        break
            
        case 5:
            
            //Enable the light buttons for Quiz time
            redLight.isEnabled = true
            yellowLight.isEnabled = true
            greenLight.isEnabled = true
            
            //Disable the button and clear the text
            userPageButton.setTitle("", for: .normal)
            userPageButton.isEnabled = false
            
            
            //Set the label texts to show QUESTION #1
            subtitleHeaderLabel.text = "************** QUESTION #1 **************"
            informationBodyLabel.text = """
            Which light color means that the driver can continue to drive?
            """
            
            //Set the question state to question number 1
            quiz_question = 1
            
        break
            
        case 6:
            
            //Disable the button and clear the text
            userPageButton.setTitle("", for: .normal)
            userPageButton.isEnabled = false
            
            //Set the label texts to show QUESTION #2
            subtitleHeaderLabel.text = "************** QUESTION #2 **************"
            informationBodyLabel.text = """
            Which light color means to slow down or prepare to stop?
            """
            
            //Set the question state to question number 2
            quiz_question = 2
            
        break
            
            
        case 7:
            
            //Disable the button and clear the text
            userPageButton.setTitle("", for: .normal)
            userPageButton.isEnabled = false
            
            //Set the label texts to show QUESTION #3
            subtitleHeaderLabel.text = "************** QUESTION #3 **************"
            informationBodyLabel.text = """
            Which light color means to stop?
            """
        
            //Set the question state to question number 3
            quiz_question = 3
        
        break
            
        case 8: //RESET QUESTIONS and loop back to the beginning
            
            //Set label text to congratulate the user for completing the quiz
            subtitleHeaderLabel.text = "CONGRATULATIONS"
            informationBodyLabel.text = """
            You have completed the Quiz! If you want to revise click the button below
            
            """

            //Reset the variable for the questions
            quiz_question = 0
            
            
            //Remove the images on all buttons
            redLight.setImage(nil, for: .normal)
            yellowLight.setImage(nil, for: .normal)
            greenLight.setImage(nil, for: .normal)
            
        break
            
        case 9: //LOAD the beginning text
            
            //Set the header and information body
            subtitleHeaderLabel.text = "TRAFFIC LIGHT SEQUENCE"
            informationBodyLabel.text = """
            Traffic lights run in a sequential loop, cycling from Green to Yellow, Yellow to Red, and then Red to Green
            
            Click the button below to proceed
            """
            
            //Set the button text
            userPageButton.setTitle("Next", for: .normal)
            
            //Reset the page_state
            page_state = 0
            
        break
            
        default:
        break
        }
        
    }
    
    @IBAction func redLightButton(_ sender: Any) {
        
        //Determines the answers to the quiz questions
        switch quiz_question {
                
        case 1: //QUESTION #1 - WRONG ANSWER
                
            //Disable the page button
            userPageButton.isEnabled = false
            userPageButton.setTitle("", for: .normal)
            
            //Set the label text to show the user it is the wrong answer and repeat the question
            informationBodyLabel.text = """
            INCORRECT!!!
            
            You are very far off!
            
            QUESTION: Which light color means that the driver can continue to drive?
            """
            
        break
            
        case 2: //QUESTION #2 - WRONG ANSWER
            
            //Disable the page button
            userPageButton.isEnabled = false
            userPageButton.setTitle("", for: .normal)
            
            //Set the label text to show the user it is the wrong answer and repeat the question
            informationBodyLabel.text = """
            INCORRECT!!!

            Close...but so far...
            
            Which light color means to slow down or prepare to stop?
            """
            
        break
            
        case 3: //QUESTION #3 - CORRECT ANSWER
            
            //Enable the page button to move to the next question
            userPageButton.isEnabled = true
            userPageButton.setTitle("Next", for: .normal)
            
            
            //Set the label text to show the user it is the correct answer
            informationBodyLabel.text = """
            CORRECT!!!
            
            The red light means that you must stop
            
            Click below to finish
            """

        break
            
        default:
            
        break
        }
        
    }
    
    @IBAction func yellowLightButton(_ sender: Any) {
        
        //Determines the answers to the quiz questions
        switch quiz_question {
                
        case 1: //QUESTION #1 - WRONG ANSWER
                
            //Disable the page button
            userPageButton.isEnabled = false
            userPageButton.setTitle("", for: .normal)

            //Set the label text to show the user it is the wrong answer and repeat the question
            informationBodyLabel.text = """
            INCORRECT!!!

            Really????
            
            QUESTION: Which light color means that the driver can continue to drive?
            """
            
        break
            
        case 2: //QUESTION #2 - CORRECT ANSWER
            
           
            
            //Enable the page button to move to the next question
            userPageButton.isEnabled = true
            userPageButton.setTitle("Next Question", for: .normal)
            
            
            //Set the label text to show the user it is the correct answer
            informationBodyLabel.text = """
            CORRECT!!!
            
            The yellow light means that you need to slow down or prepare to stop
            
            Click below to move to the next question
            """
            
            
        break
            
        case 3: //QUESTION #3 - WRONG ANSWER
            
            //Disable the page button
            userPageButton.isEnabled = false
            userPageButton.setTitle("", for: .normal)
            
            //Set the label text to show the user it is the wrong answer and repeat the question
            informationBodyLabel.text = """
            INCORRECT!!!

            yeah...i don't think so.....!
            
            Which light color means to stop?
            """
            
        break
            
        default:
            
        break
        }
        
    }
    
    @IBAction func greenLightButton(_ sender: Any) {
        
        //Determines the answers to the quiz questions
        switch quiz_question {
                
        case 1: //QUESTION #1 - CORRECT ANSWER
                
            //Enable the page button to move to the next question
            userPageButton.isEnabled = true
            userPageButton.setTitle("Next Question", for: .normal)
            
            //Set the label text to show the user it is the correct answer
            informationBodyLabel.text = """
            CORRECT!!!
            
            The green light means that you can now continue driving
            
            Click below to move to the next question
            """
            
        break
            
        case 2: //QUESTION #2 - WRONG ANSWER
            
            //Disable the page button
            userPageButton.isEnabled = false
            userPageButton.setTitle("", for: .normal)
            
            //Set the label text to show the user it is the wrong answer and repeat the question
            informationBodyLabel.text = """
            INCORRECT!!!

            Nahhhh!
            
            Which light color means to slow down or prepare to stop?
            """
            
        break
            
        case 3: //QUESTION #3 - WRONG ANSWER
            
            //Disable the page button
            userPageButton.isEnabled = false
            userPageButton.setTitle("", for: .normal)
            
            //Set the label text to show the user it is the wrong answer and repeat the question
            informationBodyLabel.text = """
            INCORRECT!!!

            Try again!
            
            Which light color means to stop?
            """
            
        break
            
        default:
            
        break
        }

        
    }
    
    

}
