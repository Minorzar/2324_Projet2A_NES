

# FPGA NES - Student Project

This repository contains a recreation of the NES console (EU edition) in **VHDL language**. We used **Quartus** for all of the VHDL part of the project, and uploaded it on the **DE1-SoC board RevC (Cyclone V)**. 
Also, this project have a PCB designed for the FPGA board to be able to connect with the NES cartridge. (Realised under KiCad 7.0+). 

## Notes : 6502 CPU

A part of this project replicates the 6502 CPU in VHDL language. Feel free to use whatever part of the code for your projects. 
> **Note:** We aim to create a repository which contains only the 6502. A link will be added to this repository when it will be done.

## Repository Structure

- **Hardware** : The PCB for the Cartridge adaptator. Use the V5 currently. Only the latest version of it will be available later. You still need to buy the cartridge lector himself online, because the PCB only replicate a part of the PCB of the NES.
- **Software** :  Contains the architecture in VHDL of the NES. Details later on the readme.
- **Datasheet** : Contains all the datasheets used for the project. All other data comes from the [NESdev wiki](https://www.nesdev.org/wiki/Nesdev_Wiki).

