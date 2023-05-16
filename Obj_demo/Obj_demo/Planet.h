//
//  Planet.h
//  Obj_demo
//
//  Created by Taijaun Pitt on 16/05/2023.
//

#ifndef Planet_h
#define Planet_h

@interface Planet : NSObject
@property (strong, nonatomic) NSString* planetName;
@property (strong, nonatomic) NSNumber* population;

-(void) getPlanetDetails;
@end

@implementation Planet

-(void)setPlanetDetails:(NSString)planetName andPopulation:(NSNumber*) {
    self.planetName = planetName
    self.population = planetPopulation
    
}


@end

#endif /* Planet_h */
