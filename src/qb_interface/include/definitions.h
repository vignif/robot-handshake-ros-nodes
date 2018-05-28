// BSD 3-Clause License

// Copyright (c) 2017, qbrobotics
// All rights reserved.

// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:

// * Redistributions of source code must retain the above copyright notice, this
//   list of conditions and the following disclaimer.

// * Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.

// * Neither the name of the copyright holder nor the names of its
//   contributors may be used to endorse or promote products derived from
//   this software without specific prior written permission.

// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#include <math.h>

#define QBMOVEADMIN_VERSION "v6.1.0"

#define NUM_OF_MOTORS 2
#define PI 3.14159265359

#define DEFAULT_RESOLUTION 1
#define DEFAULT_INF_LIMIT -15000
#define DEFAULT_SUP_LIMIT 15000
#define BROADCAST_ID 0
#define DEFAULT_PID_P 0.1
#define DEFAULT_PID_I 0
#define DEFAULT_PID_D 0.8
#define DEFAULT_INCREMENT 1 //in degree
#define DEFAULT_STIFFNESS 30 //in degree
#define DEFAULT_MAX_EXCURSION 330 //in degree

#define ZERO 0
#define MAX_FORWARD_STIFFNESS  32767
#define MAX_REVERSE_STIFFNESS -32768

#define DEG_TICK_MULTIPLIER (65536.0 / (360.0 * (pow(2, DEFAULT_RESOLUTION))))

#define SIN_FILE "./../conf_files/sin.conf"
#define MOTOR_FILE "./../conf_files/motor.conf"
#define QBMOVE_FILE "./../conf_files/qbmove.conf"
#define QBBACKUP_FILE "./../conf_files/qbbackup.conf"