## Copyright (C) 2022 Ahmed
## Author: Ahmed <ahmed@Ahmed-PC>
## Created: 2022-10-18

<<<<<<< bda119af8c238a53c205be3a5f010cd7111173c9
function retval = project (input1, input2)

fluid = input('Enter the working fluid, 1 for water, 2 for R134, 3 for ideal gas');
=======
global fluid
fluid = input('Enter the working fluid, 1 for water, 2 for R134, 3 for ideal gas  ');
>>>>>>> Steam Tables Done
display('loading steam tables...');
tables([], [], [], [], fluid);


endfunction
