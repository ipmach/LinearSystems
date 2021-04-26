# Linear Systems

Different linear systems solvers that I had to implement on Matlab.

* **Newton method**: It use the Hessian and the Jacobbian matrices for Ax = b. <br> 
  &emsp; &emsp; &emsp; &emsp; <img src="https://github.com/ipmach/LinearSystems/blob/master/img/equations/Newton.png" alt="drawing" width="280"/>
* **Least Square method**: When we have non square matrices. <br>
  &emsp; &emsp; &emsp; &emsp; <img src="https://github.com/ipmach/LinearSystems/blob/master/img/equations/LeastSquare.png" alt="drawing" width="250"/>   <br>
In our implementation we use a direct solver: <br>
  &emsp; &emsp; &emsp; &emsp; <img src="https://github.com/ipmach/LinearSystems/blob/master/img/equations/LeastSquare2.png" alt="drawing" width="200"/>
* **Additive Schwarz method**: We create a more compact matrix A with some restrictions matrices R. <br>
&emsp; &emsp; &emsp; &emsp; <img src="https://github.com/ipmach/LinearSystems/blob/master/img/equations/Schwarz.png" alt="drawing" width="230"/>   <br>
And we solve doing iterations: <br>
&emsp; &emsp; &emsp; &emsp; <img src="https://github.com/ipmach/LinearSystems/blob/master/img/equations/Schawarz2.png" alt="drawing" width="250"/> 
* **Trust regions method**: We try to solve the next optimization function, where f is our original function: <br>
&emsp; &emsp; &emsp; &emsp; <img src="https://github.com/ipmach/LinearSystems/blob/master/img/equations/TrustRegion.png" alt="drawing" width="360"/>   <br>
we calculate rho using this method: <br>
&emsp; &emsp; &emsp; &emsp; <img src="https://github.com/ipmach/LinearSystems/blob/master/img/equations/TrustRegion2.png" alt="drawing" width="220"/>   <br>
We calculate p using Cauchy Point or Dog Leg.
* Multigrid with Gauss-Seidel and Jacobi


## Newton method visualization
<img src="https://github.com/ipmach/LinearSystems/blob/master/img/plot1.png" alt="drawing" width="700"/>

## Trust regions method visualization
<img src="https://github.com/ipmach/LinearSystems/blob/master/img/plot2.png" alt="drawing" width="700"/>

## Multigrid with Gauss-Seidel and Jacobi method visualization
<img src="https://github.com/ipmach/LinearSystems/blob/master/img/plot3.png" alt="drawing" width="700"/>
