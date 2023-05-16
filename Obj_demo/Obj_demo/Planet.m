//
//  Planet.m
//  Obj_demo
//
//  Created by Taijaun Pitt on 16/05/2023.
//


#import <Foundation/Foundation.h>
#import "Planet.h"



@implementation Planet

-(instancetype)setPlanetDetails:(NSString*)planetName andPopulation:(NSNumber*) planetPopulation {
        self.planetName = planetName;
        self.population = planetPopulation;
    
    return self;
}


@end
