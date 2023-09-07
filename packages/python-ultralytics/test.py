#!/usr/bin/env python3
print('testing ultralytics...')
import ultralytics
from ultralytics import YOLO

print('ultralytics version: ' + str(ultralytics.__version__))
print('Instantiating test model...')
model = YOLO('yolov8n.pt')
results = model('https://ultralytics.com/images/bus.jpg')

print('ultralytics OK\n')
