import cv2 

webcam = cv2.VideoCapture(-1)
check, frame = webcam.read()
cv2.imwrite(filename='capture.jpg', img=frame)
webcam.release()
