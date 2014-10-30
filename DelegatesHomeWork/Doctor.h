//
//  Doctor.h
//  DelegatesHomeWork
//
//  Created by gressmc on 28/10/14.
//  Copyright (c) 2014 gressmc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

@interface Doctor : NSObject <PatientDelegate>

@property(strong,nonatomic) NSString * name;
@property(strong,nonatomic) NSMutableArray* stomachCount;
@property(strong,nonatomic) NSMutableArray* headCount;
@property(strong,nonatomic) NSMutableArray* handsCount;
@property(strong,nonatomic) NSMutableArray* legsCount;
@property(strong,nonatomic) NSMutableArray* neckCount;

-(NSDictionary*)raport;
@end
