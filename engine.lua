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
-- AI Engine
-- Author : Subhojit Basu
-- Date : 17th Sept 2013
-- Copyright 2013 ANTfarm Robotics Pvt. Ltd.
----------------------------------------------
--]]


-- Priority Queue Example
PQ = require "loop.collection.PriorityQueue"

Scheduler = {};
dofile("level3.lua");

function upload(t)

	for index,val in next,t,nil do

		local x = type(val.f);
		if( x == "table") and (val.flag == true) then
			upload(val.f);
			print("table\n");
		elseif (x == "function") and (val.flag == true ) then
			PQ.enqueue(Scheduler,val,val.Priority);
			print("function \n");
		else
			print("junk\n");
		end
	end



end

while(1) do	
	--Simple Scheduler
	--Make the Jobs while checking for enable / disable
	upload(T3);
	--Do the Jobs
	f,p = PQ.dequeue(Scheduler);
	while( f ) do
		f.f();
		f,p = PQ.dequeue(Scheduler);
	end
end
