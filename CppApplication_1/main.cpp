/* 
 * File:   main.cpp
 * Author: rcc
 *
 * Created on October 27, 2015, 12:36 PM
 */

#include <cstdlib>
#include <iostream>

using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {
    int problem;
    
    _menu:
    cout<<"What problem would you like to run?"<<endl
        <<"Enter 1 for Problem 1"<<endl
        <<"Enter 2 for Problem 2"<<endl
        <<"Enter 3 for Problem 3"<<endl
        <<"Enter 4 to terminate the program"<<endl;
    cin>>problem;
    if(problem==1)goto _problem1;
    else if (problem==2)goto _problem2;
    else if (problem == 3)goto _problem3;
    else if (problem == 4)goto _end;
    else{
        cout<<"Please enter valid input"<<endl;
        goto _menu;
    }
    
    /*** PROBLEM1 ****/
    _problem1:
    //Determining Gross Pay
    int hours;
    int grsPay;      //initialize Gross Pay
    grsPay = 0;
    int pyRate;
    pyRate = 10;     //Normal pay is $10 the hour
    _top1:
    cout<<"How many hours did you work this week?"<<endl;
    cin>>hours;
    if(hours > 60 || hours < 0) goto _bad_Input1;
    
    //Valid input was provided
    _hours:
    if(hours >50)goto _triple;     //if more than 50 hours were worked
    if(hours>40)goto _double;      //if more than 40 hours were worked
    if(hours > 0) goto _single;    //if less than 40 hours were worked
    
    goto _output1;                   //When finished output
    cout<<"Should never get outputed"<<endl;
    _triple:
    int tHours;
    tHours = hours - 50;            //hours above 50 worked
    hours -= tHours;
    grsPay += pyRate * 3 * tHours;  //triple pay for these hours
    
    goto _hours;
    
    _double:
    int dHours;
    dHours = hours - 40;            //hours above 40 worked
    grsPay += pyRate * 2 * dHours;  //double pay for these hours
    hours -= dHours;
    goto _hours;
    
    _single:
    grsPay += pyRate * hours;       //Normal pay for these hours
    hours =0;
    goto _hours;
    
    _bad_Input1:
    cout<<"Please enter hours between 0-60 only"<<endl;
    goto _top1;
    
    _output1:
    //output Gross Pay
    cout<<"Your total pay this week is $"<<grsPay<<endl;
    //Go back to Menu
    cout<<endl<<endl;
    goto _menu;
       
    /**** Problem2 ****/
    _problem2:
    int package;        //input for deciding package
    int hours2;         //hours accessed
    int mthCrg;         //monthly charge
     mthCrg = 0;     
    _top2:
    cout<<"What Package do you have with us?"<<endl;
    cout<<"1) Package A"<<endl
        <<"2) Package B"<<endl
        <<"3) Package C"<<endl;
    cin>>package;
    if(package==1)goto _package_a;          //if entered for package A
    else if (package == 2)goto _package_b;  //if entered for package B
    else if (package == 3)goto _package_c;  //if entered for package C
    else goto _bad_Input2;
    
    _package_a:
    cout<<"How many hours did you access this month?"<<endl;
    cin>>hours2;  
    if(hours2 < 0){
        cout<<"Please enter a positive value only"<<endl;
        goto _package_a;
    }
    //else calculate monthly charge for Package A
    _calc_month_charge_A:
    if(hours2 > 22){                 //customer is in the third price bracket
        int hours_3 = hours2 - 22;   //hours accessed within third bracket
        mthCrg += (hours_3 * 6);     //Additional hours in third bracket are $6 each
        hours2 -= hours_3;           //remove hours over third bracket
        goto _calc_month_charge_A;   //calculate remaining hours
    }
    if(hours2 > 11){                 //customer is in the second price bracket
       int hours_2 = hours2 - 11;    //hours accessed within second bracket
        mthCrg += (hours_2 * 3);     //Additional hours in third bracket are $3 each
        hours2 -= hours_2;           //remove hours over second bracket
        goto _calc_month_charge_A;   //calculate remaining hours
    }
    if(hours2 > 0){                  //customer is in the first price bracket
        mthCrg += 30;                //$30 per month 11 hour access
        hours2 = 0       ;           //all hours calculated
        //Move on to displaying monthly charge
    }
    goto _output2;      //output monthly charge
    
    _package_b:
    cout<<"How many hours did you access this month?"<<endl;
    cin>>hours2;  
    if(hours2 < 0){
        cout<<"Please enter a positive value only"<<endl;
        goto _package_b;
    }
    //else calculate monthly charge for Package B
    _calc_month_charge_B:
    if(hours2 > 44){                 //customer is in the third price bracket
        int hours_3 = hours2 - 44;   //hours accessed within third bracket
        mthCrg += (hours_3 * 4);     //Additional hours in third bracket are $4 each
        hours2 -= hours_3;           //remove hours over third bracket
        goto _calc_month_charge_B;   //calculate remaining hours
    }
    if(hours2 > 22){                 //customer is in the second price bracket
       int hours_2 = hours2 - 22;    //hours accessed within second bracket
        mthCrg += (hours_2 * 2);     //Additional hours in third bracket are $2 each
        hours2 -= hours_2;           //remove hours over second bracket
        goto _calc_month_charge_B;   //calculate remaining hours
    }
    if(hours2 >0) {                  //customer is in the first price bracket
        mthCrg += 35;                //$35 per month 22 hour access
        hours2 = 0       ;           //all hours calculated
        //Move on to displaying monthly charge
    }
    goto _output2;      //output monthly charge

    _package_c:
    cout<<"How many hours did you access this month?"<<endl;
    cin>>hours2;  
    if(hours2 < 0){
        cout<<"Please enter a positive value only"<<endl;
        goto _package_c;
    }
    //else calculate monthly charge
    _calc_month_charge_C:
    if(hours2 > 66){                 //customer is in the third price bracket
        int hours_3 = hours2 - 66;   //hours accessed within third bracket
        mthCrg += (hours_3 * 2);     //Additional hours in third bracket are $2 each
        hours2 -= hours_3;           //remove hours over third bracket
        goto _calc_month_charge_C;   //calculate remaining hours
    }
    if(hours2 > 33){                 //customer is in the second price bracket
       int hours_2 = hours2 - 33;    //hours accessed within second bracket
        mthCrg += (hours_2 * 1);     //Additional hours in third bracket are $1 each
        hours2 -= hours_2;           //remove hours over second bracket
        goto _calc_month_charge_C;   //calculate remaining hours
    }
    if(hours2 > 0){                  //customer is in the first price bracket
        mthCrg += 40;                //$40 per month 33 hour access
        hours2 = 0       ;           //all hours calculated
        //Move on to displaying monthly charge
    }
    goto _output2;      //output monthly charge
    
    _bad_Input2:
    cout<<"Please enter a valid input"<<endl;
    goto _top2;
    
     _output2:
    cout<<"Your monthly charge this month will be $"<<mthCrg<<endl<<endl<<endl;
    goto _menu;        //return to top menu
    
      /**** Problem3 ****/
   _problem3:
   
   int fstTrm;      //First term in sequence
   int scdTrm;      //Second term in sequence
   int nTerm;       //nth term
   int tmpTrm;     //used to temporarily hold a sequence term value
   
   _top3:
   cout<<endl;
   cout<<"Input the term in the Fibonacii sequence you would like outputed"<<endl;
   cin>>nTerm;
   if(nTerm < 1){
       cout<<"Please enter values above 0 only"<<endl;
       goto _top3;
   }
   //else calculate nth Term
   if(nTerm >= 1){      
       scdTrm = 1;
   }
   if(nTerm >=2){
       fstTrm = 1;
   }
   if(nTerm >2){        //if term is not the first or second term (equal to 1)
       for (int i = 2; i<nTerm; i++){       //loops every term past the second up to the term entered
           tmpTrm = scdTrm;     //save the second term's value;
           scdTrm += fstTrm;    //add first and second term to find new second term
           fstTrm = tmpTrm;     //new first term is last second term
       }
   }
   cout<<"The "<<nTerm<<" term in the Fibonacii sequence is "<<scdTrm<<endl<<endl<<endl;
   
   goto _menu;

   /**** End Of Program ****/
   _end:
   cout<<"Goodbye";
    
    return 0;
}

