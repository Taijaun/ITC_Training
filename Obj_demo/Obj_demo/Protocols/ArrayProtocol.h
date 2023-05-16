//
//  ArrayProtocol.h
//  Obj_demo
//
//  Created by Taijaun Pitt on 16/05/2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ArrayProtocol <NSObject>

@required
- (void)printArray:(NSArray*) list;

@end

NS_ASSUME_NONNULL_END
