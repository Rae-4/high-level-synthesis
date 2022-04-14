# high-level-synthesis
High-level synthesis course exercises


#Determinant
static_assert when using c++98 standard in catapult resulted in following errors:
# Error: determinant.cpp(14): constant "N_det" is not a type name (CRD-757)
# Error: determinant.cpp(14): expected a ")" (CRD-18)
# Error: determinant.cpp(14): explicit type is missing ("int" assumed) (CRD-260)

Switching to c++11 which introduced static_assert results in the following:
# Error: errno.h(1): cannot open source file "asm/errno.h" (CRD-1696)
This error also happens with static_assert commented out while using c++11 standard.

I was not able to solve this so the static_assert is commented out and catapult is set to use c++98 standard.


Questions 1: What is the area score with different N values? How fast does the area score rise as a 
function of N? Analyze the results. It is a good idea to look at the RTL schematics to see what happens 
here.

Attempting to unroll main results in this
# Error: Feedback path is too long to schedule design with current pipeline and clock constraints. (SCHD-3)
with N=5.

N | Area
--+------
5 | 46054
4 | 17208
3 | 5536
2 | 1234
1 | 0

The growth in area is exponential to the growth of N. Inspecting the schematics supports this as N=5 uses 12 multipliers, N=4 uses only 5 and N=3 uses 2. Each increase in matrix size brings another level of recursion required where the minor matrix needs to be created and determinant calculated.

Questions 2: Explain in your own words how C++ template recursion works and how it can be utilized in 
hardware description.

Templates allow the generation of larger structures from smaller amount of code at compile time. Thus the synthesis tool can perform it's optimizations as if the recursive structure was hard coded rather than relying on variables to determine the recursion as is used in the testbench. This makes it possible for the synthesis tool to significantly reduce the amount of control logic required.

 The effect for high-level synthesis is similar to using constants instead of variables in loops. Using templates makes more generic code. Getting similar synthesis results without templates would require much more code that is sigfinicantly harder to edit in the future and exploring different constant values like the matrix size in this exercise would not be as simple.
