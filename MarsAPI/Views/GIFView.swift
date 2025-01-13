import SwiftUI
import UIKit

struct GIFView: UIViewRepresentable {
    let gifName: String

    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {
        if let gifPath = Bundle.main.path(forResource: gifName, ofType: "gif"),
           let gifData = NSData(contentsOfFile: gifPath),
           let source = CGImageSourceCreateWithData(gifData, nil) {
            var images: [UIImage] = []
            var totalDuration: TimeInterval = 0

            let frameCount = CGImageSourceGetCount(source)
            for i in 0..<frameCount {
                guard let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) else { continue }

                let frameDuration = getFrameDuration(source: source, index: i)
                totalDuration += frameDuration
                images.append(UIImage(cgImage: cgImage))
            }

            uiView.animationImages = images
            uiView.animationDuration = totalDuration
            uiView.startAnimating()
        }

        DispatchQueue.main.async {
            if let superview = uiView.superview {
                uiView.frame = superview.bounds
            }
        }
    }

    private func getFrameDuration(source: CGImageSource, index: Int) -> TimeInterval {
        guard let properties = CGImageSourceCopyPropertiesAtIndex(source, index, nil) as? [CFString: Any],
              let gifProperties = properties[kCGImagePropertyGIFDictionary] as? [CFString: Any],
              let delayTime = gifProperties[kCGImagePropertyGIFDelayTime] as? TimeInterval else {
            return 0.1
        }
        return delayTime
    }
}
