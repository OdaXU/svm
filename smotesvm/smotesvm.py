#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Nov 13 09:04:45 2019

@author: Oda
"""

from collections import Counter
from imblearn.over_sampling import SVMSMOTE
from scipy.io import loadmat
from scipy.io import savemat
import numpy as np
from sklearn.svm import SVC
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import GridSearchCV, train_test_split
import pandas as pd
import csv


loadPath = '/Users/Oda/Desktop/dataset/imb_IRlowerThan9/ecoli-0_vs_1/'
name = 'ecoli-0_vs_1'
file = csv.reader(open(loadPath+name+'.csv','r'))
next(file, None)
data = []
for i in file:
    data.append(i)

train_1 = []
test_1 = []

train_2 = []
test_2 = []

train_3 = []
test_3 = []

train_4 = []
test_4 = []

train_5 = []
test_5 = []

train_arr = [train_1,train_2,train_3,train_4,train_5]
test_arr = [test_1,test_2,test_3,test_4,test_5]

x_data=[]
y_data=[]
for i in data:
    for l in range(len(i)):
        i[l] = float(i[l])
    x_data.append(np.array(i[1:]))
    y_data.append(np.array(np.array(i[0])))


sm = SVMSMOTE(random_state=1)
x_data,y_data = sm.fit_resample(x_data,y_data)

y_data = y_data.reshape([len(y_data),1])
    

test_num = int(len(x_data)*0.2)
for i in range(1):
    result = {}
    id = 1
    x_data_train = x_data
    y_data_train = y_data
    x_data_test = np.zeros([1,len(x_data_train[0])])
    y_data_test = np.zeros([1,len(x_data_train[0])])
    delPoint = test_num*i
    print(x_data_train[0])
    print(x_data_test.shape)
    print(x_data_train.shape)
    x_data_test = np.append(x_data_test,x_data_train[0],0)
    print(x_data_test)
    '''
    #删除
    for _ in range(test_num):
        x_data_test = np.append(x_data_test,x_data_train[delPoint],0)
        y_data_test = np.append(y_data_test,y_data_train[delPoint],0)
        x_data_train = np.delete(x_data,delPoint,0)
        y_data_train = np.delete(y_data,delPoint,0)
    print(x_data_test[0])
    
    y_data_tmp = y_data_tmp.reshape(1,len(y_data_tmp))
    y_x = np.append(y_data,x_data,axis=1)
    
    for l in y_x:
        result[str(id)] = l
        id += 1
    print(result['1'])
    
    csv_file = open('/smotedata/'+name+'-'+str(i)+'.csv', 'w', newline='')
    writer = csv.writer(csv_file)
    for row in y_x:
        writer.writerow(row)
    csv_file.close()
'''





