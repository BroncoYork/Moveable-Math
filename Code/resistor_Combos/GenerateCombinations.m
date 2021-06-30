clear
clc

%primeCombos = load('resistorVals.txt');

resistorvals = [223,383,487];
primeCombos = nchoosek(resistorvals,3);

[rows,cols] = size(primeCombos);



for loopit = 1:rows

a=0; %No marker
b=primeCombos(loopit,1); %Resistance scalars
c=primeCombos(loopit,2); %Resistance X
d=primeCombos(loopit,3); %Resistance Y
spacestopin=5; %Number of spaces to pin

A = [0,0,0,0,0];

for x=0:spacestopin
    for y=0:spacestopin
        for z=0:spacestopin
            for n=0:spacestopin               
                B = [x,y,z,n,0];
                if x+y+z+n == spacestopin
                    A = [A;B];
                end
            end
        end
    end
end

A(1,:) = [];

[R,C] = size(A);

% L = zeros(2*R,5);

% A = [A;L];

clear('C');

for p=1:R
    if A(p,2) == 0 && A(p,3) == 0 && A(p,4) == 0
        A(p,5) = 1023;
        
%         A(4*R+p,:) = A(p,:);
%         A(4*R+p,5) = A(p,5)-1;    
%         
%         %These are useless, but the program gets angry if they aren't
%         %included and distinct.
%         A(R+p,:) = A(p,:);
%         A(R+p,5) = A(p,5)+1;
    else
        A(p,5) = round(233.86*log((1/((A(p,2)/b)+(A(p,3)/c)+(A(p,4)/d))))-859.89);
%         A(R+p,:) = A(p,:);
%         A(R+p,5) = A(p,5)+1;
%         A(2*R+p,:) = A(p,:);
%         A(2*R+p,5) = A(p,5)-1;
    end

end

M = A(:,5);

if length(M) == length(unique(M))
    save('permutations.txt','A','-ascii');
    disp("Success!")
    dispStrSuc= strcat("Combination: ",num2str(b),", ",num2str(c),", ",num2str(d));
    disp(dispStrSuc)
    disp(newline)
    SortM = sort(M);
    
else
    T = (length(M)-length(unique(M)));
    dispStrA = strcat("Failure! ",num2str(T)," non-unique solutions.");
    disp(dispStrA)    
    disp(newline)
    dispStrB = strcat("Combination ",num2str(loopit)," of ",num2str(rows),'.');
    disp(dispStrB)
    disp(newline)
end
end