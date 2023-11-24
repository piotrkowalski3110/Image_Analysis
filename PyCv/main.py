import cv2
import numpy as np
import matplotlib.pyplot as plt

all_arrays = np.array([[0, 0, 255, 255, 255, 0, 0],
                       [0, 255, 0, 0, 0, 255, 0],
                       [0, 255, 0, 0, 0, 255, 0],
                       [0, 255, 0, 0, 0, 255, 0],
                       [0, 0, 255, 0, 0, 255, 0],
                       [0, 0, 255, 255, 255, 255, 0],
                       [0, 0, 0, 0, 0, 0, 0]
                       ])

cv2.imshow("inpit", all_arrays)
cv2.waitKey(0)
cv2.destroyAllWindows()
