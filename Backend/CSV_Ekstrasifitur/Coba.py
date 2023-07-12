import numpy as np
import matplotlib.pyplot as plt

# Load citra grayscale
image_gray = plt.imread('../cobaa.jpg')

# Tampilkan matriks grayscale
plt.imshow(image_gray, cmap='gray')
plt.colorbar()
plt.show()

# Tampilkan nilai piksel dalam bentuk matriks
print("Matrix Grayscale:")
print(image_gray)
