#import "GeoIP.h"

@interface GeoIP ()

// Private interface goes here.

@end

@implementation GeoIP

+ (GeoIP *)geoIPWithIp:(NSString *)ip country:(NSString *)country latitude:(float)latitude andLongitude:(float)longitude inContext:(NSManagedObjectContext *)context
{
    GeoIP *geoIP = [GeoIP insertInManagedObjectContext:context];
    geoIP.ip = [ip isEqualToString:@""] ? @"-" : ip;
    geoIP.country = [country isEqualToString:@""] ? @"-" : country;
    geoIP.latitudeValue = latitude;
    geoIP.longitudeValue = longitude;
    
    return geoIP;
}

+ (NSFetchRequest *)fetchRequestWithFields:(NSArray<NSString *>*)fields andOrders:(NSArray<NSNumber *>*)orders
{
    if (fields.count != orders.count) {
        return nil;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[GeoIP entityName]];
    
    [fetchRequest setFetchBatchSize:20];
    NSMutableArray<NSSortDescriptor *>*sortDescriptors = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < fields.count; i++) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:fields[i] ascending:orders[i].boolValue];
        [sortDescriptors addObject:sortDescriptor];
    }
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    return fetchRequest;
}

@end
