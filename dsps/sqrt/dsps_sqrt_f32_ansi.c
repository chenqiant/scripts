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

#include "dsps_sqrt.h"
#include <math.h>


inline float dsps_sqrtf_f32_ansi(float f)
{
    int result;
    int *f_ptr = (int *)&f;
    result = 0x1fbb4000 + (*f_ptr >> 1);
    const int *p = &result;
    float *f_result = (float *)p;
    return *f_result;
}

esp_err_t dsps_sqrt_f32_ansi(const float *input, float *output, int len)
{
    if (NULL == input) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }
    if (NULL == output) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }

    for (int i = 0 ; i < len ; i++) {
        output[i] = dsps_sqrtf_f32_ansi(input[i]);
    }
    return ESP_OK;
}

