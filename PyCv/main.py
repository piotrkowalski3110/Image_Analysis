import cv2

A = cv2.imread('./DIBCO/H12.png')



# HSV_Image = cv2.cvtColor(A, cv2.COLOR_BGR2HLS)
# HSV_Gray = HSV_Image[:, :, 1]
#
# HSV_Niblack = cv2.ximgproc.niBlackThreshold(HSV_Gray, 255, cv2.THRESH_BINARY, 199, -0.2, binarizationMethod=cv2.ximgproc.BINARIZATION_NIBLACK)
#
# cv2.imshow("A", HSV_Niblack)
# cv2.waitKey(0)
# cv2.destroyAllWindows()