## Copyright (C) 2022 Ahmed
## Author: Ahmed <ahmed@Ahmed-PC>
## Created: 2022-10-18

function fixed_state = fix_state (in1_col, in1, in2_col, in2, fluid)

global P T VL VV UL UV HL HV SL SV table_1 table_2 table_3
if nargin==5
  if fluid==1 %% Water
    display('loading steam tables...');
    sat_table = importdata("steam_tables/sat_table.csv");
    P = sat_table.data(:,1); T = sat_table.data(:,2);
    VL = sat_table.data(:,3); VV = sat_table.data(:,4);
    UL = sat_table.data(:,5); UV = sat_table.data(:,6);
    HL = sat_table.data(:,7); HV = sat_table.data(:,8);
    SL = sat_table.data(:,9); SV = sat_table.data(:,10);
    clear sat_table
    table_1 = importdata("steam_tables/table_1.csv"); %% temp table
    table_2 = importdata("steam_tables/table_2.csv"); %% pressure table
    table_3 = importdata("steam_tables/table_3.csv"); %% superheated and compressed table
  %% elseif fluid==2 %% R134
%%    display('loading R134 tables...');
  end
return
end


%%error("Error, couldn't fix the state because the two variables aren't independent!");
end
