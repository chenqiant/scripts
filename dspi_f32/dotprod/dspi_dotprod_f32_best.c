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

#include "dspi_dotprod.h"

esp_err_t dspi_dotprod_f32_ansi(image2d_t *in_image, image2d_t *filter, float *out_value, int count_x, int count_y)
{
    if (in_image->step_x * count_x > in_image->stride_x) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }
    if (in_image->step_y * count_y > in_image->stride_y) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }
    if (filter->step_x * count_x > filter->stride_x) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }
    if (filter->step_y * count_y > filter->stride_y) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }

    float *i_data =  (float *)in_image->data;
    float *f_data =  (float *)filter->data;
    int i_step = in_image->stride_x * in_image->step_y;
    int f_step = filter->stride_x * filter->step_y;

    float acc = 0;
    for (int y = 0; y < count_y; y++) {
        int x = 0;
        float acc0 = 0;
        float acc1 = 0;
        float acc2 = 0;
        float acc3 = 0;
        float acc4 = 0;
        float acc5 = 0;
        float acc6 = 0;
        float acc7 = 0;
        for (; x < count_x - 7; x += 8) {
            acc0 += i_data[in_image->step_x * x] * f_data[filter->step_x * x];
            acc1 += i_data[in_image->step_x * (x+1)] * f_data[filter->step_x * (x+1)];
            acc2 += i_data[in_image->step_x * (x+2)] * f_data[filter->step_x * (x+2)];
            acc3 += i_data[in_image->step_x * (x+3)] * f_data[filter->step_x * (x+3)];
            acc4 += i_data[in_image->step_x * (x+4)] * f_data[filter->step_x * (x+4)];
            acc5 += i_data[in_image->step_x * (x+5)] * f_data[filter->step_x * (x+5)];
            acc6 += i_data[in_image->step_x * (x+6)] * f_data[filter->step_x * (x+6)];
            acc7 += i_data[in_image->step_x * (x+7)] * f_data[filter->step_x * (x+7)];
        }
        float temp0 = acc0 + acc1;
        float temp1 = acc2 + acc3;
        float temp2 = acc4 + acc5;
        float temp3 = acc6 + acc7;
        float temp4 = temp0 + temp1;
        float temp5 = temp2 + temp3;
        float temp6 = temp4 + temp5;
        acc += temp6;
        // 处理剩余的元素
        for (; x < count_x; x++) {
            acc += i_data[in_image->step_x * x] * f_data[filter->step_x * x];
        }
        i_data += i_step;
        f_data += f_step;
    }
    *out_value = acc;
    return ESP_OK;
}
