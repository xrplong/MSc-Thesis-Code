# Masters-Project-Work
All files below are matlab .m files.

# **Explanation of Files and Output**

**1. <u> Main1.m** </u>\
Shows travelling wave behaviour of solutions and shows convergence in slope of travelling wave.

Input data:
- lambda
- omega
- N (How many solutions you want to consider)
- P (How many solutions you want to plot, < N)

Output data:
- Line plot showing travelling wave behaviour of solutions.
- Line plot showing the asymptotic convergence in slope of the travelling wave solutions.

**2. <u> Main2.m** </u>\
Shows (n = N fixed) solution against variation in lambda and omega.

Input data (variation in lambda):
- N            (fixed solution)
- L            (lambda upper bound)
- l            (lambda lower bound)
- stepL        (step size for variation in lambda)
- omegaFixed   (fixed value for omega)

Input data (variation in omega):
- N             (fixed solution)
- W             (omega upper bound)
- w             (omega lower bound)
- stepW         (step size for variation in omega)
- lambdaFixed   (fixed value for lambda)

Output data:
- Line plot showing multiple (n=N) solutions for varying lambda.
- Line plot showing multiple (n=N) solutions for varying omega.

**3. <u> Main3.m** </u>\
Shows slope of solution (n = N fixed) against variation in lambda and omega.

Input data:
- N            (fixed solution)
- L            (lambda upper bound)
- l            (lambda lower bound)
- stepL        (step size for variation in lambda)
- W            (omega upper bound)
- w            (omega lower bound)
- stepW        (step size for variation in omega)

Output data:
- Surface plot showing slope of (n=N) solution vs variation in lambda and omega.

**4. <u> Main4.m** </u>\
Shows slope of travelling wave with variation in lambda or omega.

Input data (variation in lambda):
- N            (fixed solution)
- L            (lambda upper bound)
- l            (lambda lower bound)
- stepL        (step size for variation in lambda)
- omegaFixed   (fixed value for omega)

Input data (variation in omega):
- N            (fixed solution)
- W            (omega upper bound)
- w            (omega lower bound)
- stepW        (step size for variation in omega)
- lambdaFixed  (fixed value for lambda)

Output data:
- Surface plot showing slope vs variation in lambda and n.
- Surface plot showing slope vs variation in omega and n.

**5. <u> Main5.m** </u>\
Shows the velocity of travelling wave for increasing n.

Input data:
- lambda   (lambda value fixed)
- omega    (omega value fixed)
- N        (How many solutions you need)

Output data:
- Line plot showing velocity vs increasing n.
- Above line plot includes asymptotic line and value.

**6. <u> Main6.m** </u>\
Shows the velocity of travelling wave with variation in lambda or omega.

Input data (variation in lambda):
- N            (How many travelling wave solutions you need)
- L            (lambda upper bound)
- l            (lambda lower bound)
- stepL        (step size for variation in lambda)
- omegaFixed   (fixed value for omega)

Input data (variation in omega):
- N            (How many travelling wave solutions you need)
- W            (omega upper bound)
- w            (omega lower bound)
- stepW        (step size for variation in omega)

Output data:
- Surface plot showing velocity vs variation in lambda and n.
- Surface plot showing velocity vs variation in omega and n.

**7. <u> slope.m** </u>\
Function used in other files to find the slope of a solution.

We measure the slope of a solution about the point y == 0.5.

Function input:
- t   (time array)
- y   (solution array)

Function output:
- D   (approximate derivative at y == 0.5)

**8. <u> slope_tval.m** </u>\
Function used in other files to find the approximate t value when y == 0.5.

Function input:
- t      (time array)
- y      (solution array)

Function output:
- tval   (approximate t value at y == 0.5)

