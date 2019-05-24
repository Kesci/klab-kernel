import sys
# Tensorflow
import tensorflow as tf
print(tf.__version__)
hello = tf.constant('TensorFlow ok')
sess = tf.Session()
print(sess.run(hello))
print("Tensorflow ok")

# Keras
from keras.models import Sequential
from keras.layers.core import Dense, Dropout, Activation, Flatten
from keras.layers.convolutional import Convolution2D, MaxPooling2D
from keras.optimizers import SGD
print("Keras ok")

# Numpy
import numpy as np
print("Numpy imported ok")
print("Numpy random numbers " + str(np.random.randint(100)))

# Numpy must be linked to the MKL. (Occasionally, a third-party package will muck up the installation
# and numpy will be reinstalled with an OpenBLAS backing.)
from numpy.distutils.system_info import get_info
# This will throw an exception if the MKL is not linked correctly.
get_info("blas_mkl")

import pandas as pd
print("Pandas imported ok")

from sklearn import datasets
print("sklearn imported ok")
iris = datasets.load_iris()
X, y = iris.data, iris.target

from sklearn.ensemble import RandomForestClassifier
rf1 = RandomForestClassifier()
rf1.fit(X,y)
print("sklearn RandomForestClassifier: ok")

from sklearn.linear_model import LinearRegression
boston = datasets.load_boston()
X, y = boston.data, boston.target
lr1 = LinearRegression()
lr1.fit(X,y)
print("sklearn LinearRegression: ok")

from xgboost import XGBClassifier
xgb1 = XGBClassifier(n_estimators=3)
xgb1.fit(X[0:70],y[0:70])
print("xgboost XGBClassifier: ok")

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
plt.title("中文")
plt.plot((1,2,3),(4,3,-1))
print("matplotlib.pyplot ok")

import plotly.plotly as py
import plotly.graph_objs as go
print("plotly ok")

import theano
print("Theano ok")

import nltk
from nltk.stem import WordNetLemmatizer
print("nltk ok")

import cv2
img = cv2.imread('plot.png',0)
print("OpenCV ok")


from skimage.io import imread
print("skimage ok")

import mxnet
import mxnet.gluon
print("mxnet ok")

import bokeh
print("bokeh ok")

import seaborn
print("seaborn ok")

import xlearn as xl
xl.hello()
print("xlearn ok")


import h5py
print("ht5py ok")

import gensim
print("gensim ok")

from hmmlearn import hmm
np.random.seed(42)

model = hmm.GaussianHMM(n_components=3, covariance_type="full")
model.startprob_ = np.array([0.6, 0.3, 0.1])
model.transmat_ = np.array([[0.7, 0.2, 0.1],
                            [0.3, 0.5, 0.2],
                            [0.3, 0.3, 0.4]])
model.means_ = np.array([[0.0, 0.0], [3.0, -3.0], [5.0, 10.0]])
model.covars_ = np.tile(np.identity(2), (3, 1, 1))
X, Z = model.sample(100)
print("hmmlearn ok")

import pystan
model_code = 'parameters {real y;} model {y ~ normal(0,1);}'
model = pystan.StanModel(model_code=model_code)  # this will take a minute
y = model.sampling(n_jobs=1).extract()['y']
print("pystan y mean", y.mean())

from fbprophet import Prophet
df = pd.read_csv('example_wp_peyton_manning.csv')
m = Prophet()
m.fit(df);
print("fbprophet ok")

import lxml
print("lxml ok")

import catboost
print("catboost ok")

import librosa
print("librosa ok")

import python_speech_features
print("python_seech_features ok")

import xlrd
print("xlrd ok")

import sympy
print("sympy ok")

import onnx
print("onnx ok")

import skimage
print("skimage ok")

import modin.pandas as modpd
import numpy as np

frame_data = np.random.randint(0, 100, size=(2**10, 2**8))
df = modpd.DataFrame(frame_data)
print("modin ok")

import wordbatch
from wordbatch.models import FTRL
from wordbatch.extractors import WordBag
wb= wordbatch.WordBatch(extractor=(WordBag, {"hash_ngrams":2, "hash_ngrams_weights":[0.5, -1.0], "hash_size":2**23, "norm":'l2', "tf":'log', "idf":50.0}))
clf= FTRL(alpha=1.0, beta=1.0, L1=0.00001, L2=1.0, D=2 ** 25, iters=1)

train_texts= ["Cut down a tree with a herring? It can't be done.", "Don't say that word.", "How can we not say the word if you don't tell us what it is?"]
train_labels= [1, 0, 1]
test_texts= ["Wait! I said it! I said it! Ooh! I said it again!"]

clf.fit(wb.transform(train_texts), train_labels)
preds= clf.predict(wb.transform(test_texts))
print("wordbatch ok")

import pyltr
print("pyltr ok")

from tqdm import tqdm
import time

text = ""
for char in tqdm(["a", "b", "c", "d"]):
    time.sleep(0.25)
    text = text + char
print("tqdm ok")

import autosklearn
print("autosklearn ok")
