%% Optical Microscope Algorithm: A new metaheuristic inspired by zoom-in process
%  Author and programmer:                                                   %
%         Professor        Min-Yuan Cheng                                   %
%         Ph.D. Student    Moh Nur Sholeh                                   %
%  Written by Moh Nur Sholeh                                                %
%  Computer Integrated Construction (CIC) Lab                               %
%  National Taiwan University of Science and Technology, Taipei, Taiwan     %
%---------------------------------------------------------------------------%
function [Lb Ub dim]=boundcondition(funnum)
%para=[Lb Ub nd]
switch funnum
    case 1
        Lb=-5.12;
        Ub=5.12;
        dim=5; 
    case 2
        Lb=-100;
        Ub=100;
        dim=30;
    case 3
        Lb=-100;
        Ub=100;
        dim=30;
    case 4
        Lb=-10;
        Ub=10;
        dim=30;
    case 5
        Lb=-1.28;
        Ub=1.28;
        dim=30;
    case 6
        Lb=-4.5;
        Ub=4.5;
        dim=2;
    case 7
        Lb=-100;
        Ub=100;
        dim=2;
    case 8
        Lb=-10;
        Ub=10;
        dim=2;
    case 9
        Lb=-10;
        Ub=10;
        dim=4;
    case 10
        dim=6;
        Lb=-dim^2;
        Ub=dim^2;
    case 11
        dim=10;
        Lb=-dim^2;
        Ub=dim^2;
    case 12
        Lb=-5;
        Ub=10;
        dim=10;
    case 13
        Lb=-4;
        Ub=5;
        dim=24;
    case 14
        Lb=-10;
        Ub=10;
        dim=30;
    case 15
        Lb=-100;
        Ub=100;
        dim=30;
    case 16
        Lb=-30;
        Ub=30;
        dim=30;
    case 17
        Lb=-10;
        Ub=10;
        dim=30;
    case 18
        Lb=-65.536;
        Ub=65.536;
        dim=2;
    case 19
        Lb=[-5,10];
        Ub=[0,15];
        dim=2;
    case 20
        Lb=-100;
        Ub=100;
        dim=2;
    case 21
        Lb=-10;
        Ub=10;
        dim=2;
    case 22
        Lb=-5.12;
        Ub=5.12;
        dim=30;
    case 23
        Lb=-500;
        Ub=500;
        dim=30;
    case 24
        Lb=0;
        Ub=pi;
        dim=2;
    case 25
        Lb=0;
        Ub=pi;
        dim=5;
    case 26
        Lb=0;
        Ub=pi;
        dim=10;
    case 27
        Lb=-100;
        Ub=100;
        dim=2;
    case 28
        Lb=-5;
        Ub=5;
        dim=2;
    case 29
        Lb=-100;
        Ub=100;
        dim=2;
    case 30
        Lb=-100;
        Ub=100;
        dim=2;
    case 31
        Lb=-10;
        Ub=10;
        dim=2;
    case 32
        Lb=-2;
        Ub=2;
        dim=2;
    case 33
        Lb=-5;
        Ub=5;
        dim=4;
    case 34
        Lb=0;
        Ub=10;
        dim=4;
    case 35
        Lb=0;
        Ub=10;
        dim=4;
    case 36
        Lb=0;
        Ub=10;
        dim=4;
    case 37
        dim=4;
        Lb=-dim;
        Ub=dim;
    case 38
        dim=4;
        Lb=0;
        Ub=dim;
    case 39
        Lb=0;
        Ub=1;
        dim=3;
    case 40
        Lb=0;
        Ub=1;
        dim=6;
    case 41
        Lb=-600;
        Ub=600;
        dim=30;
    case 42
        Lb=-32;
        Ub=32;
        dim=30;
    case 43
        Lb=-50;
        Ub=50;
        dim=30;
    case 44
        Lb=-50;
        Ub=50;
        dim=30;
    case 45
        Lb=0;
        Ub=10;
        dim=2;
    case 46
        Lb=0;
        Ub=10;
        dim=5;
    case 47
        Lb=0;
        Ub=10;
        dim=10;
    case 48
        Lb=-pi;
        Ub=pi;
        dim=2;
    case 49
        Lb=-pi;
        Ub=pi;
        dim=5;
    case 50
        Lb=-pi;
        Ub=pi;
        dim=10;   
end
end
