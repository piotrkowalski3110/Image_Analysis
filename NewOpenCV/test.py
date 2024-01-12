import cv2
import numpy as np
import matplotlib.pyplot as plt
import skimage

src = cv2.imread("Images/Wyklad_Img.bmp")
gray = cv2.cvtColor(src, cv2.COLOR_BGR2GRAY)
ret,thresh = cv2.threshold(gray,150,255,0)
contours, _ = cv2.findContours(thresh, cv2.RETR_TREE,cv2.CHAIN_APPROX_SIMPLE)
for i in contours:
    cnt = i
    hull = cv2.convexHull(cnt)
    cv2.drawContours(src, [hull], -1, (0,255,255), 3)
cv2.imshow("Convex Hull", src)
cv2.waitKey(0)
cv2.destroyAllWindows()