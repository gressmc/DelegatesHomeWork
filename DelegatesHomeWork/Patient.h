//
//  Patient.h
//  DelegatesHomeWork
//
//  Created by gressmc on 28/10/14.
//  Copyright (c) 2014 gressmc. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    GoodDoc,
    BadDoc
}Assess;

@protocol PatientDelegate;

@interface Patient : NSObject 

@property(strong,nonatomic) NSString * name;
@property(assign,nonatomic) CGFloat temperature;
@property(assign,nonatomic) BOOL cough;
@property(assign,nonatomic) BOOL sneezing;
@property(assign,nonatomic) BOOL stomachPain;

@property(assign,nonatomic) BOOL stomach;
@property(assign,nonatomic) BOOL head;
@property(assign,nonatomic) BOOL hands;
@property(assign,nonatomic) BOOL legs;
@property(assign,nonatomic) BOOL neck;

@property(assign,nonatomic) Assess assess;
@property(strong,nonatomic) NSMutableDictionary* doctorSet;

@property(weak,nonatomic) id <PatientDelegate> delegate;

-(void) takePill;
-(void) makeShot;
-(void) goGastroenterologist;
-(void) iFeelBad;
-(BOOL) medicalCertificate;
-(BOOL) pain;

@end

@protocol PatientDelegate <NSObject>

- (void) patientFeelsBad:(Patient*)patient;
- (void) patient:(Patient*)patient hasQuestion:(NSString*)question;

@end