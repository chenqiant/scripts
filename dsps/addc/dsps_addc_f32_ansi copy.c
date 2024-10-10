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

#include "dsps_addc.h"

// 原始函数
esp_err_t dsps_addc_f32_ansi(const float *input, float *output, int len, float C, int step_in, int step_out)
{
    if (NULL == input || NULL == output) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }

    for (int i = 0; i < len; i++) {
        output[i * step_out] = input[i * step_in] + C;
    }
    return ESP_OK;
}

// 变种1: 使用指针算术
esp_err_t dsps_addc_f32_ptr(const float *input, float *output, int len, float C, int step_in, int step_out)
{
    if (!input || !output) return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    
    for (int i = 0; i < len; i++) {
        *output = *input + C;
        input += step_in;
        output += step_out;
    }
    return ESP_OK;
}

// 变种2: 使用while循环
esp_err_t dsps_addc_f32_while(const float *input, float *output, int len, float C, int step_in, int step_out)
{
    if (!input || !output) return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    
    int i = 0;
    while (i < len) {
        output[i * step_out] = input[i * step_in] + C;
        i++;
    }
    return ESP_OK;
}

// 变种3: 使用do-while循环
esp_err_t dsps_addc_f32_dowhile(const float *input, float *output, int len, float C, int step_in, int step_out)
{
    if (!input || !output) return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    
    int i = 0;
    if (len > 0) {
        do {
            output[i * step_out] = input[i * step_in] + C;
            i++;
        } while (i < len);
    }
    return ESP_OK;
}

// 变种4: 使用goto语句
esp_err_t dsps_addc_f32_goto(const float *input, float *output, int len, float C, int step_in, int step_out)
{
    if (!input || !output) return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    
    int i = 0;
    start:
    if (i < len) {
        output[i * step_out] = input[i * step_in] + C;
        i++;
        goto start;
    }
    return ESP_OK;
}

// 变种5: 使用递归
esp_err_t dsps_addc_f32_recursive(const float *input, float *output, int len, float C, int step_in, int step_out)
{
    if (!input || !output) return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    
    if (len == 0) return ESP_OK;
    
    *output = *input + C;
    return dsps_addc_f32_recursive(input + step_in, output + step_out, len - 1, C, step_in, step_out);
}

// 变种6: 使用反向循环
esp_err_t dsps_addc_f32_reverse(const float *input, float *output, int len, float C, int step_in, int step_out)
{
    if (!input || !output) return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    
    for (int i = len - 1; i >= 0; i--) {
        output[i * step_out] = input[i * step_in] + C;
    }
    return ESP_OK;
}

// 变种7: 使用步长为2的循环
esp_err_t dsps_addc_f32_step2(const float *input, float *output, int len, float C, int step_in, int step_out)
{
    if (!input || !output) return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    
    for (int i = 0; i < len; i += 2) {
        output[i * step_out] = input[i * step_in] + C;
        if (i + 1 < len) {
            output[(i + 1) * step_out] = input[(i + 1) * step_in] + C;
        }
    }
    return ESP_OK;
}

// 变种8: 使用条件运算符
esp_err_t dsps_addc_f32_conditional(const float *input, float *output, int len, float C, int step_in, int step_out)
{
    if (!input || !output) return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    
    for (int i = 0; i < len; i++) {
        output[i * step_out] = (i % 2 == 0) ? input[i * step_in] + C : input[i * step_in] - C;
    }
    return ESP_OK;
}