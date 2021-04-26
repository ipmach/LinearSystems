# Linear Systems

Different linear systems solvers that I had to implement on Matlab.

* **Newton method**: It use the Hessian and the Jacobbian matrices for Ax = b. <br> 
  &emsp; &emsp; &emsp; &emsp; <img src="https://github.com/ipmach/LinearSystems/blob/master/img/equations/Newton.png" alt="drawing" width="250"/>
* **Least Square method**: When we have non square matrices. <br>
  &emsp; &emsp; &emsp; &emsp; <img src="https://github.com/ipmach/LinearSystems/blob/master/img/equations/LeastSquare.png" alt="drawing" width="250"/>   <br>
In our implementation we use a direct solver: <br>
  &emsp; &emsp; &emsp; &emsp; <img src="https://github.com/ipmach/LinearSystems/blob/master/img/equations/LeastSquare2.png" alt="drawing" width="200"/>
* Additive Schwarz method
* Trust regions method
* Multigrid with Gauss-Seidel and Jacobi


## Newton method visualization
![Graph](https://github.com/ipmach/LinearSystems/blob/master/img/plot1.png)

## Trust regions method visualization
![Graph](https://github.com/ipmach/LinearSystems/blob/master/img/plot2.png)

## Multigrid with Gauss-Seidel and Jacobi method visualization
![Graph](https://github.com/ipmach/LinearSystems/blob/master/img/plot3.png)
