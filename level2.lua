--[[
The MIT License (MIT)

Copyright (c) 2016 Subhojit Basu

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
----------------------------------------------
-- Example Configuration File [level2]
-- Author : Subhojit Basu
-- Date : 17th Sept 2013
-- Copyright 2013 ANTfarm Robotics Pvt. Ltd.
----------------------------------------------
--]]


dofile("level1.lua");

--Table holding all rules as priority_queue
T2 = {};
--Rule 1:

rule1 = function ()
	if( a > 4 and b < 7 and c) then
		T2["rule1"].flag = false;
		T2["rule2"].flag = true;
		print("Set rule1 \n");
		a , b ,c = 1 , 10 , false;
	end
end

T2["rule1"] = { f = rule1 , Priority = 1.01 , flag = true};

--Rule 2:

rule2 = function ()
	if( a < 4 and b > 7 and not c) then
		T2["rule2"].flag = false;
		T2["rule1"].flag = true;
		print("Set rule2 \n");
		a , b , c = 5 , 6 , true;
	end
end

T2["rule2"] = { f = rule2 , Priority = 0.99 , flag = true};

--Rule 3: 
--Is a Sub group


T2["rule3"] = { f = T1 , Priority = 0.99 , flag = true};

--end
