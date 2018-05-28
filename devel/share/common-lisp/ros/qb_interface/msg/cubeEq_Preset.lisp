; Auto-generated. Do not edit!


(cl:in-package qb_interface-msg)


;//! \htmlinclude cubeEq_Preset.msg.html

(cl:defclass <cubeEq_Preset> (roslisp-msg-protocol:ros-message)
  ((eq
    :reader eq
    :initarg :eq
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (preset
    :reader preset
    :initarg :preset
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass cubeEq_Preset (<cubeEq_Preset>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cubeEq_Preset>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cubeEq_Preset)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name qb_interface-msg:<cubeEq_Preset> is deprecated: use qb_interface-msg:cubeEq_Preset instead.")))

(cl:ensure-generic-function 'eq-val :lambda-list '(m))
(cl:defmethod eq-val ((m <cubeEq_Preset>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qb_interface-msg:eq-val is deprecated.  Use qb_interface-msg:eq instead.")
  (eq m))

(cl:ensure-generic-function 'preset-val :lambda-list '(m))
(cl:defmethod preset-val ((m <cubeEq_Preset>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qb_interface-msg:preset-val is deprecated.  Use qb_interface-msg:preset instead.")
  (preset m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cubeEq_Preset>) ostream)
  "Serializes a message object of type '<cubeEq_Preset>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'eq))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'eq))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'preset))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'preset))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cubeEq_Preset>) istream)
  "Deserializes a message object of type '<cubeEq_Preset>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'eq) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'eq)))
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
  (cl:setf (cl:slot-value msg 'preset) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'preset)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cubeEq_Preset>)))
  "Returns string type for a message object of type '<cubeEq_Preset>"
  "qb_interface/cubeEq_Preset")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cubeEq_Preset)))
  "Returns string type for a message object of type 'cubeEq_Preset"
  "qb_interface/cubeEq_Preset")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cubeEq_Preset>)))
  "Returns md5sum for a message object of type '<cubeEq_Preset>"
  "70c9b6b7a00b0977bdadaa889ac3c537")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cubeEq_Preset)))
  "Returns md5sum for a message object of type 'cubeEq_Preset"
  "70c9b6b7a00b0977bdadaa889ac3c537")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cubeEq_Preset>)))
  "Returns full string definition for message of type '<cubeEq_Preset>"
  (cl:format cl:nil "float32[] eq~%float32[] preset~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cubeEq_Preset)))
  "Returns full string definition for message of type 'cubeEq_Preset"
  (cl:format cl:nil "float32[] eq~%float32[] preset~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cubeEq_Preset>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'eq) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'preset) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cubeEq_Preset>))
  "Converts a ROS message object to a list"
  (cl:list 'cubeEq_Preset
    (cl:cons ':eq (eq msg))
    (cl:cons ':preset (preset msg))
))
