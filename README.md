# Ice Skates Simulation

This project simulates the motion of ice skates on ice, taking into account physical principles. It enables visualization of motion trajectories as well as analysis of changes in speed and position over time.

## Requirements

* Julia 1.10.3  
* Plots

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/Weisjan/Ice-skates-simulation.git
   ```
2. Import the **Plots** library:
   ```julia
   import Pkg
   Pkg.add("Plots")
   ```
3. Run the project file in the Julia environment:
   ```julia
   include("lyzwy.jl")
   ```
4. Set appropriate parameters such as the skater’s mass, pushing force, acceleration, and simulation parameters.

## Files

| No | File Name    | Description                                               |
|----|--------------|-----------------------------------------------------------|
| 1  | lyzwy.jl      | Main file containing the simulation implementation        |
| 2  | Readme.md     | This README file                                          |

## Function Descriptions

* `stworz_elipse()`: Creates an ellipse based on the given parameters.  
* `nowe_wspolrzedne_1()`: Calculates new coordinates for the first skate at the next time step.  
* `nowe_wspolrzedne_2()`: Calculates new coordinates for the second skate at the next time step.  
* `przyspieszanie()`: Simulates the acceleration of the skates.

## Notes

- Default parameters may not reflect real-world values. They are approximations for the purpose of demonstrating the simulation.

## Author

[Jan Weis](https://github.com/Weisjan)
