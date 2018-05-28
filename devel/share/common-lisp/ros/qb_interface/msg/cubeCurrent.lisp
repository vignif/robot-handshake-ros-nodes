; Auto-generated. Do not edit!


(cl:in-package qb_interface-msg)


;//! \htmlinclude cubeCurrent.msg.html

(cl:defclass <cubeCurrent> (roslisp-msg-protocol:ros-message)
  ((current_m1
    :reader current_m1
    :initarg :current_m1
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (current_m2
    :reader current_m2
    :initarg :current_m2
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass cubeCurrent (<cubeCurrent>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cubeCurrent>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cubeCurrent)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name qb_interface-msg:<cubeCurrent> is deprecated: use qb_interface-msg:cubeCurrent instead.")))

(cl:ensure-generic-function 'current_m1-val :lambda-list '(m))
(cl:defmethod current_m1-val ((m <cubeCurrent>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qb_interface-msg:current_m1-val is deprecated.  Use qb_interface-msg:current_m1 instead.")
  (current_m1 m))

(cl:ensure-generic-function 'current_m2-val :lambda-list '(m))
(cl:defmethod current_m2-val ((m <cubeCurrent>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qb_interface-msg:current_m2-val is deprecated.  Use qb_interface-msg:current_m2 instead.")
  (current_m2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cubeCurrent>) ostream)
  "Serializes a message object of type '<cubeCurrent>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'current_m1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'current_m1))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'current_m2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'current_m2))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cubeCurrent>) istream)
  "Deserializes a message object of type '<cubeCurrent>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'current_m1) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'current_m1)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'current_m2) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'current_m2)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cubeCurrent>)))
  "Returns string type for a message object of type '<cubeCurrent>"
  "qb_interface/cubeCurrent")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cubeCurrent)))
  "Returns string type for a message object of type 'cubeCurrent"
  "qb_interface/cubeCurrent")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cubeCurrent>)))
  "Returns md5sum for a message object of type '<cubeCurrent>"
  "2eef53e05b04751a24e5c83cddf11cef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cubeCurrent)))
  "Returns md5sum for a message object of type 'cubeCurrent"
  "2eef53e05b04751a24e5c83cddf11cef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cubeCurrent>)))
  "Returns full string definition for message of type '<cubeCurrent>"
  (cl:format cl:nil "int32[] current_m1~%int32[] current_m2~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cubeCurrent)))
  "Returns full string definition for message of type 'cubeCurrent"
  (cl:format cl:nil "int32[] current_m1~%int32[] current_m2~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cubeCurrent>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'current_m1) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'current_m2) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cubeCurrent>))
  "Converts a ROS message object to a list"
  (cl:list 'cubeCurrent
    (cl:cons ':current_m1 (current_m1 msg))
    (cl:cons ':current_m2 (current_m2 msg))
))
