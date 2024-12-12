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


esp_err_t dspi_dotprod_s16_ansi(image2d_t *in_image, image2d_t *filter, int16_t *out_value, int count_x, int count_y, int shift)
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

    int16_t *i_data =  (int16_t *)in_image->data;
    int16_t *f_data =  (int16_t *)filter->data;
    int i_step = in_image->stride_x * in_image->step_y;
    int f_step = filter->stride_x * filter->step_y;

    int64_t acc = 0;
    for (int y = 0; y < count_y; y++) {

        // 主循环展开8次
        int64_t acc0 = 0, acc1 = 0, acc2 = 0, acc3 = 0, acc4 = 0, acc5 = 0, acc6 = 0, acc7 = 0;
        int x = 0;
        for (; x < count_x - 7; x += 8) {
            acc0 += (int32_t)i_data[in_image->step_x * x] * (int32_t)f_data[filter->step_x * x];
            acc1 += (int32_t)i_data[in_image->step_x * (x+1)] * (int32_t)f_data[filter->step_x * (x+1)];
            acc2 += (int32_t)i_data[in_image->step_x * (x+2)] * (int32_t)f_data[filter->step_x * (x+2)];
            acc3 += (int32_t)i_data[in_image->step_x * (x+3)] * (int32_t)f_data[filter->step_x * (x+3)];
            acc4 += (int32_t)i_data[in_image->step_x * (x+4)] * (int32_t)f_data[filter->step_x * (x+4)];
            acc5 += (int32_t)i_data[in_image->step_x * (x+5)] * (int32_t)f_data[filter->step_x * (x+5)];
            acc6 += (int32_t)i_data[in_image->step_x * (x+6)] * (int32_t)f_data[filter->step_x * (x+6)];
            acc7 += (int32_t)i_data[in_image->step_x * (x+7)] * (int32_t)f_data[filter->step_x * (x+7)];
        }
        // 处理剩余的元素
        for (; x < count_x; x++) {
            acc += (int32_t)i_data[in_image->step_x * x] * (int32_t)f_data[filter->step_x * x];
        }
        // acc += acc0 + acc1 + acc2 + acc3 + acc4 + acc5 + acc6 + acc7;
        int temp1 = acc0 + acc1;
        int temp2 = acc2 + acc3;
        int temp3 = acc4 + acc5;
        int temp4 = acc6 + acc7;
        int temp5 = temp1 + temp2;
        int temp6 = temp3 + temp4;
        int temp7 = temp5 + temp6;
        acc += temp7;
        i_data += i_step;
        f_data += f_step;
    }
    acc += 1 << (shift - 1);    // round operation
    acc >>= shift;
    *out_value = acc;
    return ESP_OK;
}

