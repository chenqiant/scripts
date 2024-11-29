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

// esp_err_t dsps_dotprod_f32_ansi(const float *src1, const float *src2, float *dest, int len)
// {
//     float acc = 0;
//     for (int i = 0 ; i < len ; i++) {
//         acc += src1[i] * src2[i];
//     }
//     *dest = acc;
//     return ESP_OK;
// }

// esp_err_t dsps_dotprod_f32_ansi(const float *restrict src1, const float *restrict src2, float *restrict dest, int len)
// {

//     if(len > 2){
//         float acc0 = 0, acc1 = 0, acc2 = 0, acc3 = 0;
//         float acc4 = 0, acc5 = 0, acc6 = 0, acc7 = 0;
//         int i;
//         // Main loop with 8x unrolling
//         for (i = 0; i < len - 7; i += 8) {
//             acc0 += src1[i] * src2[i];
//             acc1 += src1[i+1] * src2[i+1];
//             acc2 += src1[i+2] * src2[i+2];
//             acc3 += src1[i+3] * src2[i+3];
//             acc4 += src1[i+4] * src2[i+4];
//             acc5 += src1[i+5] * src2[i+5];
//             acc6 += src1[i+6] * src2[i+6];
//             acc7 += src1[i+7] * src2[i+7];
//         }

//         // Handle remaining elements
//         for (; i < len; i++) {
//             acc0 += src1[i] * src2[i];
//         }
//         float temp1 = acc0 + acc1;
//         float temp2 = acc2 + acc3;
//         float temp3 = acc4 + acc5;
//         float temp4 = acc6 + acc7;
//         float temp5 = temp1 + temp2;
//         float temp6 = temp3 + temp4;
//         *dest = temp5 + temp6;
//     }else{
//         float acc = 0;
//         for (int i = 0; i < len; i++) {
//             acc += src1[i] * src2[i];
//         }
//         *dest = acc;        
//     }
//     return ESP_OK;
// }



esp_err_t dsps_dotprod_f32_ansi(const float *src1, const float *src2, float *dest, int len)
{
    float acc = 0;
    int i;
    for (i = 0; i < len - 7; i += 8) {
        acc += src1[i] * src2[i];
        acc += src1[i+1] * src2[i+1]; 
        acc += src1[i+2] * src2[i+2];
        acc += src1[i+3] * src2[i+3];
        acc += src1[i+4] * src2[i+4];
        acc += src1[i+5] * src2[i+5];
        acc += src1[i+6] * src2[i+6];
        acc += src1[i+7] * src2[i+7];
    }
    // 处理剩余元素
    for (; i < len; i++) {
        acc += src1[i] * src2[i];
    }

    *dest = acc;
    return ESP_OK;
}