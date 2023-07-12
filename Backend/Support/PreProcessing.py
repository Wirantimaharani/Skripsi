import cv2
from os import walk
from os.path import join

width, height = 1080, 1920
a = 0
b = 0

for root, dirs, files in walk("Layak/"):
    if files:
        for file in files:
            a = a+1
            img = cv2.imread(join(root, file))
            #img = img[0:4096, 384:2688]
            img = cv2.resize(img, (width, height),
                             interpolation=cv2.INTER_AREA)
            img = img[420:1500, 0:1080]
            cv2.imwrite("HasilPreProcessing/Layak/"+"Data ke-" +  str(a)+".jpg", img)

for root, dirs, files in walk("Tidak Layak/"):
    if files:
        for file in files:
            b = b+1
            img = cv2.imread(join(root, file))
            img = cv2.resize(img, (width, height),
                             interpolation=cv2.INTER_AREA)
            img = img[420:1500, 0:1080]
            cv2.imwrite("HasilPreProcessing/Tidak Layak/"+"Data ke-" + str(b)+".jpg", img)

#================================================================================================
# path_data = "contoh.jpg"
# img = cv2.imread(path_data)
# imgPreCropped = img[0:4096, 384:2688]

# imgResize = cv2.resize(imgPreCropped, (width, height))

# imgCropped = imgResize[420:1500, 0:1080]

# cv2.imshow("Rare", img)
# cv2.imshow("Resize", imgResize)
# cv2.imshow("Cropped", imgCropped)
# cv2.imwrite("hasil contoh.jpg", imgCropped)
# print(imgCropped.shape)

# cv2.waitKey(0)
