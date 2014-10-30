//
//  BadDoctor.m
//  DelegatesHomeWork
//
//  Created by gressmc on 28/10/14.
//  Copyright (c) 2014 gressmc. All rights reserved.
//

#import "BadDoctor.h"

@implementation BadDoctor

#pragma mark - PatientDelegate -

- (void) patientFeelsBad:(Patient*)patient{
    
    NSLog(@"%@ - says",self.name);
    NSLog(@"Patient %@ is bad",patient.name);

    if (patient.temperature>=36.8f) {
        NSLog(@"I don't know what's wrong with you. I'll send you in the ambulance to the hospital.\n ");
    } else {
        NSLog(@"Go home %@! You are healthy\n ",patient.name);
    }
    patient.assess = BadDoc;
}
- (void) patient:(Patient*)patient hasQuestion:(NSString*)question{
    NSLog(@"Patient %@ has a question %@",patient.name,question);
    
}


@end
