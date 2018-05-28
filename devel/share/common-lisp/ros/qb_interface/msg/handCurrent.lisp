; Auto-generated. Do not edit!


(cl:in-package qb_interface-msg)


;//! \htmlinclude handCurrent.msg.html

(cl:defclass <handCurrent> (roslisp-msg-protocol:ros-message)
  ((current
    :reader current
    :initarg :current
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass handCurrent (<handCurrent>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <handCurrent>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'handCurrent)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name qb_interface-msg:<handCurrent> is deprecated: use qb_interface-msg:handCurrent instead.")))

(cl:ensure-generic-function 'current-val :lambda-list '(m))
(cl:defmethod current-val ((m <handCurrent>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qb_interface-msg:current-val is deprecated.  Use qb_interface-msg:current instead.")
  (current m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <handCurrent>) ostream)
  "Serializes a message object of type '<handCurrent>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'current))))
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
   (cl:slot-value msg 'current))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <handCurrent>) istream)
  "Deserializes a message object of type '<handCurrent>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'current) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'current)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<handCurrent>)))
  "Returns string type for a message object of type '<handCurrent>"
  "qb_interface/handCurrent")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'handCurrent)))
  "Returns string type for a message object of type 'handCurrent"
  "qb_interface/handCurrent")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<handCurrent>)))
  "Returns md5sum for a message object of type '<handCurrent>"
  "d976b449f93ed52a0958824b07438fab")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'handCurrent)))
  "Returns md5sum for a message object of type 'handCurrent"
  "d976b449f93ed52a0958824b07438fab")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<handCurrent>)))
  "Returns full string definition for message of type '<handCurrent>"
  (cl:format cl:nil "int32[] current~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'handCurrent)))
  "Returns full string definition for message of type 'handCurrent"
  (cl:format cl:nil "int32[] current~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <handCurrent>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'current) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <handCurrent>))
  "Converts a ROS message object to a list"
  (cl:list 'handCurrent
    (cl:cons ':current (current msg))
))
