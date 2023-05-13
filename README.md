# Inverted_Pendulum_Control
(See full mathematics derivation:
[Practice Problem 5 Presentation.pdf](https://github.com/komxun/Inverted_Pendulum_Control/files/11444416/Practice.Problem.5.Presentation.pdf))

Simulating and controlling 2D inverted pendulum with pole-placement method in MATLAB

# Problem Statement
![image](https://github.com/komxun/Inverted_Pendulum_Control/assets/133139057/4020e4ab-f28f-4470-846b-513eefa7e3ec)

# Finding the Equation of Motion
Define the axes with position direction as follow: 
| ![image](https://github.com/komxun/2D-Inverted-Pendulum-Control/assets/133139057/cf8c254c-4440-4a94-b4f3-11a75605912d) |
|:--:|
|*Free-body diagram*|

Assuming the rod has uniformly distributed mass, hence the center of gravity $CG(x_m, y_m)$ is located at the middle of the rod, which can be 
expressed as follow:

$$\eqalign{
x\_m &= x + l\sin\theta \\
y\_m &= l\cos\theta
}$$

The time derivation can be obtained as

$$\eqalign{
\dot{x}\_m &= \dot{x} + l\dot{\theta}\cos\theta \\
\dot{y}\_m &= -l\dot{\theta}\sin\theta
}$$

## The Lagrangian Method
One of the most efficient ways to find the equation of motion of mechanical system is the Lagrangian method.
To use the Lagrangian method the total Kinetic energy ($T$), the total Potential energy ($P$), the conservative force ($Q^{nc}$), 
and the nonconservative force ($Q^{c}$) must be identified

### Total Kinetic Energy
$$\eqalign{
T &= T_{wheel} + T_{rod} \\
  &= \left( {1\over2}M\dot{x}^2 \right) + \left( {1\over2}m\left( \dot{x}\_m^2 + \dot{y}\_m^2\right) \right)
}$$

# Results 

## Free fall response
https://github.com/komxun/Inverted_Pendulum_Control/assets/133139057/f12fa547-6753-4dce-be5e-87ecac275c61



![wheelpend_freefall_graph](https://github.com/komxun/Inverted_Pendulum_Control/assets/133139057/822be049-c959-4620-909b-fb500d5697e1)

## Pole placement - eigen values placed at [-1.3 -1.4 -1.5 -1.6]

https://github.com/komxun/Inverted_Pendulum_Control/assets/133139057/99e0a034-a6de-4c16-b331-7b28a00044e1

![wheelpend_control_slow_graph](https://github.com/komxun/Inverted_Pendulum_Control/assets/133139057/b252120b-b16f-4fc1-8068-22f26ed5c2df)

## Pole placement - eigen values placed at [-2 -2.1 -2.2 -2.3]

https://github.com/komxun/Inverted_Pendulum_Control/assets/133139057/13708ee3-f64e-46b2-a327-24a8883553cc

![wheelpend_control_medium_graph](https://github.com/komxun/Inverted_Pendulum_Control/assets/133139057/29fcf35d-ccc5-4d11-95a3-cb9219816f5d)

## Pole placement - eigen values placed at [-3 -3.1 -3.2 -3.3]

https://github.com/komxun/Inverted_Pendulum_Control/assets/133139057/864559cc-e5f7-4716-a7e7-b8658c53e7f3

![wheelpend_control_fast_graph](https://github.com/komxun/Inverted_Pendulum_Control/assets/133139057/b3d24f9b-5f7d-4033-8214-334a9f3bf520)



# References
[1] Steve Brunton. (2017, January 29). _Inverted Pendulum on a Cart [Control Bootcamp]_. Youtube https://youtu.be/qjhAAQexzLg

[2] Steve Brunton. (2017, January 29). _Pole Placement for the Inverted Pendulum on a Cart [Control Bootcamp]_. Youtube https://youtu.be/M_jchYsTZvM
