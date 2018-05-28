; Auto-generated. Do not edit!


(cl:in-package qb_interface-msg)


;//! \htmlinclude cubeRef.msg.html

(cl:defclass <cubeRef> (roslisp-msg-protocol:ros-message)
  ((p_1
    :reader p_1
    :initarg :p_1
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (p_2
    :reader p_2
    :initarg :p_2
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass cubeRef (<cubeRef>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cubeRef>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cubeRef)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name qb_interface-msg:<cubeRef> is deprecated: use qb_interface-msg:cubeRef instead.")))

(cl:ensure-generic-function 'p_1-val :lambda-list '(m))
(cl:defmethod p_1-val ((m <cubeRef>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qb_interface-msg:p_1-val is deprecated.  Use qb_interface-msg:p_1 instead.")
  (p_1 m))

(cl:ensure-generic-function 'p_2-val :lambda-list '(m))
(cl:defmethod p_2-val ((m <cubeRef>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qb_interface-msg:p_2-val is deprecated.  Use qb_interface-msg:p_2 instead.")
  (p_2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cubeRef>) ostream)
  "Serializes a message object of type '<cubeRef>"
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cubeRef>) istream)
  "Deserializes a message object of type '<cubeRef>"
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cubeRef>)))
  "Returns string type for a message object of type '<cubeRef>"
  "qb_interface/cubeRef")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cubeRef)))
  "Returns string type for a message object of type 'cubeRef"
  "qb_interface/cubeRef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cubeRef>)))
  "Returns md5sum for a message object of type '<cubeRef>"
  "2a07e3d9114374aa42cee1ddbc2cc1ab")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cubeRef)))
  "Returns md5sum for a message object of type 'cubeRef"
  "2a07e3d9114374aa42cee1ddbc2cc1ab")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cubeRef>)))
  "Returns full string definition for message of type '<cubeRef>"
  (cl:format cl:nil "float32[] p_1~%float32[] p_2~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cubeRef)))
  "Returns full string definition for message of type 'cubeRef"
  (cl:format cl:nil "float32[] p_1~%float32[] p_2~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cubeRef>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'p_1) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'p_2) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cubeRef>))
  "Converts a ROS message object to a list"
  (cl:list 'cubeRef
    (cl:cons ':p_1 (p_1 msg))
    (cl:cons ':p_2 (p_2 msg))
))
