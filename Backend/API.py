from flask import Flask, request, jsonify
import cv2
import numpy as np 
import pandas as pd
import joblib
import os 
from skimage.feature import greycomatrix, greycoprops
from werkzeug.utils import secure_filename
import time


app = Flask(__name__)

if not os.path.exists('uploads'):
    os.makedirs('uploads')

nb = joblib.load('KNN_satu.pkl')

def preprocess_and_extract_features (image):
    height, width,channels = image.shape 
    if height > width:
        crop_size = width
        y = int((height-width)/2)
        x = 0
    else:
        crop_size = height
        x = int ((width - height)/2)
        y=0
    cropped_image = image[y:y+crop_size, x:x+crop_size]

    #resize image 
    resized_image = cv2.resize(cropped_image,(1080,1080))

    #convert image to rgb
    rgb_image= cv2.cvtColor(resized_image, cv2.COLOR_BGR2RGB)

    #rata rata rgb
    r_mean = np.mean(rgb_image[:,:,0])
    g_mean = np.mean(rgb_image[:,:,1])
    b_mean = np.mean(rgb_image[:,:,2])
    
    glcm_properties = ['correlation', 'contrast', 'homogeneity','dissimilarity',]

    image_gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    glcm = greycomatrix(image_gray, distances=[5], angles=[0, np.pi/4, np.pi/2, 3*np.pi/4],
                                levels=256, symmetric=True, normed=True)

    feature =[]
    glcm_props = [propery for name in glcm_properties for propery in greycoprops(glcm, name)[0]]
    
    for item in glcm_props:
        feature.append(item)

    #create feature array 
    x= np.array([r_mean,g_mean,b_mean] + feature[:])

    return x

@app.route('/')
def home ():
    return 'Welcomee to ORISGrape!!'

@app.route('/klasifikasi', methods=['POST'])
def classify():
    #mendapatkan file dari req API
    image_file = request.files['image']
    
    #menyimpan gambar ke folder upload
    timestr = time.strftime("%Y%m%d-%H%M%S")
    filename = timestr + ".jpg"
    image_path = os.path.join('uploads', filename)
    image_file.save(image_path)
    
    image = cv2.imread(image_path)
    #melakukan pre processing dan ekstrasi fitur
    X= preprocess_and_extract_features(image)

    #mengubah bentuk array
    X_reshaped = X.reshape(1,-1)

    #Membuat dataframe menggu nama fitur 
    glcm_properties = ['correlation', 'contrast', 'homogeneity','dissimilarity',]
    angles=[0,45,90,135]
    
    feature_names = ['R','G','B'] + [f'{prop} {angle}' for prop in glcm_properties for angle in angles]
    x_new = pd.DataFrame(data=X_reshaped, columns=feature_names)

    #predict label
    y_pred = nb.predict(x_new)

    #hasil
    result = int(y_pred[0])

    return jsonify ({'Label':result})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
