//
//  ViewController.swift
//  ChatGPT
//
//  Created by Sharonda Daniels on 3/7/23.
//
import UIKit
import Foundation
import OpenAIKit
import AsyncHTTPClient
import QuartzCore

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var chatField: UITextField!
    
    // Create outlets for sendButton and tableView
    
    
    // Create array to hold chat messages
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        // Start the chat
        
    }
    
    // Function to initialize the chat
    func beginChat() {
        // Add starting message
        
    }
    
    
    // Action method to handle sending a message
    @IBAction func sendMessageButtonTapped(_ sender: Any) {
        // Add the user message to the array
        
        
        // Add "Typing..." message from the assistant
        
        
        // Await the promptCall function to get the response from the OpenAI GPT-3 API
        Task {
            await promptCall()
        }
        
        // Add any finishing touches
        
        
    }
    
    // This function prompts a call to the OpenAI API to generate a response message based on the user's input.
    // TODO: Have them build this
    func promptCall() async {
        // Define the API key
        
        
        
        // Define the  HTTP client
        /*
        let httpClient = HTTPClient(eventLoopGroupProvider: .createNew)
        let configuration = Configuration(apiKey: apiKey)
        let openAIClient = OpenAIKit.Client(httpClient: httpClient, configuration: configuration)
         */
        
        
        do {
            // Call the OpenAI API to generate a response message based on the user's input.
            
            
            // Print the response message content and add it to the chatMessages array.
            
            
        }/* catch {
            // Handle any errors that occur during the OpenAI API call.
            if let apiError = error as? APIErrorResponse {
                print(apiError)
            } else {
                print("Unexpected error: \(error.localizedDescription)")
            }
        }*/
        
        
        // Shutdown the HTTP client.
        /*
        do {
            try await httpClient.shutdown()
        } catch {
            
        }
         */
        
        
        // Add any finishing touches

        
    }
    
    
    
    
    
    
    
    // ALL HELPER METHODS ARE BELOW  --------------------------------------------------------------------------------
    
    
    // Tables
    
    
    // Function to return the number of rows in each section of the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages.count
    }
    
    // Function to return a cell for a given row in the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Define a variable to hold the chat cell.
        var cell: ChatTableViewCell
        
        // Get the chat message at the current index path.
        let message = chatMessages[indexPath.row]
        
        // Check if the message is from the user or the assistant and configure the cell accordingly.
        if message.role == "user" {
            // If the message is from the user, use a right-aligned cell with a gray background.
            cell = tableView.dequeueReusableCell(withIdentifier: "RightCell", for: indexPath) as! ChatTableViewCell
            cell.senderName.text = "User"
            cell.backgroundColor = UIColor.init(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
            cell.senderMessage.text = message.content
            cell.alignToRight()
            cell.setNeedsLayout()
        } else {
            // If the message is from the assistant, use a left-aligned cell with a white background.
            cell = tableView.dequeueReusableCell(withIdentifier: "LeftCell", for: indexPath) as! ChatTableViewCell
            cell.senderName.text = "Assistant"
            cell.backgroundColor = UIColor.white
            cell.senderMessage.text = message.content
        }
        
        // Return the configured cell.
        return cell
    }
    
    
    // Function to return the number of sections in the table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // UITableViewDelegate method to set the height of the cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
    // Overall Setup
    
    
    // UITextFieldDelegate method to handle return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendMessageButtonTapped(self)
        return true
    }
    
    // This function scrolls the chat table view to the bottom.
    func scrollToBottom(animated: Bool = true) {
        let section = 0
        let lastRow = tableView.numberOfRows(inSection: section) - 1
        if lastRow >= 0 {
            let indexPath = IndexPath(row: lastRow, section: section)
            tableView.scrollToRow(at: indexPath, at: .bottom, animated: animated)
        }
    }
    
    // This function pins chat field to the top of the keyboard when it opens.
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                    bottomConstraint.constant = keyboardSize.height - 20
                    view.layoutIfNeeded()
                }
        scrollToBottom()
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        bottomConstraint.constant = 39
        view.layoutIfNeeded()
        scrollToBottom()
    }
    
    @objc func setup(){
        tableView.dataSource = self
        tableView.delegate = self
        
        configureNavBar()
        setupChatField()
    }
    
    // Sets up the navigation bar at the top of the screen
    @objc func configureNavBar() {
        // Define the height of the space
        let bottomSpaceHeight: CGFloat = 20

        // Create a spacer view with the desired height
        let bottomSpacerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: bottomSpaceHeight))
        bottomSpacerView.backgroundColor = .clear

        // Add the spacer view to the navigation bar
        navigationController?.navigationBar.addSubview(bottomSpacerView)
        
        // Apply the font attributes to the bar button items
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 26, weight: .bold, scale: .default)
        
        // Create the left and right bar button items
        let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3", withConfiguration: largeConfig), style: .plain, target: self, action:nil)
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "plus", withConfiguration: largeConfig), style: .plain, target: self, action: nil)
        
        leftBarButton.tintColor = .white
        rightBarButton.tintColor = .white

        // Set the fixed spacing between the items
        let leftSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        leftSpace.width = 10 // Change this value to adjust the spacing

        // Set the fixed spacing between the items
        let rightSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        rightSpace.width = 10 // Change this value to adjust the spacing

        // Set the navigation bar button items
        navigationItem.leftBarButtonItems = [leftSpace, leftBarButton]
        navigationItem.rightBarButtonItems = [rightSpace, rightBarButton]
    }
    
    // Sets the appearance and actions associated with the chat field
    @objc func setupChatField() {
        // Add padding to the text field
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: chatField.frame.height))
        chatField.leftView = paddingView
        chatField.leftViewMode = .always
        chatField.delegate = self
        
        // Add keyboard observers
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        // Set some properties for our text field
        chatField.layer.borderColor = CGColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
        chatField.layer.borderWidth = 1.0
    }
    
    
}
