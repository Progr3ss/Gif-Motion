//
//  AVAssetimageGeneratorTimerPoints.swift
//  Gif Motion
//
//  Created by martin chibwe on 8/31/16.
//  Copyright © 2016 Martin Chibwe. All rights reserved.
//

import AVFoundation

public extension AVAssetImageGenerator {
	public func generateCGImagesAsynchronouslyForTimePoints(timePoints: [TimePoint], completionHandler: AVAssetImageGeneratorCompletionHandler) {
		let times = timePoints.map {timePoint in
			return NSValue(CMTime: timePoint)
		}
		self.generateCGImagesAsynchronouslyForTimes(times, completionHandler: completionHandler)
	}
}

