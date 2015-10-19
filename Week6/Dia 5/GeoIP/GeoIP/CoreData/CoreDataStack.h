#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataStack : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectContext *childObjectContext;

// Designated initializer
- (instancetype)initWithDatabaseFileName:(NSString *)fileName andPersistenceType:(NSString *)storeType NS_DESIGNATED_INITIALIZER;
- (instancetype)init;

- (void)saveContext;

@end
