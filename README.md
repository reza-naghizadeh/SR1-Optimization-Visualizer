# SR1 Optimization Visualizer

This repository contains a MATLAB implementation of the Symmetric Rank-One (SR1) optimization method to minimize a quadratic function. The program visualizes the optimization process on a contour plot and provides insights into the iterative update of the solution.

This code was developed as part of our Optimization course project at IASBS, in collaboration with my groupmate, [Erfan Faridi](https://github.com/erfanfaridii/).


## Features

- **Symmetric Rank-One (SR1) Update**: Implements the SR1 method for approximating the inverse Hessian matrix.
- **Contour Plot Visualization**: Displays the optimization path on a filled contour plot.
- **Customizable Parameters**: Allows adjustment of the learning rate and initial conditions.
- **Iteration Control**: Automatically stops when convergence criteria are met.

## Prerequisites

- MATLAB R2020b or later
- Symbolic Math Toolbox for gradient and Hessian calculations

## Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/SR1-Optimization-Visualizer.git
   ```
2. Open `SR1_Optimization.m` in MATLAB.
3. Run the script to visualize the optimization process.

## Key Components

- **Gradient Calculation**: Computes the gradient of the function using symbolic differentiation.
- **SR1 Update Rule**: Updates the inverse Hessian matrix based on the SR1 condition.
- **Visualization**: Plots the optimization path on a contour plot.

## Output

- Number of iterations
- Coordinates of the minimum point
- Final function value at the minimum point
- Optimization path overlaid on the contour plot

## Example

The function being minimized is:

\[
f(x_1, x_2) = 10x_1^2 - 4x_1x_2 + x_2^2
\]

The initial point is set to \([-2, 2.5]\), and the learning rate is configurable.
