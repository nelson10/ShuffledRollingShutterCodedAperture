# Optimal Compressive Temporal Imaging using a Shuffled Rolling Shutter

This repository contains the code to reproduce the results presented in the paper following paper:

*E. Vera, F. Guzman and N. Diaz, "Shuffled Rolling Shutter for Snapshot Temporal Imaging," in Optics Express, 2021.

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
@article{Vera:22,
author = {Esteban Vera and Felipe Guzm\'{a}n and Nelson D\'{i}az},
journal = {Opt. Express},
keywords = {Compressive imaging; Computational imaging; Digital micromirror devices; Image sensors; Neural networks; Reconstruction algorithms},
number = {2},
pages = {887--901},
publisher = {OSA},
title = {Shuffled rolling shutter for snapshot temporal imaging},
volume = {30},
month = {Jan},
year = {2022},
url = {http://www.osapublishing.org/oe/abstract.cfm?URI=oe-30-2-887},
doi = {10.1364/OE.444864},
abstract = {We propose a modification to the rolling shutter mechanism found in CMOS detectors by shuffling the pixels in every scanline. This potential hardware modification improves the sampling of the space-time datacube, allowing the recovery of high-speed videos from a single image using either tensor completion methods or reconstruction algorithms often used for compressive temporal video. We also present a design methodology for optimal sampling schemes and compare them to random shuffling. Simulations, and experimental results obtained by optically emulating the hardware, demonstrate the ability of the shuffled rolling shutter to capture images that allow reconstructing videos, which would otherwise be impossible when using the traditional rolling shutter mechanism.},
}
```

The published version is available at this [link](https://www.osapublishing.org/oe/abstract.cfm?doi=10.1364/OE.444864)


## Abstract

We propose a modification to the rolling shutter mechanism found in CMOS detectors by shuffling the pixels in every scanline. This potential hardware modification improves the sampling of the space-time datacube allowing, the recovery of high-speed videos from a single image using either tensor completion methods or reconstruction algorithms often used for compressive temporal video. We also present a design methodology for optimal sampling schemes and compare them to random shuffling. Simulations, and experimental results obtained by optically emulating the hardware, demonstrate the ability of the shuffled rolling shutter to capture images that allow reconstructing videos, which would otherwise be impossible when using the traditional rolling shutter mechanism.
