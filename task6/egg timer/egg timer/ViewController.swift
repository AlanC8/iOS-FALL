//
//  ViewController.swift
//  egg timer
//
//  Created by Алан Абзалханулы on 25.10.2024.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    private var timer: Timer?
    private var startTime: Date?
    private var selectedEggType: EggType?
    private var audioPlayer: AVAudioPlayer?
    

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    private lazy var eggButtons: [UIButton] = {
        return EggType.allCases.map { type in
            let button = UIButton(type: .system)
            button.setTitle(type.title, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 24)
            button.backgroundColor = .systemBlue
            button.layer.cornerRadius = 12
            button.tag = type.rawValue
            button.addTarget(self, action: #selector(eggTapped(_:)), for: .touchUpInside)
            return button
        }
    }()
    
    private lazy var progressView: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .default)
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progressTintColor = .systemGreen
        progress.trackTintColor = .systemGray5
        progress.transform = progress.transform.scaledBy(x: 1, y: 2)
        return progress
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .monospacedDigitSystemFont(ofSize: 70, weight: .bold)
        label.textColor = .label
        label.text = "0"
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAudioPlayer()
    }
    

    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(stackView)
        view.addSubview(progressView)
        view.addSubview(timeLabel)
        
        eggButtons.forEach { stackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            progressView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            timeLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 20),
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupAudioPlayer() {
        guard let soundURL = Bundle.main.url(forResource: "alarm", withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
        } catch {
            print("Error loading sound file: \(error)")
        }
    }
    
    
    @objc private func eggTapped(_ sender: UIButton) {
        timer?.invalidate()
        
        UIView.animate(withDuration: 0.1, animations: {
            sender.alpha = 0.5
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                sender.alpha = 1.0
            }
        }
        
        guard let eggType = EggType(rawValue: sender.tag) else { return }
        selectedEggType = eggType
        startTime = Date()
        
        timer = Timer.scheduledTimer(timeInterval: 0.1,
                                   target: self,
                                   selector: #selector(updateTimer),
                                   userInfo: nil,
                                   repeats: true)
    }
    
    @objc private func updateTimer() {
        guard let startTime = startTime,
              let eggType = selectedEggType else { return }
        
        let elapsedTime = Date().timeIntervalSince(startTime)
        let remainingTime = max(0, eggType.cookingTime - elapsedTime)
        
        // Update progress
        let progress = Float(elapsedTime / eggType.cookingTime)
        progressView.progress = min(progress, 1.0)
        
        // Показываем только секунды
        let seconds = Int(remainingTime)
        timeLabel.text = "\(seconds)"
        
        // Check if timer completed
        if remainingTime <= 0 {
            timer?.invalidate()
            timer = nil
            audioPlayer?.play()
        }
    }
}
