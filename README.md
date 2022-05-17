# Spheroid-segmentation
This repository contains the files used for the training of three different deep learning networks (UNet, HRNet, and DeepLabv3+) for the segmentation of droplet encapsulated spheroids. FastAI and SemTorch libraries were used.

**DeepLabv3+-augmentation**
Contains the code used for retraining DeepLabv3+ using augmentation and batch normalization strategies. SemTorch library was used 

**UNet-augmentation**
Contains the code used for retraining the UNet network using augmentation and batch normalization strategies (FastAI)

**HRNet-augmentation** 
Contains the code used for retraining HRNet using augmentation and batch normalization strategies. The SemTorch library allows for different network's depth

**Spheroid segmentation** 
For the utilization of a specific model in the automated production of binary masks on droplet-encapsulated spheroids. The conditions employed for model's training are needed (network, weight decay, loss function, etc... )

**Mask_metric_analysis.m**
This MatLab code measures the area, perimeter, circularity, and distances to the center of the droplet of the spheroid. A directory containing binary masks of the spheroids has to be provided. The output is a table with the Droplet ID and the calculated metrics mentioned. 

**Merge_classification&mask_information.m**
Simple MatLab code to merge the csv files of the spheroid classification and the mask metrics. Both have to share the DropletID. It includes some additional calculations (mean, SD, mode, etc...) for each of the mask metrics by spheroid/ensemble group. 
