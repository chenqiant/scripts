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
#include "dsps_wind_hann.h"
#include <math.h>

void dsps_wind_hann_f32_arp4(float *window, int len)
{
    float len_mult = 1 / (float)(len - 1);
    for (int i = 0; i < len; i++) {
        window[i] = 0.5 * (1 - cosf(i * 2 * M_PI * len_mult));
    }
}
