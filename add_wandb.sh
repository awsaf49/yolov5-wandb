#!/bin/bash

# Path for upstream repo
if [ $# -eq 0 ]; then
  echo "Please provide the cloned yolov5 repo path as an argument."
  exit 1
fi
original_repo=$1

# Clone yolov5-wandb repo
git clone https://github.com/awsaf49/yolov5-wandb.git /tmp/yolov5-wandb
cd $original_repo

# Merge wandb in yolov5
git config user.email "you@example.com"
git config user.name "Your Name"
git remote add yolov5-wandb /tmp/yolov5-wandb
git fetch yolov5-wandb
git merge yolov5-wandb/master -m "add: wandb"
git remote remove yolov5-wandb
rm -rf /tmp/yolov5-wandb
echo "WandB is integrated successfully in YOLOv5"