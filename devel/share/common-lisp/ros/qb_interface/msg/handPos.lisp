; Auto-generated. Do not edit!


(cl:in-package qb_interface-msg)


;//! \htmlinclude handPos.msg.html

(cl:defclass <handPos> (roslisp-msg-protocol:ros-message)
  ((closure
    :reader closure
    :initarg :closure
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass handPos (<handPos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <handPos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'handPos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name qb_interface-msg:<handPos> is deprecated: use qb_interface-msg:handPos instead.")))

(cl:ensure-generic-function 'closure-val :lambda-list '(m))
(cl:defmethod closure-val ((m <handPos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qb_interface-msg:closure-val is deprecated.  Use qb_interface-msg:closure instead.")
  (closure m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <handPos>) ostream)
  "Serializes a message object of type '<handPos>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'closure))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'closure))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <handPos>) istream)
  "Deserializes a message object of type '<handPos>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'closure) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'closure)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<handPos>)))
  "Returns string type for a message object of type '<handPos>"
  "qb_interface/handPos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'handPos)))
  "Returns string type for a message object of type 'handPos"
  "qb_interface/handPos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<handPos>)))
  "Returns md5sum for a message object of type '<handPos>"
  "3d3fcdda7faa52ddfc5831b96497f9ca")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'handPos)))
  "Returns md5sum for a message object of type 'handPos"
  "3d3fcdda7faa52ddfc5831b96497f9ca")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<handPos>)))
  "Returns full string definition for message of type '<handPos>"
  (cl:format cl:nil "float32[] closure~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'handPos)))
  "Returns full string definition for message of type 'handPos"
  (cl:format cl:nil "float32[] closure~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <handPos>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'closure) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <handPos>))
  "Converts a ROS message object to a list"
  (cl:list 'handPos
    (cl:cons ':closure (closure msg))
))
