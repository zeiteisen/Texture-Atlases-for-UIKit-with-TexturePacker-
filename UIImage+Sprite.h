// Created by Daniel Sefton, 2012
// Do what you want license

#import <Foundation/Foundation.h>

/**
 UIImage category to handle parsing of TexturePacker's Generic XML format.
 */
@interface UIImage (Sprite)

/**
 The method returns a dictionary of UIImages. Use this function once and reference its contents.
 @param filename the XML file to load, which should be added to your project's bundle
 @returns dictionary of UIImages
 */
+ (NSDictionary*)spritesWithContentsOfFile:(NSString*)filename;

@end