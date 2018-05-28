; Auto-generated. Do not edit!


(cl:in-package qb_interface-msg)


;//! \htmlinclude cubePos.msg.html

(cl:defclass <cubePos> (roslisp-msg-protocol:ros-message)
  ((p_1
    :reader p_1
    :initarg :p_1
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (p_2
    :reader p_2
    :initarg :p_2
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (p_L
    :reader p_L
    :initarg :p_L
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass cubePos (<cubePos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cubePos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cubePos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name qb_interface-msg:<cubePos> is deprecated: use qb_interface-msg:cubePos instead.")))

(cl:ensure-generic-function 'p_1-val :lambda-list '(m))
(cl:defmethod p_1-val ((m <cubePos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qb_interface-msg:p_1-val is deprecated.  Use qb_interface-msg:p_1 instead.")
  (p_1 m))

(cl:ensure-generic-function 'p_2-val :lambda-list '(m))
(cl:defmethod p_2-val ((m <cubePos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qb_interface-msg:p_2-val is deprecated.  Use qb_interface-msg:p_2 instead.")
  (p_2 m))

(cl:ensure-generic-function 'p_L-val :lambda-list '(m))
(cl:defmethod p_L-val ((m <cubePos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qb_interface-msg:p_L-val is deprecated.  Use qb_interface-msg:p_L instead.")
  (p_L m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cubePos>) ostream)
  "Serializes a message object of type '<cubePos>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'p_1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'p_1))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'p_2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'p_2))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'p_L))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'p_L))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cubePos>) istream)
  "Deserializes a message object of type '<cubePos>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'p_1) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'p_1)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'p_2) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'p_2)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'p_L) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'p_L)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cubePos>)))
  "Returns string type for a message object of type '<cubePos>"
  "qb_interface/cubePos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cubePos)))
  "Returns string type for a message object of type 'cubePos"
  "qb_interface/cubePos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cubePos>)))
  "Returns md5sum for a message object of type '<cubePos>"
  "a02b665022ec76721e512ea8351a945c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cubePos)))
  "Returns md5sum for a message object of type 'cubePos"
  "a02b665022ec76721e512ea8351a945c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cubePos>)))
  "Returns full string definition for message of type '<cubePos>"
  (cl:format cl:nil "float32[] p_1~%float32[] p_2~%float32[] p_L~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cubePos)))
  "Returns full string definition for message of type 'cubePos"
  (cl:format cl:nil "float32[] p_1~%float32[] p_2~%float32[] p_L~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cubePos>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'p_1) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'p_2) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'p_L) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cubePos>))
  "Converts a ROS message object to a list"
  (cl:list 'cubePos
    (cl:cons ':p_1 (p_1 msg))
    (cl:cons ':p_2 (p_2 msg))
    (cl:cons ':p_L (p_L msg))
))
