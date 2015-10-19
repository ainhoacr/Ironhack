#import "_GeoIP.h"

@interface GeoIP : _GeoIP {}

+ (GeoIP *)geoIPWithIp:(NSString *)ip country:(NSString *)country latitude:(float)latitude andLongitude:(float)longitude inContext:(NSManagedObjectContext *)context;
+ (NSFetchRequest *)fetchRequestWithFields:(NSArray<NSString *>*)fields andOrders:(NSArray<NSNumber *>*)orders;

@end
