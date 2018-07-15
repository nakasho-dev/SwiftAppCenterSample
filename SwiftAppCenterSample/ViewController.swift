import UIKit
import TinyConstraints

class ViewController: UIViewController {

    let inputLabel = UILabel()
    let inputText = UITextView()
    let translateButton = UIButton()
    let translatedLabel = UILabel()
    let translatedText = UITextView()
    
    let translateService: TranslateServiceProtocol
    
    init(translateService: TranslateServiceProtocol = TranslateService()) {
        self.translateService = translateService
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        addSubviews()
        addStyleSubviews()
        inputLabel.text = "翻訳したい日本語"
        translateButton.setTitle("英語に翻訳する", for: .normal)
        translatedLabel.text = "翻訳された英語"
        translateButton.addTarget(
            self,
            action: #selector(translateButtonWasTapped),
            for: .touchUpInside
        )
    }

    private func addSubviews() {
        self.view.addSubview(inputLabel)
        self.view.addSubview(inputText)
        self.view.addSubview(translateButton)
        self.view.addSubview(translatedLabel)
        self.view.addSubview(translatedText)
    }
    
    private func addStyleSubviews() {
        inputLabel.textAlignment = .left
        inputLabel.numberOfLines = 0
        
        inputText.layer.borderWidth = 1
        inputText.layer.borderColor = UIColor.lightGray.cgColor
        
        translateButton.setTitleColor(.blue, for: .normal)
        
        translatedLabel.textAlignment = .left
        translatedLabel.numberOfLines = 0
        
        translatedText.layer.borderWidth = 1
        translatedText.layer.borderColor = UIColor.lightGray.cgColor

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        inputLabel.topToSuperview(offset: 70)
        inputLabel.width(375)
        inputLabel.height(20)
        inputLabel.centerXToSuperview()
        
        inputText.topToBottom(of: inputLabel, offset: 5)
        inputText.width(375)
        inputText.height(200)
        inputText.centerXToSuperview()

        translateButton.topToBottom(of: inputText, offset: 20)
        translateButton.height(40)
        translateButton.centerXToSuperview()
        
        translatedLabel.topToBottom(of: translateButton, offset: 20)
        translatedLabel.width(375)
        translatedLabel.height(20)
        translatedLabel.centerXToSuperview()
        
        translatedText.topToBottom(of: translatedLabel, offset: 5)
        translatedText.width(375)
        translatedText.height(200)
        translatedText.centerXToSuperview()
    }

    @objc private func translateButtonWasTapped() {
        translateService.translate(text: inputText.text!)
            .onSuccess { [weak self] resultText in
                guard let weakSelf = self else { return }
                weakSelf.translatedText.text = resultText
        }
            .onFailure { [weak self] error in
                guard let weakSelf = self else { return }
                
                switch error {
                case AppError.NetworkFailed:
                    weakSelf.translatedText.text = "通信に失敗しました"
                case AppError.ParseFailed:
                    weakSelf.translatedText.text = "JSONの解析に失敗しました"
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

