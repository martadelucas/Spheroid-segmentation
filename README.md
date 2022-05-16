# Spheroid-segmentation
This repository contains the files used for the training of three different deep learning networks (UNet, HRNet and DeepLabv3+) for the segmentation of droplet encapsulated spheroids. FastAI and SemTorch library were used

**DeepLabv3+-augmentation**
Contains the code used for retraining DeepLabv3+ using augmentation and batch normalization strategies. SemTorch library was used 

**UNet-augmentation**
Contains the code used for retraining UNet network using augmentation and batch normalization strategies (FastAI)

**HRNet-augmentation** 
Contains the code used for retraining HRNet using augmentation and batch normalization strategies. The SemTorch library allows for different network's depth

**Spheroid segmentation** 
For the utilization of an specifc model for the automated production of binary masks on droplet-encapsulated spheroids. The conditions under the model was trained are needed (network, weigth decay, loss function etc... )
