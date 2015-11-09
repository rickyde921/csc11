/* 
 * File:   main.cpp
 * Author: KRONiKDesigns
 *
 * Created on November 6, 2015, 2:22 PM
 */

#include <cstdlib>
#include <iostream>
#include <ctime>


using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {

    _top:
    cout<<"Hello and welcome to roulette."<<endl<<"What would you like to do?"<<endl
        <<"1) Hear Rules "<<endl<<"2) Play Game "<<endl;
    
 /*Load r0 with address_of_format */
    int r1_sp;  //load top of stack as second paramter
    cin>>r1_sp; //call scanf
    
/* ldr r0, [sp]     //load inputed value in r0 */
    if(r1_sp == 1)  //CMP r0, #1
        goto _hear_rules;   //BEQ _hear_rules
        
    if(r1_sp == 2)  //CMP r0, #2
        goto _play_game;
    
    /* If no valid input was given */
    cout<<"Please enter 1 or 2 only "<<endl;
    goto _top;   //BAL _top;
    
    _hear_rules:
    cout<<"/Rules"<<endl;
    
    _play_game:
    
    /* Remove input given from the stack */
    //ADD sp, sp, #+4
    
    /* SUB sp, sp, #4 */       //make room for betType integer
    
    _bet_type:
    
    cout<<"Okay what type of bet would you like to make today?"<<endl
        <<"1) -Single Number"<<endl
        <<"2) Even/Odd"<<endl
        <<"3) Black/Red"<<endl
        <<"4) Box (contains 12 numbers, 3 total)"<<endl
        <<"5) Column (contains 3 numbers, 12 total)"<<endl
        <<"6) Row (contains 12 numbers, 3 total"<<endl;
    /* Load r0 with address_of_format */
   int r1_betType_sp;  //load top of stack for second paramter 
   /* Load r0 with address_of_format */
   cin>>r1_betType_sp; //call scanf
   
   /* Load r0 with [sp] */
   if(r1_betType_sp < 1 )   //CMP r0, #1
       goto _bad_bet_type;  //BLS _bad_bet_type
   if(r1_betType_sp > 6)    //CMP r0, #6
       goto _bad_bet_type;  //BLS bad_bet_type
   /* else */
   goto _good_bet_type;     //BAL good_bet_type
   _bad_bet_type:
    /* If no valid input was given */
   cout<<"No Valid Input Given"<<endl;
   goto _bet_type;          //BAL _bet_type
   
   _good_bet_type:
   
   int r4 = r1_betType_sp;  //Load r4 with [sp]
   
   /* SUB sp, sp, #4 */     //Make room for an voting value int
   
   
   
//   /* Load r0 with [sp] */
//   if(r1_betType_sp == 1)   //CMP r0, #1
//       goto _single;        //BEQ _single
//  if(r1_betType_sp == 2)    //CMP r0, #2
//      goto _even_odd;       //BEQ _even_odd
//   if(r1_betType_sp == 3)   //CMP r0, #3
//       goto _color;         //BEQ _color
//   if(r1_betType_sp == 4)   //CMP r0, #4
//       goto _box;           //BEQ _box
//   if(r1_betType_sp == 5)   //CMP r0, #5
//       goto _column;        //BEQ _column
//   if(r1_betType_sp == 6)   //CMP r0, #6
//       goto _row;           //BEQ _row
// 
//   _single:
//   
//   _even_odd:
//   _color:
//   _box:
//   _column:
//   _row:
//   
//   
    return 0;
}

