N = 7;
gen = 57;
time = .1;
sizeofgrid = N*N;
nrows = N;
ncols = N;
grid1 = zeros(nrows, ncols);
grid2 = zeros(nrows, ncols);

% interior
grid1(2,4)=1;
grid1(3,2)=1;
grid1(3,4)=1;
grid1(4,3)=1;
grid1(4,4)=1;

%TESTING
% top edge -- fixed
% grid1(1,5)=1;
% grid1(2,3)=1;
% grid1(2,5)=1;
% grid1(3,4)=1;
% grid1(3,5)=1;

% bottom edge -- okay
% grid1(5,5)=1;
% grid1(N-1,3)=1;
% grid1(N-1,5)=1;
% grid1(N,4)=1;
% grid1(N,5)=1;

% right edge -- okay
% grid1(2,N)=1;
% grid1(3,5)=1;
% grid1(3,N)=1;
% grid1(4,N-1)=1;
% grid1(4,N)=1;

for images = 1: gen
    [grid1, grid2] = advance(grid1, grid2);
    image(grid1,'CdataMapping', 'scaled');
    drawnow;
    pause(time);
    disp(images);     %making sure it runs all 57 by displaying the number 
    grid1 = grid2;
end
  
function [griduniv1, griduniv2] = advance(griduniv1, griduniv2)
  alive_now = 0; %sets an variable called alive now to 0 so we can add to it when we find alive neighbors

  N = size(griduniv1,1);
  
% corners 
% for corners we check 8 surrounding points that also wrap around the grid
% corner 1,1 
row = 1; 
col = 1;
  if row == 1 
        if col == 1
            if griduniv1(N,N) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(N,col) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row+1,N) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row,N) == 1 % CHANGED THIS
                alive_now= alive_now + 1;
            end
            if griduniv1(row+1,1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(N,col+1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row, col+1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row+1,col+1) == 1
                alive_now= alive_now + 1;
            end
% the rules of life and death             
            if (griduniv1(row, col)==1) && (alive_now < 2)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==1) && (alive_now >= 4)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==1) && (alive_now == 2)
                griduniv2(row, col) = 1;
            end

            if (griduniv1(row, col)==1) && (alive_now == 3)
                griduniv2(row, col) = 1;
            end
            
            if (griduniv1(row, col)==0) && (alive_now == 3)
                griduniv2(row, col) = 1;
            end 
            
            if (griduniv1(row, col)==0) && (alive_now < 3)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==0) && (alive_now > 3)
                griduniv2(row, col) = 0;
            end
            alive_now = 0;
        end
  end
  
% corner 1,N
row = 1;
col = N;       
  if row == 1
      if col == N
            if griduniv1(N,col-1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(1,col-1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row+1,col-1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(N,col) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row+1,col) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(N,1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row,1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row+1,1) == 1
                alive_now= alive_now + 1;
            end
% the rules of life and death 
            if (griduniv1(row, col)==1) && (alive_now < 2)
                griduniv2(row, col) = 0;
            end

            if (griduniv1(row, col)==1) && (alive_now >= 4)
                griduniv2(row, col) = 0;
            end

            if (griduniv1(row, col)==1) && (alive_now == 2)
                griduniv2(row, col) = 1;
            end

            if (griduniv1(row, col)==1) && (alive_now == 3)
                griduniv2(row, col) = 1;
            end

            if (griduniv1(row, col)==0) && (alive_now == 3)
                griduniv2(row, col) = 1;
            end 

            if (griduniv1(row, col)==0) && (alive_now < 3)
                griduniv2(row, col) = 0;
            end

            if (griduniv1(row, col)==0) && (alive_now > 3)
                griduniv2(row, col) = 0;
            end
            alive_now = 0;
       end
  end
  
% corner N,1
row = N;
col = 1;
    if col == 1
        if row == N
            if griduniv1(row-1,N) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row,N) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(1,N) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row-1,col) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(1,col) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row-1,col+1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row,col+1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(1,col+1) == 1
                alive_now= alive_now + 1;
            end
            
% the rules of life and death 
            if (griduniv1(row, col)==1) && (alive_now < 2)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==1) && (alive_now >= 4)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==1) && (alive_now == 2)
                griduniv2(row, col) = 1;
            end

            if (griduniv1(row, col)==1) && (alive_now == 3)
                griduniv2(row, col) = 1;
            end
            
            if (griduniv1(row, col)==0) && (alive_now == 3)
                griduniv2(row, col) = 1;
            end 
            
            if (griduniv1(row, col)==0) && (alive_now < 3)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==0) && (alive_now > 3)
                griduniv2(row, col) = 0;
            end
            alive_now = 0;
        end
    end
    
