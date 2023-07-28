//
//  ContentView.swift
//  SentimentAnalysis
//
//  Created by Khawlah Khalid on 28/07/2023.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State var input: String = ""
    @State var result: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextField("Type anything . . .", text: $input, axis: .vertical)
                .font(.headline)
                .textFieldStyle(.roundedBorder)
            Button {
                analysisTheSentiment()
            } label: {
                HStack{
                    Spacer()
                    Text("Sentiment Analysis")
                        .foregroundColor(.white)
                        .bold()
                    Spacer()
                }
                .padding()
                .background {
                    Color.purple
                }.cornerRadius(8)
            }

            Text("Result: \(result)")
            +
            Text("\(result == "Pos" ? "☺️" : result == "Neg" ? "😔" : "")")
                .bold()
        }
        .padding()
    }
    
    

    func analysisTheSentiment(){
        let model = SentimentAnalysisModel()
        do{
        let prediction = try model.prediction(text: input)
        result =  prediction.label
        }
        catch{
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
