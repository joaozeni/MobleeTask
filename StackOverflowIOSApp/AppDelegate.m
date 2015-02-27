//
//  AppDelegate.m
//  StackOverflowIOSApp
//
//  Created by joao guilherme zeni on 22/02/15.
//  Copyright (c) 2015 joao guilherme zeni. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setupRestKit];
    return YES;
}

- (void)setupRestKit{
    // initiate Object Manager, Model & Store
    RKObjectManager *manager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://api.stackexchange.com/2.2/"]];
    NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    manager.managedObjectStore = managedObjectStore;
    
    // define Entity mapping to core data
    RKEntityMapping *userMapping = [RKEntityMapping mappingForEntityForName:@"Question" inManagedObjectStore:managedObjectStore];
    userMapping.identificationAttributes = @[ @"qid" ];
    NSArray *mappingArray = @[@"qid", @"questionTitle", @"questionScore", @"userName", @"userPicture"];
    [userMapping addAttributeMappingsFromArray:mappingArray];
    
    // Core Data stack initialization
//    [managedObjectStore createPersistentStoreCoordinator];
//    NSString *storePath = [RKApplicationDataDirectory() stringByAppendingPathComponent:@"LearnRestKit.sqlite"];
//    NSError *error;
//    NSPersistentStore *persistentStore =
//    [managedObjectStore addSQLitePersistentStoreAtPath:storePath
//                                fromSeedDatabaseAtPath:nil
//                                     withConfiguration:nil
//                                               options:@{
//                                                         NSMigratePersistentStoresAutomaticallyOption:@YES,
//                                                         NSInferMappingModelAutomaticallyOption:@YES
//                                                         }
//                                                 error:&error];
//    NSAssert(persistentStore, @"Failed to add persistent store with error: %@", error);
    
    // Create the managed object contexts
    [managedObjectStore createManagedObjectContexts];
    // Configure a managed object cache to ensure we do not create duplicate objects
    managedObjectStore.managedObjectCache = [[RKInMemoryManagedObjectCache alloc]
                                             initWithManagedObjectContext:managedObjectStore.persistentStoreManagedObjectContext];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