% corner N,N
row = N;
col = N; 
    if col == N
        if row == N
            if griduniv1(row-1,col-1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row-1,col) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row-1,1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row,col-1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row,1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(1,col-1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(1,col) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(1,1) == 1
                alive_now= alive_now + 1;
            end
% the rules of life and death 
            if (griduniv1(row, col)==1) && (alive_now < 2)
                griduniv2(row, col) = 0;
            end
            if (griduniv1(row, col)==1) && (alive_now < 2)
                griduniv2(row, col) = 0;
            end

            if (griduniv1(row, col)==1) && (alive_now >= 4)
                griduniv2(row, col) = 0;
            end

            if (griduniv1(row, col)==1) && (alive_now == 2)
                griduniv2(row, col) = 1;
            end

            if (griduniv1(row, col)==1) && (alive_now == 3)
                griduniv2(row, col) = 1;
            end

            if (griduniv1(row, col)==0) && (alive_now == 3)
                griduniv2(row, col) = 1;
            end 

            if (griduniv1(row, col)==0) && (alive_now < 3)
                griduniv2(row, col) = 0;
            end

            if (griduniv1(row, col)==0) && (alive_now > 3)
                griduniv2(row, col) = 0;
            end
            alive_now = 0;
        end
    end
    
% for all the 4 sides

% left edge
col = 1;    
    if col == 1
        for row = 2:N-1
            if griduniv1(row-1, N) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row, N) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row+1, N) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row-1, col) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row+1, col) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row-1, col+1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row, col+1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row+1, col+1) == 1
                alive_now= alive_now + 1;
            end
% the rules of life and death 
            if (griduniv1(row, col)==1) && (alive_now < 2)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==1) && (alive_now >= 4)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==1) && (alive_now == 2)
                griduniv2(row, col) = 1;
            end

            if (griduniv1(row, col)==1) && (alive_now == 3)
                griduniv2(row, col) = 1;
            end
            
            if (griduniv1(row, col)==0) && (alive_now == 3)
                griduniv2(row, col) = 1;
            end 
            
            if (griduniv1(row, col)==0) && (alive_now < 3)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==0) && (alive_now > 3)
                griduniv2(row, col) = 0;
            end
            alive_now = 0;
        end
    end
      
    
% right edge
col = N;
   if col == N
        for row = 2:N-1
            if griduniv1(row-1, col-1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row-1, col) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row-1, 1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row, col-1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row, 1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row+1, col-1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row+1, col) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row+1, 1) == 1
                alive_now= alive_now + 1;
            end
% the rules of life and death 
            if (griduniv1(row, col)==1) && (alive_now < 2)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==1) && (alive_now >= 4)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==1) && (alive_now == 2)
                griduniv2(row, col) = 1;
            end

            if (griduniv1(row, col)==1) && (alive_now == 3)
                griduniv2(row, col) = 1;
            end
            
            if (griduniv1(row, col)==0) && (alive_now == 3)
                griduniv2(row, col) = 1;
            end 
            
            if (griduniv1(row, col)==0) && (alive_now < 3)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==0) && (alive_now > 3)
                griduniv2(row, col) = 0;
            end
            alive_now = 0;
        end
   end

% top edge
row = 1;  
  if row == 1
        for col = 2:N-1
            if griduniv1(N, col-1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row, col-1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row+1, col-1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(N, col) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row+1, col) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(N, col+1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row, col+1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row+1, col+1) == 1
                alive_now= alive_now + 1;
            end
            
% the rules of life and death 
            if (griduniv1(row, col)==1) && (alive_now < 2)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==1) && (alive_now >= 4)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==1) && (alive_now == 2)
                griduniv2(row, col) = 1;
            end

            if (griduniv1(row, col)==1) && (alive_now == 3)
                griduniv2(row, col) = 1;
            end
            
            if (griduniv1(row, col)==0) && (alive_now == 3)
                griduniv2(row, col) = 1;
            end 
            
            if (griduniv1(row, col)==0) && (alive_now < 3)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==0) && (alive_now > 3)
                griduniv2(row, col) = 0;
            end
            alive_now = 0;
        end
  end
  
% bottom edge
row = N;         
    if row == N
        for col = 2:N-1
            if griduniv1(row-1, col-1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row, col-1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(1, col-1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row-1, col) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(1, col) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row-1, col+1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row, col+1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(1, col+1) == 1
                alive_now= alive_now + 1;
            end
            
% the rules of life and death 
 
           if (griduniv1(row, col)==1) && (alive_now < 2)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==1) && (alive_now >= 4)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==1) && (alive_now == 2)
                griduniv2(row, col) = 1;
            end

            if (griduniv1(row, col)==1) && (alive_now == 3)
                griduniv2(row, col) = 1;
            end
            
            if (griduniv1(row, col)==0) && (alive_now == 3)
                griduniv2(row, col) = 1;
            end 
            
            if (griduniv1(row, col)==0) && (alive_now < 3)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==0) && (alive_now > 3)
                griduniv2(row, col) = 0;
            end
            alive_now = 0;
        end
    end

        
% for non sides and non corners
    for col = 2:N-1
         for row = 2:N-1
            if griduniv1(row-1, col-1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row+1, col+1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row-1, col+1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row+1, col-1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row, col-1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row, col+1) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row-1, col) == 1
                alive_now= alive_now + 1;
            end
            if griduniv1(row+1, col) == 1
                alive_now= alive_now + 1;
            end

 % the rules of life and death 
 
            if (griduniv1(row, col)==1) && (alive_now < 2)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==1) && (alive_now >= 4)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==1) && (alive_now == 2)
                griduniv2(row, col) = 1;
            end

            if (griduniv1(row, col)==1) && (alive_now == 3)
                griduniv2(row, col) = 1;
            end
            
            if (griduniv1(row, col)==0) && (alive_now == 3)
                griduniv2(row, col) = 1;
            end 
            
            if (griduniv1(row, col)==0) && (alive_now < 3)
                griduniv2(row, col) = 0;
            end
            
            if (griduniv1(row, col)==0) && (alive_now > 3)
                griduniv2(row, col) = 0;
            end
            alive_now = 0;
         end
    end
end
