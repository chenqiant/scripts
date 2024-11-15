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

#include "dsps_add.h"

esp_err_t dsps_add_f32_ansi(const float *restrict input1, const float *restrict input2, float *restrict output, int len, int step1, int step2, int step_out)
{
    if (NULL == input1) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }
    if (NULL == input2) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }
    if (NULL == output) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }

    int i;
    if(len > 2){
        for (i = 0; i < len - 7; i += 8) {
            output[i * step_out] = input1[i * step1] + input2[i * step2];
            output[(i + 1) * step_out] = input1[(i + 1) * step1] + input2[(i + 1) * step2];
            output[(i + 2) * step_out] = input1[(i + 2) * step1] + input2[(i + 2) * step2];
            output[(i + 3) * step_out] = input1[(i + 3) * step1] + input2[(i + 3) * step2];
            output[(i + 4) * step_out] = input1[(i + 4) * step1] + input2[(i + 4) * step2];
            output[(i + 5) * step_out] = input1[(i + 5) * step1] + input2[(i + 5) * step2];
            output[(i + 6) * step_out] = input1[(i + 6) * step1] + input2[(i + 6) * step2];
            output[(i + 7) * step_out] = input1[(i + 7) * step1] + input2[(i + 7) * step2];
        }
        for (; i < len; i++) {
            output[i * step_out] = input1[i * step1] + input2[i * step2];
        }
    }
    else{
        for (i = 0; i < len; i++) {
            output[i * step_out] = input1[i * step1] + input2[i * step2];
        }
    }
    return ESP_OK;
}

