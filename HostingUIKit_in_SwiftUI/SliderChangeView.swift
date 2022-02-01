//
//  SliderChangeView.swift
//  HostingUIKit_in_SwiftUI
//
//  Created by Kristel Maximova on 01.02.2022.
//

import SwiftUI


struct SliderChangeView: UIViewRepresentable {
    
    @Binding var currentValue: Int
    var opacity: Int
    
    //MARK: - Methods
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider()
        
        slider.maximumValue = 100
        slider.minimumValue = 0
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeSliderValue),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = UIColor.red.withAlphaComponent(CGFloat(opacity) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}

//MARK: - Coordinator
extension SliderChangeView {
    class Coordinator: NSObject {
        
        @Binding var currentValue: Int
        
        init(currentValue: Binding<Int>) {
            self._currentValue = currentValue
        }
        
        @objc func changeSliderValue(_ sender: UISlider) {
            currentValue = Int(sender.value)
        }
    }
}
//MARK: - Previews
struct SliderChangeView_Previews: PreviewProvider {
    static var previews: some View {
        SliderChangeView(currentValue: .constant(50), opacity: 1)
    }
}

