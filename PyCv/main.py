import cv2
import matplotlib.pyplot as plt
import numpy as np

IMG = cv2.imread("E09.bmp")

kernel = np.ones((3, 3), np.uint8)

base = IMG.copy()
[dx, dy, dz] = base.shape

operator = base.copy()
operator[1:dx-1, 1:dy-1] = 0

while True:
    oldOperator = operator.copy()
    operator = cv2.dilate(operator, kernel, iterations=1)
    operator = cv2.bitwise_and(operator, base)

    if(np.array_equal(operator, oldOperator)):
        break

cv2.imshow("Result", operator)
cv2.imshow("Base", IMG)
cv2.waitKey(0)
cv2.destroyAllWindows()