%% Optical Microscope Algorithm: A new metaheuristic inspired by zoom-in process
%  Author and programmer:                                                   %
%         Professor        Min-Yuan Cheng                                   %
%         Ph.D. Student    Moh Nur Sholeh                                   %
%  Written by Moh Nur Sholeh                                                %
%  Computer Integrated Construction (CIC) Lab                               %
%  National Taiwan University of Science and Technology, Taipei, Taiwan     %
%---------------------------------------------------------------------------%
function [u,fZoom,NumEval,fbestZoom]=OMA(ZoomFunction,funnum,Lb,Ub,dim,para);
%% Problem Definition
nVar=dim;                          % Number of decision variables
VarSize=[1 nVar];                  % Decision variable matrix size
if length(Lb)==1
    VarLow=Lb.*ones(1,dim);        % Lower bound of variables
    VarUp=Ub.*ones(1,dim);         % Upper bound of variables
else
    VarLow=Lb;
    VarUp=Ub;
end
%% OMA Parameters
NI = para(1);   %10000;            % Number of iterations
NP = para(2);   %50;               % Population size (target objects)
%% 1. Naked Eyes Phase
% Initialization population (target objects) using Eq. (1)
object=initialization(NP,dim,VarUp,VarLow);
% Evaluate population (target objects)
for i=1:NP
    objZoom(i) = ZoomFunction(object(i,:),funnum);
end
%% OMA Main Loop
for iter=1:NI
    [value,index]=sort(objZoom);
    BestSol=object(index(1),:);
    BestZoom=objZoom(index(1));
    %% 2. Objective Lens Phase
    for i=1:NP
        % Modify target object using Eq. (3)
        newsol = object(i,:)+ rand(VarSize).*(1.40*BestSol);
        % Check the boundary
        newsol = checkbounds(newsol,VarLow,VarUp);
        % Evaluation of eyepiece
        newsolZoom = ZoomFunction(newsol,funnum);
        % Zoom-in result comparison
        if newsolZoom<objZoom(i)
            object(i,:) = newsol;
            objZoom(i)= newsolZoom;
            if objZoom(i) < BestZoom
                BestZoom= objZoom(i);
                BestSol = object(i,:);
            end
        end
    end
    %% 3. Eyepiece Phase
    for i=1:NP
        j=i;
        while j==i
            j=floor(rand*NP)+1;
        end
        % Calculate local search space using Eq. (4)
        space = object(i,:) - object(j,:);
        if objZoom(j)<objZoom(i)
            space = -space;
        end
        % Modify target object using Eq. (5)
        newsol = object(i,:) + rand(VarSize).*(0.55*space);
        % Check the boundary
        newsol = checkbounds(newsol,VarLow,VarUp);
        % Evaluation of objective lens
        newsolZoom = ZoomFunction(newsol,funnum);
        % Zoom-in result comparison
        if newsolZoom<objZoom(i)
            object(i,:) = newsol;
            objZoom(i)= newsolZoom;
            if objZoom(i) < BestZoom
                BestZoom= objZoom(i);
                BestSol = object(i,:);
            end
        end
    end
    %% Save for current iteration
    fbestZoom(iter)=BestZoom;
    if iter>=2000
        if abs(fbestZoom(iter)-fbestZoom(iter-100))<1e-350
            break;
        end
    end
end
u=BestSol;
fZoom=fbestZoom(iter);
NumEval=iter*NP;
end
%% Initialization Target Objects for Naked Eyes
function pop=initialization(NP,dim,Ub,Lb)
if size(Lb,2)==1
    Lb=Lb*ones(1,dim);
    Ub=Ub*ones(1,dim);
end
x(1,:)=rand(1,dim);
for i=1:(NP-1)
    x(i+1,:)=x(i,:).*(1-x(i,:));
end 
for k=1:dim
    for i=1:NP
        pop(i,k)=Lb(k)+x(i,k)*(Ub(k)-Lb(k));
    end
end
end
%% Boundary Handling
function s=checkbounds(s,Lb,Ub)
ns_tmp=s;
I=ns_tmp<Lb;
% Apply to lower bound
while sum(I)~=0
    ns_tmp(I)=Ub(I)+(ns_tmp(I)-Lb(I));
    I=ns_tmp<Lb;
end
% Apply to upper bound
J=ns_tmp>Ub;
while sum(J)~=0
    ns_tmp(J)=Lb(J)+(ns_tmp(J)-Ub(J));
    J=ns_tmp>Ub;
end
% Check results
s=ns_tmp;
end