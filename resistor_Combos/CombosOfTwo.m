clear
clc

resistorvals = [100,101,102,104,105,106,107,109,110,111,113,114,115,117,118,120,121,123,124,126,127,129,130,132,133,135,137,138,140,142,143,145,147,149,150,152,154,156,158,160,162,164,165,167,169,172,174,176,178,180,182,184,187,189,191,193,196,198,200,203,205,208,210,213,215,218,221,223,226,229,232,234,237,240,243,246,249,252,255,258,261,264,267,271,274,277,280,284,287,291,294,298,301,305,309,312,316,320,324,328,332,336,340,344,348,352,357,361,365,370,374,379,383,388,392,397,402,407,412,417,422,427,432,437,442,448,453,459,464,470,475,481,487,493,499,505,511,517,523,530,536,542,549,556,562,569,576,583,590,597,604,612,619,626,634,642,649,657,665,673,681,690,698,706,715,723,732,741,750,759,768,777,787,796,806,816,825,835,845,856,866,876,887,898,909,920,931,942,953,965,976,988];
primeCombos = nchoosek(resistorvals,2);

%primeCombos = load('ValidCombosOfTwo.txt');

[rows,cols] = size(primeCombos);

validCombos = [0,0];

for loopit = 1:rows
%for loopit = 12
a=0; %No marker
b=primeCombos(loopit,1); %Resistance scalars
c=primeCombos(loopit,2); %Resistance X
spacestopin=5; %Number of spaces to pin

A = [0,0,0,0];

for x=0:spacestopin
    for y=0:spacestopin
        for z=0:spacestopin
                           
                B = [x,y,z,0];
                if x+y+z == spacestopin
                    A = [A;B];
                end
            
        end
    end
end

A(1,:) = [];

[R,C] = size(A);

 L = zeros(12*R,4);

 A = [A;L];

clear('C');

for p=1:R
    if A(p,2) == 0 && A(p,3) == 0
        A(p,4) = 1023;
         
         A(R+p,:) = A(p,:);
         A(R+p,4) = A(p,4)-1;
         A(2*R+p,:) = A(p,:);
         A(2*R+p,4) = A(p,4)+1;
         A(3*R+p,:) = A(p,:);
         A(3*R+p,4) = A(p,4)-2;
         A(4*R+p,:) = A(p,:);
         A(4*R+p,4) = A(p,4)+2;
         A(5*R+p,:) = A(p,:);
         A(5*R+p,4) = A(p,4)-3;
         A(6*R+p,:) = A(p,:);
         A(6*R+p,4) = A(p,4)+3;       
         A(7*R+p,:) = A(p,:);
         A(7*R+p,4) = A(p,4)-4;         
         A(8*R+p,:) = A(p,:);
         A(8*R+p,4) = A(p,4)+4;         
         A(9*R+p,:) = A(p,:);
         A(9*R+p,4) = A(p,4)-5;         
         A(10*R+p,:) = A(p,:);
         A(10*R+p,4) = A(p,4)+5;         
         A(11*R+p,:) = A(p,:);
         A(11*R+p,4) = A(p,4)-6;         
         A(12*R+p,:) = A(p,:);
         A(12*R+p,4) = A(p,4)+6;         
%          A(13*R+p,:) = A(p,:);
%          A(13*R+p,4) = A(p,4)-7;     
%          A(14*R+p,:) = A(p,:);
%          A(14*R+p,4) = A(p,4)+7;         
%          A(15*R+p,:) = A(p,:);
%          A(15*R+p,4) = A(p,4)-8;         
%          A(16*R+p,:) = A(p,:);
%          A(16*R+p,4) = A(p,4)+8;         
%          A(17*R+p,:) = A(p,:);
%          A(17*R+p,4) = A(p,4)-9;         
%          A(18*R+p,:) = A(p,:);
%          A(18*R+p,4) = A(p,4)+9;         
%          A(19*R+p,:) = A(p,:);
%          A(19*R+p,4) = A(p,4)-10;         
%          A(20*R+p,:) = A(p,:);
%          A(20*R+p,4) = A(p,4)+10;  
          
    else
         A(p,4) = round(233.86*log((1/((A(p,2)/b)+(A(p,3)/c))))-859.89);
         
         A(R+p,:) = A(p,:);
         A(R+p,4) = A(p,4)-1;
         A(2*R+p,:) = A(p,:);
         A(2*R+p,4) = A(p,4)+1;
         A(3*R+p,:) = A(p,:);
         A(3*R+p,4) = A(p,4)-2;
         A(4*R+p,:) = A(p,:);
         A(4*R+p,4) = A(p,4)+2;
         A(5*R+p,:) = A(p,:);
         A(5*R+p,4) = A(p,4)-3;
         A(6*R+p,:) = A(p,:);
         A(6*R+p,4) = A(p,4)+3;       
         A(7*R+p,:) = A(p,:);
         A(7*R+p,4) = A(p,4)-4;         
         A(8*R+p,:) = A(p,:);
         A(8*R+p,4) = A(p,4)+4;         
         A(9*R+p,:) = A(p,:);
         A(9*R+p,4) = A(p,4)-5;         
         A(10*R+p,:) = A(p,:);
         A(10*R+p,4) = A(p,4)+5;         
         A(11*R+p,:) = A(p,:);
         A(11*R+p,4) = A(p,4)-6;         
         A(12*R+p,:) = A(p,:);
         A(12*R+p,4) = A(p,4)+6;         
%          A(13*R+p,:) = A(p,:);
%          A(13*R+p,4) = A(p,4)-7;     
%          A(14*R+p,:) = A(p,:);
%          A(14*R+p,4) = A(p,4)+7;         
%          A(15*R+p,:) = A(p,:);
%          A(15*R+p,4) = A(p,4)-8;         
%          A(16*R+p,:) = A(p,:);
%          A(16*R+p,4) = A(p,4)+8;         
%          A(17*R+p,:) = A(p,:);
%          A(17*R+p,4) = A(p,4)-9;         
%          A(18*R+p,:) = A(p,:);
%          A(18*R+p,4) = A(p,4)+9;         
%          A(19*R+p,:) = A(p,:);
%          A(19*R+p,4) = A(p,4)-10;         
%          A(20*R+p,:) = A(p,:);
%          A(20*R+p,4) = A(p,4)+10;     
         
    end

end

M = A(:,4);

if length(M) == length(unique(M)) && isequal(M,abs(M))
    save('permutations.txt','A','-ascii');
    disp("Success!")
    dispStrSuc= strcat("Combination: ",num2str(b),", ",num2str(c));
    disp(dispStrSuc)
    disp(newline)
    SortM = sort(M);
    validCombos = [validCombos;b,c];
elseif length(M) ~= length(unique(M))
    T = (length(M)-length(unique(M)));
    dispStrA = strcat("Failure! ",num2str(T)," non-unique solutions.");
    disp(dispStrA)    
    disp(newline)
    dispStrB = strcat("Combination ",num2str(loopit)," of ",num2str(rows),'.');
    disp(dispStrB)
    disp(newline)
elseif not(isequal(M,abs(M)))
    disp("Failure! Negative solutions.")      
    disp(newline)
    dispStrB = strcat("Combination ",num2str(loopit)," of ",num2str(rows),'.');
    disp(dispStrB)
    disp(newline)   
end
end
[Bigrow,bigcol] = size(validCombos);
disp(num2str(Bigrow-1))