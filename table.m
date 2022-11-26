## Copyright (C) 2022 Ahmed
## Author: Ahmed <ahmed@Ahmed-PC>
## Created: 2022-11-13

function fixed_state = table (in1_col, in1, in2_col, in2)

in1_ind = find(table(:,in1_col)==in1);
if(in1_ind) %% if 1st input found, find the second input
  in2_ind = find(table(in1_ind,in2_col)==in2);
  if(in2_ind) %% if 2nd input found, fix the state
    fixed_state = table(in2_ind,:);
  else %% if 2nd input not found interpolate
    for i = in1_ind'
      if table(i,in2_col)>in2
        if i==in1_ind(1)
          error("Can't interpolate because number is too small");
        end
            fixed_state = (table(i,:) + table(i-1,:)) + (in1/(table(i,in1_col) - table(i-1,in1_col)));
        break;
      end
    end
  end
else
  in2_ind = find(table(:,in2_col)==in2);
  if(in2_ind) %% if number not found, then interpolate
    for i=in1_ind'
      if(table(i,in2_col)>in2)
        if i==in1_ind(1)
          error("Can't interpolate because number is too small");
        end
      else
        fixed_state = table(i,:) - ((table(i,:) - table(i-1,:)).*(table(i,ind2_col) - in1))./(table(i,:) - table(i-1,:));
        break;
      end
    end
  else %% neither the first input nor the second is found
    sz1 = size(table);
    for i=1:sz1(1)
      if(table(i,in1_col)>in1)
        if i==1
          error("Can't interpolate because number is too small");
        end
      else
        min = table(i,in1_col);
        if table(i+1,in1_col)>min
          max = table(i+1,in1_col);
          i1 = find(table(:,in1_col)==min);
          i2 = find(table(:,in1_col)==max);
          mat = in1./(table(i1,in1_col)+table(i2,in1_col)) .* (table(i1,:)+table(i2,:));
          sz2 = size(mat);
          for i=1:sz2(1)
            if mat(i,in2_col)>in2
              if i==1
                error("Can't interpolate because number is too small");
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
