import cv2
from os import walk
from os.path import join
import numpy as np 

width, height = 1080, 1920
a = 0
b = 0
c = 0
d = 0

for root, dirs, files in walk("Support/DataRaw/Testing/Layak/"):
    if files:
        for file in files:
            a = a+1
            img = cv2.imread(join(root, file))
            gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
            _, thresh = cv2.threshold(
                gray, 0, 255, cv2.THRESH_BINARY_INV+cv2.THRESH_OTSU
            )
            contours, _ = cv2.findContours(
                thresh, cv2.RETR_EXTERNAL, cv2. CHAIN_APPROX_SIMPLE
            )
            cnt = max(contours, key=cv2.contourArea)

            x, y, w, h, =cv2.boundingRect(cnt)

            roi = img [y:y+h, x:x+w]

            resize_roi = cv2.resize(roi, (1080, 1080))

            cv2.imwrite("Support/Testing/Layak/"+"Data ke-" +  str(a)+".jpg", resize_roi)

for root, dirs, files in walk("Support/DataRaw/Testing/Tidak Layak/"):
    if files:
        for file in files:
            b = b+1
            img = cv2.imread(join(root, file))
            gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
            _, thresh = cv2.threshold(
                gray, 0, 255, cv2.THRESH_BINARY_INV+cv2.THRESH_OTSU
            )
            contours, _ = cv2.findContours(
                thresh, cv2.RETR_EXTERNAL, cv2. CHAIN_APPROX_SIMPLE
            )
            cnt = max(contours, key=cv2.contourArea)

            x, y, w, h, =cv2.boundingRect(cnt)

            roi = img [y:y+h, x:x+w]

            resize_roi = cv2.resize(roi, (1080, 1080))

            cv2.imwrite("Support/Testing/Tidak Layak/"+"Data ke-" +  str(b)+".jpg", resize_roi)

for root, dirs, files in walk("Support/DataRaw/Training/Layak/"):
    if files:
        for file in files:
            c = c+1
            img = cv2.imread(join(root, file))
            gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
            _, thresh = cv2.threshold(
                gray, 0, 255, cv2.THRESH_BINARY_INV+cv2.THRESH_OTSU
            )
            contours, _ = cv2.findContours(
                thresh, cv2.RETR_EXTERNAL, cv2. CHAIN_APPROX_SIMPLE
            )
            cnt = max(contours, key=cv2.contourArea)

            x, y, w, h, =cv2.boundingRect(cnt)

            roi = img [y:y+h, x:x+w]

            resize_roi = cv2.resize(roi, (1080, 1080))

            cv2.imwrite("Support/Training/Layak/"+"Data ke-" +  str(c)+".jpg", resize_roi)

for root, dirs, files in walk("Support/DataRaw/Training/Tidak Layak/"):
    if files:
        for file in files:
            d = d+1
            img = cv2.imread(join(root, file))
            gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
            _, thresh = cv2.threshold(
                gray, 0, 255, cv2.THRESH_BINARY_INV+cv2.THRESH_OTSU
            )
            contours, _ = cv2.findContours(
                thresh, cv2.RETR_EXTERNAL, cv2. CHAIN_APPROX_SIMPLE
            )
            cnt = max(contours, key=cv2.contourArea)

            x, y, w, h, =cv2.boundingRect(cnt)

            roi = img [y:y+h, x:x+w]

            resize_roi = cv2.resize(roi, (1080, 1080))

            cv2.imwrite("Support/Training/Tidak Layak/"+"Data ke-" +  str(d)+".jpg", resize_roi)

