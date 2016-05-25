# -*- coding: utf-8 -*-

import urllib2 as urllib
import numpy as np
import cv2


def load_image_url(url):
    resp = urllib.urlopen(url)
    buf = resp.read()
    return buf


def load_image_file(filename):
    image = cv2.imdecode(filename, cv2.IMREAD_COLOR)
    return image

def get_photo_sizes():
    return [
        [160, 160],
        [320, 320],
        [640, 640],
        [1060, 1060],
        [1280, 1280]
    ]
def show(buf):
    # print buf
    # x = cv2.imdecode(image, cv2.IMREAD_COLOR)
    # d = cv2.cvtColor(c, cv2.COLOR_RGB2BGR)
    np_ndarray = np.fromstring(buf, dtype=np.uint8)
    x = cv2.imdecode(np_ndarray, cv2.IMREAD_UNCHANGED)
    return cv2.imshow('NBA Image', x)

def write(buf):
    nparray = np.fromstring(buf, dtype=np.uint8)
    img = cv2.imdecode(nparray, cv2.IMREAD_UNCHANGED)
    return cv2.imwrite('/tmp/imwrite.png', img)

# def get_dimension():
#     url = 'http://img1.gtimg.com/16/1601/160106/16010642_1200x1000_0.jpg'
#     resp = urllib.urlopen(url)
#     buf = resp.read()
#     x = np.fromstring(buf, dtype=np.uint8)
#     img = cv2.imdecode(x, cv2.IMREAD_UNCHANGED)
#     # height = np.size(img, 0)
#     # width = np.size(img, 1)
#     height, width = image.shape[:2]
#     return (width, height)

def get_dimension(buffer):
    # 把原始的二进制图片数据转换为NpArray
    nparray = np.fromstring(buffer, dtype=np.uint8)
    # 把 nparray 转换为 opencv 的图像格式
    image = cv2.imdecode(nparray, cv2.IMREAD_UNCHANGED)
    height, width = image.shape[:2]
    return (width, height)

def convert_color():
    url = 'http://ww3.sinaimg.cn/mw690/6941baebgw1epzcuv9vmxj20me0hy0u1.jpg'
    resp = urllib.urlopen(url)
    buf = resp.read()
    x = np.fromstring(buf, dtype=np.uint8)
    img = cv2.imdecode(x, cv2.IMREAD_UNCHANGED)

if __name__ == '__main__':
    get_dimension()
