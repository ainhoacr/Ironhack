#import "CoreDataStack.h"

#import "FileUtils.h"

@interface CoreDataStack ()
@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, copy) NSString *storeType;
@end


@implementation CoreDataStack

@synthesize managedObjectContext = _managedObjectContext;

- (instancetype)initWithDatabaseFileName:(NSString *)fileName andPersistenceType:(NSString *)storeType {
    
    self = [super init];
    if (self) {
        self.fileName = fileName;
        self.storeType = storeType;
        
        NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
        if (!coordinator) {
            return nil;
        }
        
        // seria conveniente tener un flag para verificar que el contexto esta creado antes de usarlo
        // tambien podemos tener una notificacion para avisar de que el contexto esta creado
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
            [_managedObjectContext setPersistentStoreCoordinator:coordinator];
            
            _childObjectContext = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
            [_childObjectContext setParentContext:_managedObjectContext];
        });
        
    }
    return self;
}

- (instancetype)init {
    self = [self initWithDatabaseFileName:@"database.sqlite" andPersistenceType:NSInMemoryStoreType];
    return self;
}


- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    NSPersistentStoreCoordinator *_persistentStoreCoordinator;
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    
    NSURL *storeURL = [[FileUtils applicationDocumentsDirectory] URLByAppendingPathComponent:self.fileName];

    NSDictionary *options = @{
                              NSMigratePersistentStoresAutomaticallyOption: @YES,
                              NSInferMappingModelAutomaticallyOption: @YES
                              };
    NSError *error = nil;
    if (![_persistentStoreCoordinator addPersistentStoreWithType:self.storeType configuration:nil URL:storeURL options:options error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = @"There was an error creating or loading the application's saved data.";
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

- (NSManagedObjectModel *)managedObjectModel {
    NSManagedObjectModel *_managedObjectModel;
    
//    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreDataHelloWorld" withExtension:@"momd"];
//    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:@[[NSBundle mainBundle]]];
    return _managedObjectModel;
}

- (void)saveContext {
    NSError *error = nil;
    if ([[self managedObjectContext] hasChanges] && ![self.managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}


@end
