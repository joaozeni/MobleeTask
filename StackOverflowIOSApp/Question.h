//
//  Question.h
//  StackOverflowIOSApp
//
//  Created by joao guilherme zeni on 24/02/15.
//  Copyright (c) 2015 joao guilherme zeni. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface Question : NSObject


//The elements of the question cell.
//Findout that structs don't suport Objc types
@property NSString *questionTitle;
@property NSNumber *questionScore;
@property NSString *userName;
@property(nonatomic, retain) UIImage *userPicture;

@end
