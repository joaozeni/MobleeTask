//
//  Question.h
//  StackOverflowIOSApp
//
//  Created by joao guilherme zeni on 24/02/15.
//  Copyright (c) 2015 joao guilherme zeni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/CoreData.h>
@import UIKit;

@interface Question : NSManagedObject


//The elements of the question cell.
//Findout that structs don't suport Objc types
@property (nonatomic, retain) NSString *qid;
@property (nonatomic, retain) NSString *questionTitle;
@property (nonatomic, retain) NSNumber *questionScore;
@property (nonatomic, retain) NSString *userName;
@property (nonatomic, retain) UIImage *userPicture;

@end
