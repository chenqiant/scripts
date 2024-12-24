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


#include "dsps_biquad.h"


esp_err_t dsps_biquad_f32_ansi(const float *input, float *output, int len, float *coef, float *w)
{   
    if(len > 2)
    {
            // 主循环，每次处理8个样本
            int i;
            for (i = 0; i < (len-7); i += 8) {
            // 样本 1
            float d0 = input[i] - coef[3] * w[0] - coef[4] * w[1];
            output[i] = coef[0] * d0 + coef[1] * w[0] + coef[2] * w[1];
            w[1] = w[0];
            w[0] = d0;
            
            // 样本 2
            float d1 = input[i+1] - coef[3] * w[0] - coef[4] * w[1];
            output[i+1] = coef[0] * d1 + coef[1] * w[0] + coef[2] * w[1];
            w[1] = w[0];
            w[0] = d1;
            
            // 样本 3
            float d2 = input[i+2] - coef[3] * w[0] - coef[4] * w[1];
            output[i+2] = coef[0] * d2 + coef[1] * w[0] + coef[2] * w[1];
            w[1] = w[0];
            w[0] = d2;
            
            // 样本 4
            float d3 = input[i+3] - coef[3] * w[0] - coef[4] * w[1];
            output[i+3] = coef[0] * d3 + coef[1] * w[0] + coef[2] * w[1];
            w[1] = w[0];
            w[0] = d3;
            
            // 样本 5
            float d4 = input[i+4] - coef[3] * w[0] - coef[4] * w[1];
            output[i+4] = coef[0] * d4 + coef[1] * w[0] + coef[2] * w[1];
            w[1] = w[0];
            w[0] = d4;
            
            // 样本 6
            float d5 = input[i+5] - coef[3] * w[0] - coef[4] * w[1];
            output[i+5] = coef[0] * d5 + coef[1] * w[0] + coef[2] * w[1];
            w[1] = w[0];
            w[0] = d5;
            
            // 样本 7
            float d6 = input[i+6] - coef[3] * w[0] - coef[4] * w[1];
            output[i+6] = coef[0] * d6 + coef[1] * w[0] + coef[2] * w[1];
            w[1] = w[0];
            w[0] = d6;
            
            // 样本 8
            float d7 = input[i+7] - coef[3] * w[0] - coef[4] * w[1];
            output[i+7] = coef[0] * d7 + coef[1] * w[0] + coef[2] * w[1];
            w[1] = w[0];
            w[0] = d7;
        }
        
        // 处理剩余的样本
        for (; i < len; i++) {
            float d0 = input[i] - coef[3] * w[0] - coef[4] * w[1];
            output[i] = coef[0] * d0 + coef[1] * w[0] + coef[2] * w[1];
            w[1] = w[0];
            w[0] = d0;
        }
    }
    else{
        for (int i = 0 ; i < len ; i++) {
            float d0 = input[i] - coef[3] * w[0] - coef[4] * w[1];
            output[i] = coef[0] * d0 +  coef[1] * w[0] + coef[2] * w[1];
            w[1] = w[0];
            w[0] = d0;
        }        
    }
    
    return ESP_OK;
}
