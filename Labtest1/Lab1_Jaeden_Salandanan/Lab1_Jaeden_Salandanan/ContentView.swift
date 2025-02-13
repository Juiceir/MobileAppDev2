import SwiftUI

struct Lab1_Jaeden_SalandananView: View {
    @State private var currentNum: Int = Int.random(in: 1...100)
    @State private var correctAns: Int = 0
    @State private var wrongAns: Int = 0
    @State private var answerText: String? = nil
    @State private var answerColor: Color = .clear
    @State private var attempts: Int = 0
    @State private var result: Bool = false
    @State private var timer: Timer?
    @State private var timeLeft: Int = 5

    var body: some View {
        VStack(spacing: 22) {
            Text("\(currentNum)")
                .font(.custom("Snell Roundhand",size: 100))
                .foregroundColor(.teal)
                .padding()

            HStack(spacing: 45) {
                Button("Prime") {
                    checkAns(isPrime: true)
                }
                .font(.custom("Snell Roundhand",size: 50))
                .foregroundColor(.teal)
            
                Button("Not Prime") {
                    checkAns(isPrime: false)
                }
                .font(.custom("Snell Roundhand",size: 50))
                .foregroundColor(.teal)
                            }
                            if let text = answerText {
                                Text(text)
                                    .foregroundColor(answerColor)
                                    .font(.title)
                                    .padding()
                            }
                            Spacer()
    
                            if !result {
                                Text("Time Remaining: \(timeLeft) seconds")
                                    .font(.headline)
                                    .padding()
                            }

                        }
                        .alert(isPresented: $result) {
                            Alert(
                                title: Text("Your Results"),
                                message: Text("Correct: \(correctAns)\nWrong: \(wrongAns)"),
                                dismissButton: .default(Text("Play Again"), action: resetGame)
                            )
                        }
                        .onAppear(perform: timerStart)
                    }

                    func checkPrime(_ number: Int) -> Bool {
                        if number < 2 { return false }
                        for i in 2..<Int(sqrt(Double(number))) + 1 {
                            if number % i == 0 {
                                return false
                            }
                        }
                        return true
                    }

                    func checkAns(isPrime: Bool) {
                        if isPrime == checkPrime(currentNum) {
                            correctAns += 1
                            answerText = "Correct!"
                            answerColor = .green
                        } else {
                            wrongAns += 1
                            answerText = "Wrong!"
                            answerColor = .red
                        }
                        nextNum()
                        attempts += 1
                        if attempts >= 10 {
                            timerStop()
                            result = true
                        }
                    }

                    func nextNum() {
                        currentNum = Int.random(in: 1...100)
                        timeLeft = 5
                    }

                    func timerStart() {
                        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                            if timeLeft > 0 {
                                timeLeft -= 1
                            } else {
                                wrongAns += 1
                                nextNum()
                                attempts += 1
                                if attempts >= 10 {
                                    timerStop()
                                    result = true
                                }
                            }
                        }
                    }

                    func timerStop() {
                        timer?.invalidate()
                        timer = nil
                    }

                    func resetGame() {
                        correctAns = 0
                        wrongAns = 0
                        attempts = 0
                        timeLeft = 5
                        nextNum()
                        timerStart()
                    }
                }
