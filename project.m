## Copyright (C) 2022 Ahmed
## Author: Ahmed <ahmed@Ahmed-PC>
## Created: 2022-10-18
pkg load io
global fluid
fluid = input('Enter the working fluid, 1 for water, 2 for R134, 3 for ideal gas:  ');

display('loading steam tables...');
tables([], [], [], [], fluid);

tables(1,0.015,2,17.5)
