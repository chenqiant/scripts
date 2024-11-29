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

#include "dsps_dotprod.h"

esp_err_t dsps_dotprod_s16_ansi(const int16_t *src1, const int16_t *src2, int16_t *dest, int len, int8_t shift)
{
    // To make correct round operation we have to shift round value
    long long acc = 0x7fff >> shift;
    
    int i;
    for (i = 0; i < (len & (~7)); i += 8) {
        acc += (int32_t)src1[i + 0] * (int32_t)src2[i + 0];
        acc += (int32_t)src1[i + 1] * (int32_t)src2[i + 1];
        acc += (int32_t)src1[i + 2] * (int32_t)src2[i + 2];
        acc += (int32_t)src1[i + 3] * (int32_t)src2[i + 3];
        acc += (int32_t)src1[i + 4] * (int32_t)src2[i + 4];
        acc += (int32_t)src1[i + 5] * (int32_t)src2[i + 5];
        acc += (int32_t)src1[i + 6] * (int32_t)src2[i + 6];
        acc += (int32_t)src1[i + 7] * (int32_t)src2[i + 7];
    }
    
    // 处理剩余元素
    for (; i < len; i++) {
        acc += (int32_t)src1[i] * (int32_t)src2[i];
    }

    int final_shift = shift - 15;
    if (final_shift > 0) {
        *dest = (acc << final_shift);
    } else {
        *dest = (acc >> (-final_shift));
    }
    return ESP_OK;
}
