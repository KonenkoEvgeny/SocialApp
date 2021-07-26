//
//  ViewController.swift
//  SocialApp
//
//  Created by Evgeny Konenko on 16.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // строки 18-66 взяты из методички для работы с клавиатурой. Единственно я добавил аутлет для скроллВью. Строки 71-84 уже добавлял сам ручками. Спасибо за помощь в удалении аутлетов. Теперь знаю, как это делать
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var welcomeTextLabel: UILabel!
    @IBOutlet var loginTextLabel: UITextField!
    @IBOutlet var passwordTextLabel: UITextField!
    
    @IBAction func enterButtonAction(_ sender: Any) {
//        let login = loginTextLabel.text ?? ""
//        let password = passwordTextLabel.text ?? ""
//         if (!(login.isEmpty && password.isEmpty) && (login == "111" && password == "111")) {
            print("вы вошли в social")
      // } else {
        //     print("ошибка")}
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    override func viewDidLoad() {
            super.viewDidLoad()
         
            // Жест нажатия
            let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
            // Присваиваем его UIScrollVIew
            scrollView?.addGestureRecognizer(hideKeyboardGesture)
        }
    
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
            self.scrollView?.endEditing(true)
        }


}

