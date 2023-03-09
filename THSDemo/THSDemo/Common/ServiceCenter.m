//
//  ServiceCenter.m
//  THSDemo
//
//  Created by lilinli on 2023/3/9.
//

#import "ServiceCenter.h"

@interface ServiceCenter ()

@property (nonatomic) NSMutableDictionary<NSString *, id<NSObject>> *srvTables;

@end

@implementation ServiceCenter

+ (ServiceCenter *)sharedInstance {
    static ServiceCenter *sharedOnceInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedOnceInstance = [[self alloc] init];
    });
    return sharedOnceInstance;
}

- (void)registerService:(NSString *)protocol impl:(id)iSrv {
    
    if(protocol && iSrv) {
        
        [self.srvTables setObject:iSrv forKey:protocol];
    }
}

- (void)unRegisterService:(NSString *)protocol {
    if(protocol ) {
        [self.srvTables removeObjectForKey:protocol];
    }
}

- (id)getSrv:(NSString *)protocol {
    return [self.srvTables objectForKey:protocol];
}


#pragma mark - == Getter & Setter ==

- (NSMutableDictionary *)srvTables {
    if (!_srvTables) {
        _srvTables = [NSMutableDictionary dictionary];
    }
    
    return  _srvTables;;
}



@end
