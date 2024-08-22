%% Optical Microscope Algorithm: A new metaheuristic inspired by zoom-in process
%  Author and programmer:                                                   %
%         Professor        Min-Yuan Cheng                                   %
%         Ph.D. Student    Moh Nur Sholeh                                   %
%  Written by Moh Nur Sholeh                                                %
%  Computer Integrated Construction (CIC) Lab                               %
%  National Taiwan University of Science and Technology, Taipei, Taiwan     %
%---------------------------------------------------------------------------%
function main
clear all
clc
%tic;
%% Select function
funnum = 1;         % Function number
[lb ub dim] = boundcondition(funnum);
%% Set the parameters
NP = 50;            % Number of target objects
NI = 1000;          % Numbef of iterations
para=[NI NP];       % Paramater matrix
%% Run OMA 
tic;
[u,fZoom,NumEval,fbestZoom]=OMA(@fobj,funnum,lb,ub,dim,para);
time=toc;
%% Display optimal results
display(['   OPTICAL MICROSCOPE ALGORITHM (OMA) RESULTS   ']);
display(['------------------------------------------------']);
display(['The best target object obtained by OMA is : ', num2str(u)]);
display(['The best zoom-in value of the objective function is : ', num2str(fZoom)]);
plot(fbestZoom,'-','Linewidth',1.5)
xlabel('Iterations')
ylabel('Objective value')
legend('OMA')
std(fbestZoom);
%toc;
%% Save optimal results
save('result.mat','time','u','fZoom','NumEval','fbestZoom');
end
