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
#include "dsps_wind_blackman.h"
#include <math.h>

// void dsps_wind_blackman_f32_arp4(float *window, int len)
// {
//     const float a0 = 0.42;
//     const float a1 = 0.5;
//     const float a2 = 0.08;

//     float len_mult = 1 / (float)(len - 1);
//     float temp = 2 * M_PI * len_mult;
//     float temp2 = 2 * temp;
//     for (int i = 0; i < len; i++) {
//         window[i] = a0 - a1 * cosf(i * temp) + a2 * cosf(i * temp2);
//     }
// }

void dsps_wind_blackman_f32_arp4(float *window, int len)
{
    const float a0 = 0.42;
    const float a1 = 0.5;
    const float a2 = 0.08;

    float len_mult = 1 / (float)(len - 1);
    float temp = 2 * M_PI * len_mult;
    float temp2 = 2 * temp;
    int i;
    for (i = 0; i < len-7; i+=8) {
        window[i] = a0 - a1 * cosf(i * temp) + a2 * cosf(i * temp2);
        window[i+1] = a0 - a1 * cosf((i+1) * temp) + a2 * cosf((i+1) * temp2);
        window[i+2] = a0 - a1 * cosf((i+2) * temp) + a2 * cosf((i+2) * temp2);
        window[i+3] = a0 - a1 * cosf((i+3) * temp) + a2 * cosf((i+3) * temp2);
        window[i+4] = a0 - a1 * cosf((i+4) * temp) + a2 * cosf((i+4) * temp2);
        window[i+5] = a0 - a1 * cosf((i+5) * temp) + a2 * cosf((i+5) * temp2);
        window[i+6] = a0 - a1 * cosf((i+6) * temp) + a2 * cosf((i+6) * temp2);
        window[i+7] = a0 - a1 * cosf((i+7) * temp) + a2 * cosf((i+7) * temp2);
    }
    // Handle remaining elements
    for (; i < len; i++) {
        window[i] = a0 - a1 * cosf(i * temp) + a2 * cosf(i * temp2);
    }
}