// Copyright 2018-2019 Espressif Systems (Shanghai) PTE LTD
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#define _USE_MATH_DEFINES
#include "dsps_wind_blackman_harris.h"
#include <math.h>

void dsps_wind_blackman_harris_f32_arp4(float *window, int len)
{
    const float a0 = 0.35875;
    const float a1 = 0.48829;
    const float a2 = 0.14128;
    const float a3 = 0.01168;


    float len_mult = 1 / (float)(len - 1);
    float temp = 2 * M_PI * len_mult;
    float temp2 = 2 * temp;
    float temp3 = 3 * temp;
    for (int i = 0; i < len; i++) {
        window[i] = a0
                    - a1 * cosf(i * temp)
                    + a2 * cosf(i * temp2)
                    - a3 * cosf(i * temp3);
    }
}
