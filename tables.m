## Copyright (C) 2022 Ahmed
## Author: Ahmed <ahmed@Ahmed-PC>
## Created: 2022-10-18

function fixed_state = tables (in1_col, in1, in2_col, in2, fluid)

global table_1 table_2 table_3
if nargin==5
  if fluid==1
    table_1 = xlsread("steam_tables/table_1.xlsx"); %% temp table
    table_2 = xlsread("steam_tables/table_2.xlsx"); %% pressure table
    table_3 = xlsread("steam_tables/table_3.xlsx"); %% superheated and compressed table
  %% elseif fluid==2
  end
return
end

in1_ind = find(table_3(:,in1_col)==in1);
if(in1_ind) %% if 1st input found, find the second input
  in2_ind = find(table_3(in1_ind,in2_col)==in2);
  if(in2_ind) %% if 2nd input found, fix the state
    fixed_state = table_3(in2_ind,:);
  else %% if 2nd input not found interpolate
    for i = in1_ind'
      if table_3(i,in2_col)>in2
        if i==in1_ind(1)
          display("Can't interpolate because number is too small");
          break;
        end
            fixed_state = (table_3(i,:) + table_3(i-1,:)) + (in1/(table_3(i,in1_col) - table_3(i-1,in1_col)));
        break;
      end
    end
  end
else
  in2_ind = find(table_3(:,in2_col)==in2);
  if(in2_ind) %% if number not found, then interpolate
    for i=in1_ind'
      if(table_3(i,in2_col)>in2)
        if i==in1_ind(1)
          display("Can't interpolate because number is too small");
          break;
        end
      else
        fixed_state = table_3(i,:) - ((table_3(i,:) - table_3(i-1,:)).*(table_3(i,ind2_col) - in1))./(table_3(i,:) - table_3(i-1,:));
        break;
      end
    end
  else %% neither the first input nor the second is found
    sz1 = size(table_3);
    for i=1:sz1(1)
      if(table_3(i,in1_col)>in1)
        if i==1
          display("Can't interpolate because number is too small");
          break;
        end
      else
        min = table_3(i,in1_col);
        if table_3(i+1,in1_col)>min
          max = table_3(i+1,in1_col);
          i1 = find(table_3(:,in1_col)==min);
          i2 = find(table_3(:,in1_col)==max);
          mat = in1./(table_3(i1,in1_col)+table_3(i2,in1_col)) .* (table_3(i1,:)+table_3(i2,:));
          sz2 = size(mat);
          for i=1:sz2(1)
            if mat(i,in2_col)>in2
              if i==1
                display("Can't interpolate because number is too small");
                break;
              else
                mat(i-1,in2_col)
                fixed_state = in2./(mat(i-1,in2_col)+mat(i,in2_col)) .* (mat(i-1,:)+mat(i,:));
                break;
              end
            end
          end
        end
      end
    end
  end
end

endfunction
