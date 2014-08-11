//
//  MagicalCreature.h
//  MCMS
//
//  Created by ETC ComputerLand on 7/29/14.
//  Copyright (c) 2014 cmeats. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject

@property NSString *name;
@property NSString *description;
@property UIImage *image;

-(instancetype) initWithName:(NSString *)name;

@end
