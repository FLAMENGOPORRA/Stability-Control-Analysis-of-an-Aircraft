# Stability-Analysis-of-an-Aircraft
This repository contains code developed for the Stability Control Analysis of a D18 Beechcraft aircraft. 
Note: The Datcom manual was extensively used as a reference for the necessary graphs and data.
Topics Covered:

<details>
##  <summary> 1. Planform Geometric Parameterization</summary>
  Objective: Determine the aircraft's basic physical geometry, such as the theoretical wing area or the span of the aircraft. 

  Details: The PlanformParameterization object in the code is designed specifically for lifting surfaces like wings or horizontal tails (HT).
![](Imgs/PlanformParameters.PNG)
### Fig 1. Datcom Manual page 2.2.2-1
</details>

<details>
<summary>2. Planform Aerodynamic Parameterization </summary>

Objective: Apply aerodynamic parameterization to all planforms, including but not limited to HT, Vertical Tails (VT), Canards, etc.   

Details: The code adjusts 2D (lower-case subscripts) aerodynamic parameters to 3D (upper-case subscripts). Experimental data, such as the lift curve slope, the coefficient of moment about the aerodynamic center, the zero lift angle of attack, and the aerodynamic center, were obtained from "Theories of Wing Sections" by Abbot and Von Doenhoff or the Datcom Manual. Afterwards twist, compressibility, sweep, and aspect ratio were taken into account to shift parameters from 2D to 3D.
![](Imgs/Aero2dto3d.PNG)

### Fig 2. Perkins and Hage, S&C Text Book page 23 
</details>

<details>
   <summary>3. Actual Downwash Gradient Calculation </summary>
Objective: Calculate the actual downwash gradient (dϵ/dα) on an aircraft.

Details: This calculation uses the aerodynamic and geometric parameters of the wing and horizontal tail to determine the downwash effect experienced by the tail due to the wing's presence. It considers the incidence angles of both the wing and the tail to provide an accurate representation of the downwash effect based on the aircraft's geometry. 
![](Imgs/Downwash.PNG)


### Fig 3. Perkins and Hage, S&C Text Book page 215
</details>

<details>
  <summary>4. Multhopp's Method vs Gilruth and White's Method</summary>
Objective: To determine the change in nose up pitching momement of with angle of attack as a coefficient (C<sub>mαf</sub>). The goal was to obtain a C<sub>mαf</sub> of -0.01 representing the aircraft has 10% stability.

Details: Multhopp's method is preffered over Munk's since it takes into account the upwash (destabalizing) and downwash (stabalizing). It was comapred against Gilruth and White's method which also takes into account the upwash and down wash but doesn't take into account its affect on the fuselage. Multhopp's method can also be applied to engine naccels whilst the others can't.
![](Imgs/Multhopps.PNG)

### Fig 4. Perkins and Hage, S&C Text Book page 227
</details>
