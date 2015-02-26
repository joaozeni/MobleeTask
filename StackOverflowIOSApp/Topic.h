//
//  Topic.h
//  StackOverflowIOSApp
//
//  Created by joao guilherme zeni on 25/02/15.
//  Copyright (c) 2015 joao guilherme zeni. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface Topic : NSObject

//The elements of the topic cell.
//Findout that structs don't suport Objc types
@property NSString *topicTitle;
@property(nonatomic, retain) UIImage *topicPicture;

@end
