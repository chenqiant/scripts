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

esp_err_t dspi_dotprod_off_s16_ansi(image2d_t *in_image, image2d_t *filter, int16_t *out_value, int count_x, int count_y, int shift, int16_t offset)
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
        // 使用16个独立累加器
        int64_t acc0 = 0, acc1 = 0, acc2 = 0, acc3 = 0;
        int64_t acc4 = 0, acc5 = 0, acc6 = 0, acc7 = 0;
        int64_t acc8 = 0, acc9 = 0, acc10 = 0, acc11 = 0;
        int64_t acc12 = 0, acc13 = 0, acc14 = 0, acc15 = 0;

        int x = 0;
        for (; x < (count_x & (~15)); x += 16) {
            acc0 += (int32_t)i_data[in_image->step_x * (x+0)] * ((int32_t)f_data[filter->step_x * (x+0)] + (int32_t)offset);
            acc1 += (int32_t)i_data[in_image->step_x * (x+1)] * ((int32_t)f_data[filter->step_x * (x+1)] + (int32_t)offset);
            acc2 += (int32_t)i_data[in_image->step_x * (x+2)] * ((int32_t)f_data[filter->step_x * (x+2)] + (int32_t)offset);
            acc3 += (int32_t)i_data[in_image->step_x * (x+3)] * ((int32_t)f_data[filter->step_x * (x+3)] + (int32_t)offset);
            acc4 += (int32_t)i_data[in_image->step_x * (x+4)] * ((int32_t)f_data[filter->step_x * (x+4)] + (int32_t)offset);
            acc5 += (int32_t)i_data[in_image->step_x * (x+5)] * ((int32_t)f_data[filter->step_x * (x+5)] + (int32_t)offset);
            acc6 += (int32_t)i_data[in_image->step_x * (x+6)] * ((int32_t)f_data[filter->step_x * (x+6)] + (int32_t)offset);
            acc7 += (int32_t)i_data[in_image->step_x * (x+7)] * ((int32_t)f_data[filter->step_x * (x+7)] + (int32_t)offset);
            acc8 += (int32_t)i_data[in_image->step_x * (x+8)] * ((int32_t)f_data[filter->step_x * (x+8)] + (int32_t)offset);
            acc9 += (int32_t)i_data[in_image->step_x * (x+9)] * ((int32_t)f_data[filter->step_x * (x+9)] + (int32_t)offset);
            acc10 += (int32_t)i_data[in_image->step_x * (x+10)] * ((int32_t)f_data[filter->step_x * (x+10)] + (int32_t)offset);
            acc11 += (int32_t)i_data[in_image->step_x * (x+11)] * ((int32_t)f_data[filter->step_x * (x+11)] + (int32_t)offset);
            acc12 += (int32_t)i_data[in_image->step_x * (x+12)] * ((int32_t)f_data[filter->step_x * (x+12)] + (int32_t)offset);
            acc13 += (int32_t)i_data[in_image->step_x * (x+13)] * ((int32_t)f_data[filter->step_x * (x+13)] + (int32_t)offset);
            acc14 += (int32_t)i_data[in_image->step_x * (x+14)] * ((int32_t)f_data[filter->step_x * (x+14)] + (int32_t)offset);
            acc15 += (int32_t)i_data[in_image->step_x * (x+15)] * ((int32_t)f_data[filter->step_x * (x+15)] + (int32_t)offset);
        }
        
        // 处理剩余的元素
        for (; x < count_x; x++) {
            acc0 += (int32_t)i_data[in_image->step_x * x] * ((int32_t)f_data[filter->step_x * x] + (int32_t)offset);
        }
        
        // 分两步合并所有累加器，可能有助于减少精度损失
        acc = (acc0 + acc1) + (acc2 + acc3) + (acc4 + acc5) + (acc6 + acc7) +
              (acc8 + acc9) + (acc10 + acc11) + (acc12 + acc13) + (acc14 + acc15);
        
        i_data += i_step;
        f_data += f_step;
    }
    acc += 1 << (shift - 1);    // round operation
    acc >>= shift;
    *out_value = acc;
    return ESP_OK;
}
