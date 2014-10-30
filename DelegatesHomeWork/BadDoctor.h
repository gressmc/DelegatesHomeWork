//
//  BadDoctor.h
//  DelegatesHomeWork
//
//  Created by gressmc on 28/10/14.
//  Copyright (c) 2014 gressmc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

@interface BadDoctor : NSObject <PatientDelegate>
@property(strong,nonatomic) NSString * name;
@end
