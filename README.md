# Optimal Compressive Temporal Imaging using a Shuffled Rolling Shutter

This repository contains the code to reproduce the results presented in the paper following paper:

*N. Diaz, F. Guzman and E. Vera, "Optimal Compressive Temporal Imaging using a Shuffled Rolling Shutter," in Optics Express.

This repository aims to design the coded apertures for rolling shutter video. The reconstruction is performed using the captured compressive projection using two methods, interpolation, and tensor compleition.

## Usage

This code was written using Matlab R2020b. It should be downloaded the RollingShutterCodedAperture repository
1. Download this repository via git 
```
git clone https://github.com/nelson10/RollingShutterCodedAperture.git
```
2. To run the code using either the function main_interpolation.m, main_tensor.m, main_tensor2.m, or main_real_measurements.m that performs the sensing, coded aperture design, and the reconstruction using the compressive rolling shutter measurements using two methods, interpolation, and tensor compleition.


## Datasets

The datasets could be download from the following [link](https://www.youtube.com/watch?v=LrzWrvOjJm8)

The files should be placed in the dataset folder of this repository.

If you use this code, please consider citing our paper with the following Bibtex code:

```
@ARTICLE{9534664,
  author={Diaz, Nelson and Guzman, Felipe and Vera, Esteban},
  journal={Optics Express}, 
  title={Shuffled Rolling Shutter for Snapshot Temporal Imaging}, 
  year={2021},
  volume={30},
  number={1},
  pages={1-1},
  doi={}}
```

The published version is available at this [link](https://www.osapublishing.org/oe/abstract.cfm?doi=10.1364/OE.444864)


## Abstract

We propose a modification to the rolling shutter mechanism found in CMOS detectors by shuffling the pixels in every scanline. This potential hardware modification improves the sampling of the space-time datacube allowing, the recovery of high-speed videos from a single image using either tensor completion methods or reconstruction algorithms often used for compressive temporal video. We also present a design methodology for optimal sampling schemes and compare them to random shuffling. Simulations, and experimental results obtained by optically emulating the hardware, demonstrate the ability of the shuffled rolling shutter to capture images that allow reconstructing videos, which would otherwise be impossible when using the traditional rolling shutter mechanism.
