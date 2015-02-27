// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RemoteObject.h instead.

#import <CoreData/CoreData.h>

extern const struct RemoteObjectAttributes {
	__unsafe_unretained NSString *objectId;
} RemoteObjectAttributes;

@interface RemoteObjectID : NSManagedObjectID {}
@end

@interface _RemoteObject : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) RemoteObjectID* objectID;

@property (nonatomic, strong) NSString* objectId;

//- (BOOL)validateObjectId:(id*)value_ error:(NSError**)error_;

@end

@interface _RemoteObject (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveObjectId;
- (void)setPrimitiveObjectId:(NSString*)value;

@end
