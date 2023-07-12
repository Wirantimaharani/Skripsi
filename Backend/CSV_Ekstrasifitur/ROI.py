import cv2
image = cv2.imread('Data ke-35.jpg')

# Crop image to square
height, width, channel = image.shape

if height > width:
    crop_size = width
    y = int ((height-width)/2)
    x=0
else:
    crop_size = height
    x = int ((width - height)/2)
    y=0

cropped_image = image[y:y+crop_size, x:x+crop_size]

gray = cv2.cvtColor(cropped_image,cv2.COLOR_BGR2GRAY)
_, thresh = cv2.threshold(
    gray, 0, 255, cv2.THRESH_BINARY_INV+cv2.THRESH_OTSU
)
contours, _ = cv2.findContours(
    thresh, cv2.RETR_EXTERNAL, cv2. CHAIN_APPROX_SIMPLE
)
cnt = max(contours, key=cv2.contourArea)

x, y, w, h, =cv2.boundingRect(cnt)

roi = cropped_image [y:y+h, x:x+w]
    
resize_roi = cv2.resize(roi, (256, 256))
resize_raw = cv2.resize(cropped_image, (256, 256))

cv2.imshow("Cropped Imafge",resize_roi)
cv2.imshow("Cropped",resize_raw)
cv2.waitKey(0)
cv2.destroyAllWindows()