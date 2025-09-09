//
//  NSItemProvider+Extensions.swift
//  RNShareMenu
//
//  Created by Gustavo Parreira on 29/07/2020.
//

import MobileCoreServices

public extension NSItemProvider {
    var isText: Bool {
        return hasItemConformingToTypeIdentifier(kUTTypeText as String)
    }

    var isURL: Bool {
        return hasItemConformingToTypeIdentifier(kUTTypeURL as String) && !isFileURL
    }

    var isFileURL: Bool {
        return hasItemConformingToTypeIdentifier(kUTTypeFileURL as String)
    }

    var isImage: Bool {
        return hasItemConformingToTypeIdentifier(kUTTypeImage as String)
    }

    var isJPEG: Bool {
        return hasItemConformingToTypeIdentifier(kUTTypeJPEG as String)
    }

    var isPNG: Bool {
        return hasItemConformingToTypeIdentifier(kUTTypePNG as String)
    }

    var isGIF: Bool {
        return hasItemConformingToTypeIdentifier(kUTTypeGIF as String)
    }

    var isData: Bool {
        return hasItemConformingToTypeIdentifier(kUTTypeData as String)
    }

    // Helper to check if this is likely a Photos app image (UIImage object)
    var isPhotoLibraryImage: Bool {
        // Photos app typically provides images as UIImage objects under kUTTypeImage
        return hasItemConformingToTypeIdentifier(kUTTypeImage as String) && !hasItemConformingToTypeIdentifier(kUTTypeFileURL as String)
    }

    // Helper to get the most appropriate type identifier for loading
    var preferredTypeIdentifier: String? {
        if isText {
            return kUTTypeText as String
        } else if isURL {
            return kUTTypeURL as String
        } else if isFileURL {
            return kUTTypeFileURL as String
        } else if isImage {
            return kUTTypeImage as String
        } else if isData {
            return kUTTypeData as String
        }
        return nil
    }
}
