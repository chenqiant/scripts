// Copyright 2024 Espressif Systems (Shanghai) PTE LTD
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

#include "dspi_conv.h"
#include "esp_log.h"

/*
esp_err_t dspi_conv_f32_ansi(const image2d_t *in_image, const image2d_t *filter, image2d_t *out_image)
{
    const int in_image_step_x = in_image->step_x;
    const int in_image_step_y = in_image->step_y;
    const int in_image_stride_x = in_image->stride_x;
    // const int in_image_stride_y = in_image->stride_y;
    const int in_image_size_x = in_image->size_x;
    const int in_image_size_y = in_image->size_y;

    const int filter_step_x = filter->step_x;
    const int filter_step_y = filter->step_y;
    const int filter_stride_x = filter->stride_x;
    // const int filter_stride_y = filter->stride_y;
    const int filter_size_x = filter->size_x;
    const int filter_size_y = filter->size_y;

    const int out_image_step_x = out_image->step_x;
    const int out_image_step_y = out_image->step_y;
    const int out_image_stride_x = out_image->stride_x;
    // const int out_image_stride_y = out_image->stride_y;
    // const int out_image_size_x = out_image->size_x;
    // const int out_image_size_y = out_image->size_y;

    float *i_data =  (float *)in_image->data;
    float *out_data = (float *)out_image->data;
    float *filter_data = (float *)filter->data;

    int rest_x = (filter_size_x - 1) >> 1;
    int rest_y = (filter_size_y - 1) >> 1;

    int i_pos = 0;
    int i_step = in_image_stride_x * in_image_step_y;
    int f_step = filter_stride_x * filter_step_y;
    int o_step = out_image_stride_x * out_image_step_y;
    

    int temp0 = in_image_size_x - filter_size_x / 2;
    int temp = in_image_size_y - filter_size_y / 2;
    int temp1 = filter_size_y + temp - 1;
    int temp2 = filter_size_x + temp0 - 1;
    int temp3 = temp0 - 1;
    // Up side of image
    for (int y = 0 ; y < rest_y; y++ ) {
        int i_pos_y = i_pos;
        const int up_y = rest_y - y;
        const int y_offset = y * o_step;
        for (int x = 0 ; x < rest_x; x++) {
            int i_pos_x = i_pos_y;
            float acc = 0;
            float *f_data =  filter_data;
            const int rest_x_x = rest_x - x;
            for (int m = up_y ; m < filter_size_y ; m++) {
                for (int n = rest_x_x ; n < filter_size_x; n++) {
                    acc += i_data[i_pos_x + n * in_image_step_x] * f_data[filter_step_x * n];
                }
                f_data += f_step;
                i_pos_x += i_step;
            }
            i_pos_y += in_image_step_x;
            out_data[x * out_image_step_x + y_offset] = acc;
        }
        for (int x = rest_x ; x < temp0; x++) {
            int i_pos_x = i_pos_y;
            float acc = 0;
            float *f_data =  filter_data;
            for (int m = up_y ; m < filter_size_y ; m++) {
                for (int n = 0 ; n < filter_size_x; n++) {
                    acc += i_data[i_pos_x + n * in_image_step_x] * f_data[filter_step_x * n];
                }
                f_data += f_step;
                i_pos_x += i_step;
            }
            i_pos_y += in_image_step_x;
            out_data[x * out_image_step_x + y_offset] = acc;
        }
        for (int x = temp3 ; x < in_image_size_x; x++) {
            int i_pos_x = i_pos_y;
            float acc = 0;
            float *f_data =  filter_data;
            int temp5 = temp2 - x;
            for (int m = up_y ; m < filter_size_y ; m++) {
                for (int n = 0 ; n < temp5; n++) {
                    acc += i_data[i_pos_x + n * in_image_step_x] * f_data[filter_step_x * n];
                }
                f_data += f_step;
                i_pos_x += i_step;
            }
            i_pos_y += in_image_step_x;
            out_data[x * out_image_step_x + y_offset] = acc;
        }
        i_pos += i_step;
    }
    // Middle side of image
    i_pos = 0;
    for (int y = rest_y ; y < temp; y++ ) {
        int i_pos_y = i_pos;
        const int y_offset = y * o_step;
        for (int x = 0 ; x < rest_x; x++) {
            int i_pos_x = i_pos_y;
            float acc = 0;
            const int up_x = rest_x - x;
            float *f_data =  filter_data;
            for (int m = 0 ; m < filter_size_y ; m++) {
                for (int n = up_x ; n < filter_size_x ; n++) {
                    acc += i_data[i_pos_x + n * in_image_step_x] * f_data[filter_step_x * n];
                }
                f_data += f_step;
                i_pos_x += i_step;
            }
            i_pos_y += in_image_step_x;
            out_data[x * out_image_step_x + y_offset] = acc;
        }
        for (int x = temp3 ; x < in_image_size_x; x++) {
            int i_pos_x = i_pos_y;
            float acc = 0;
            float *f_data =  filter_data;
            const int temp6 = temp2 - x;
            for (int m = 0 ; m < filter_size_y ; m++) {
                for (int n = 0 ; n < temp6; n++) {
                    acc += i_data[i_pos_x + n * in_image_step_x] * f_data[filter_step_x * n];
                }
                f_data += f_step;
                i_pos_x += i_step;
            }
            i_pos_y += in_image_step_x;
            out_data[x * out_image_step_x + y_offset] = acc;
        }

        i_pos += i_step;
    }
    // Down side of image
    i_pos = 0;
    for (int y = temp ; y < in_image_size_y; y++ ) {
        int i_pos_y = i_pos;
        int temp7 = temp1 - y;
        const int y_offset = y * o_step;
        for (int x = 0 ; x < rest_x; x++) {
            int i_pos_x = i_pos_y;
            float acc = 0;
            float *f_data =  filter_data; 
            const int up_x = rest_x - x;
            for (int m = 0 ; m < temp7; m++) {
                for (int n = up_x ; n < filter_size_x ; n++) {
                    acc += i_data[i_pos_x + n * in_image_step_x] * f_data[filter_step_x * n];
                }
                f_data += f_step;
                i_pos_x += i_step;
            }
            i_pos_y += in_image_step_x;
            out_data[x * out_image_step_x + y_offset] = acc;
        }
        for (int x = rest_x ; x < temp0; x++) {
            int i_pos_x = i_pos_y;
            float acc = 0;
            float *f_data =  filter_data;
            for (int m = 0 ; m < temp7; m++) {
                for (int n = 0 ; n < filter_size_x ; n++) {
                    acc += i_data[i_pos_x + n * in_image_step_x] * f_data[filter_step_x * n];
                }
                f_data += f_step;
                i_pos_x += i_step;
            }
            i_pos_y += in_image_step_x;
            out_data[x * out_image_step_x + y_offset] = acc;
        }
        for (int x = temp0 ; x < in_image_size_x; x++) {
            int i_pos_x = i_pos_y;
            float acc = 0;
            float *f_data =  filter_data;
            for (int m = 0 ; m < temp7; m++) {
                for (int n = 0 ; n < temp2 - x; n++) {
                    acc += i_data[i_pos_x + n * in_image_step_x] * f_data[filter_step_x * n];
                }
                f_data += f_step;
                i_pos_x += i_step;
            }
            i_pos_y += in_image_step_x;
            out_data[x * out_image_step_x + y_offset] = acc;
        }

        i_pos += i_step;
    }
    // Main image block
    i_pos = 0;
    for (int y = rest_y ; y < temp; y++ ) {
        int i_pos_y = i_pos;
        const int y_offset = y * o_step;
        for (int x = rest_x ; x < temp0; x++) {
            int i_pos_x = i_pos_y;
            float acc = 0;
            float *f_data =  filter_data;
            for (int m = 0 ; m < filter_size_y ; m++) {
                for (int n = 0 ; n < filter_size_x ; n++) {
                    acc += i_data[i_pos_x + n * in_image_step_x] * f_data[filter_step_x * n];
                }
                f_data += f_step;
                i_pos_x += i_step;
            }
            i_pos_y += in_image_step_x;
            out_data[x * out_image_step_x + y_offset] = acc;
        }
        i_pos += i_step;
    }
    return ESP_OK;
}
*/


esp_err_t dspi_conv_f32_ansi(const image2d_t *in_image, const image2d_t *filter, image2d_t *out_image)
{
    const int in_image_step_x = in_image->step_x;
    const int in_image_step_y = in_image->step_y;
    const int in_image_stride_x = in_image->stride_x;
    // const int in_image_stride_y = in_image->stride_y;
    const int in_image_size_x = in_image->size_x;
    const int in_image_size_y = in_image->size_y;

    const int filter_step_x = filter->step_x;
    const int filter_step_y = filter->step_y;
    const int filter_stride_x = filter->stride_x;
    // const int filter_stride_y = filter->stride_y;
    const int filter_size_x = filter->size_x;
    const int filter_size_y = filter->size_y;

    const int out_image_step_x = out_image->step_x;
    const int out_image_step_y = out_image->step_y;
    const int out_image_stride_x = out_image->stride_x;
    // const int out_image_stride_y = out_image->stride_y;
    // const int out_image_size_x = out_image->size_x;
    // const int out_image_size_y = out_image->size_y;

    float *i_data =  (float *)in_image->data;
    float *out_data = (float *)out_image->data;
    float *filter_data = (float *)filter->data;

    int rest_x = (filter_size_x - 1) >> 1;
    int rest_y = (filter_size_y - 1) >> 1;

    int i_pos = 0;
    int i_step = in_image_stride_x * in_image_step_y;
    int f_step = filter_stride_x * filter_step_y;
    int o_step = out_image_stride_x * out_image_step_y;
    

    int temp0 = in_image_size_x - filter_size_x / 2;
    int temp = in_image_size_y - filter_size_y / 2;
    int temp1 = filter_size_y + temp - 1;
    int temp2 = filter_size_x + temp0 - 1;
    int temp3 = temp0 - 1;
    // int temp4 = filter_size_x - 7;
    const int in_image_step_x_2 = in_image_step_x * 2;
    const int in_image_step_x_3 = in_image_step_x * 3;
    const int in_image_step_x_4 = in_image_step_x * 4;
    const int in_image_step_x_5 = in_image_step_x * 5;
    const int in_image_step_x_6 = in_image_step_x * 6;
    const int in_image_step_x_7 = in_image_step_x * 7;
    const int filter_step_x_2 = filter_step_x * 2;
    const int filter_step_x_3 = filter_step_x * 3;
    const int filter_step_x_4 = filter_step_x * 4;
    const int filter_step_x_5 = filter_step_x * 5;
    const int filter_step_x_6 = filter_step_x * 6;
    const int filter_step_x_7 = filter_step_x * 7;
    // Up side of image
    for (int y = 0 ; y < rest_y; y++ ) {
        int i_pos_y = i_pos;
        const int up_y = rest_y - y;
        const int y_offset = y * o_step;
        for (int x = 0 ; x < rest_x; x++) {
            int i_pos_x = i_pos_y;
            float acc = 0;
            float *f_data =  filter_data;
            const int rest_x_x = rest_x - x;
            for (int m = up_y ; m < filter_size_y ; m++) {
                int n;
                for (n = rest_x_x ; n < filter_size_x - 7; n += 8) {
                    const int i_pos_x_n = i_pos_x + n * in_image_step_x;
                    const int f_data_n = filter_step_x * n;
                    acc += i_data[i_pos_x_n] * f_data[f_data_n];
                    acc += i_data[i_pos_x_n + in_image_step_x] * f_data[f_data_n + filter_step_x];
                    acc += i_data[i_pos_x_n + in_image_step_x_2] * f_data[f_data_n + filter_step_x_2];
                    acc += i_data[i_pos_x_n + in_image_step_x_3] * f_data[f_data_n + filter_step_x_3];
                    acc += i_data[i_pos_x_n + in_image_step_x_4] * f_data[f_data_n + filter_step_x_4];
                    acc += i_data[i_pos_x_n + in_image_step_x_5] * f_data[f_data_n + filter_step_x_5];   
                    acc += i_data[i_pos_x_n + in_image_step_x_6] * f_data[f_data_n + filter_step_x_6];
                    acc += i_data[i_pos_x_n + in_image_step_x_7] * f_data[f_data_n + filter_step_x_7];
                }
                for (; n < filter_size_x; n++) {
                    acc += i_data[i_pos_x + n * in_image_step_x] * f_data[filter_step_x * n];
                }
                f_data += f_step;
                i_pos_x += i_step;
            }
            i_pos_y += in_image_step_x;
            out_data[x * out_image_step_x + y_offset] = acc;
        }
        for (int x = rest_x ; x < temp0; x++) {
            int i_pos_x = i_pos_y;
            float acc = 0;
            float *f_data =  filter_data;
            for (int m = up_y ; m < filter_size_y ; m++) {
                int n = 0;
                for (n = 0 ; n < filter_size_x - 7; n+=8) {
                    const int i_pos_x_n = i_pos_x + n * in_image_step_x;
                    const int f_data_n = filter_step_x * n;
                    acc += i_data[i_pos_x_n] * f_data[f_data_n];
                    acc += i_data[i_pos_x_n + in_image_step_x] * f_data[f_data_n + filter_step_x];
                    acc += i_data[i_pos_x_n + in_image_step_x_2] * f_data[f_data_n + filter_step_x_2];
                    acc += i_data[i_pos_x_n + in_image_step_x_3] * f_data[f_data_n + filter_step_x_3];
                    acc += i_data[i_pos_x_n + in_image_step_x_4] * f_data[f_data_n + filter_step_x_4];
                    acc += i_data[i_pos_x_n + in_image_step_x_5] * f_data[f_data_n + filter_step_x_5];   
                    acc += i_data[i_pos_x_n + in_image_step_x_6] * f_data[f_data_n + filter_step_x_6];
                    acc += i_data[i_pos_x_n + in_image_step_x_7] * f_data[f_data_n + filter_step_x_7];
                }
                for (; n < filter_size_x; n++) {
                    acc += i_data[i_pos_x + n * in_image_step_x] * f_data[filter_step_x * n];
                }
                f_data += f_step;
                i_pos_x += i_step;
            }
            i_pos_y += in_image_step_x;
            out_data[x * out_image_step_x + y_offset] = acc;
        }
        for (int x = temp3 ; x < in_image_size_x; x++) {
            int i_pos_x = i_pos_y;
            float acc = 0;
            float *f_data =  filter_data;
            int temp5 = temp2 - x;
            for (int m = up_y ; m < filter_size_y ; m++) {
                int n;
                for (n = 0 ; n < temp5 - 7; n+=8) {
                    const int i_pos_x_n = i_pos_x + n * in_image_step_x;
                    const int f_data_n = filter_step_x * n;
                    acc += i_data[i_pos_x_n] * f_data[f_data_n];
                    acc += i_data[i_pos_x_n + in_image_step_x] * f_data[f_data_n + filter_step_x];
                    acc += i_data[i_pos_x_n + in_image_step_x_2] * f_data[f_data_n + filter_step_x_2];
                    acc += i_data[i_pos_x_n + in_image_step_x_3] * f_data[f_data_n + filter_step_x_3];
                    acc += i_data[i_pos_x_n + in_image_step_x_4] * f_data[f_data_n + filter_step_x_4];
                    acc += i_data[i_pos_x_n + in_image_step_x_5] * f_data[f_data_n + filter_step_x_5];   
                    acc += i_data[i_pos_x_n + in_image_step_x_6] * f_data[f_data_n + filter_step_x_6];
                    acc += i_data[i_pos_x_n + in_image_step_x_7] * f_data[f_data_n + filter_step_x_7];
                }
                for (; n < temp5; n++) {
                    acc += i_data[i_pos_x + n * in_image_step_x] * f_data[filter_step_x * n];
                }
                f_data += f_step;
                i_pos_x += i_step;
            }
            i_pos_y += in_image_step_x;
            out_data[x * out_image_step_x + y_offset] = acc;
        }
        i_pos += i_step;
    }
    // Middle side of image
    i_pos = 0;
    for (int y = rest_y ; y < temp; y++ ) {
        int i_pos_y = i_pos;
        const int y_offset = y * o_step;
        for (int x = 0 ; x < rest_x; x++) {
            int i_pos_x = i_pos_y;
            float acc = 0;
            const int up_x = rest_x - x;
            float *f_data =  filter_data;
            for (int m = 0 ; m < filter_size_y ; m++) {
                int n;
                for (n = up_x ; n < filter_size_x - 7; n+=8) {
                    const int i_pos_x_n = i_pos_x + n * in_image_step_x;
                    const int f_data_n = filter_step_x * n;
                    acc += i_data[i_pos_x_n] * f_data[f_data_n];
                    acc += i_data[i_pos_x_n + in_image_step_x] * f_data[f_data_n + filter_step_x];
                    acc += i_data[i_pos_x_n + in_image_step_x_2] * f_data[f_data_n + filter_step_x_2];
                    acc += i_data[i_pos_x_n + in_image_step_x_3] * f_data[f_data_n + filter_step_x_3];
                    acc += i_data[i_pos_x_n + in_image_step_x_4] * f_data[f_data_n + filter_step_x_4];
                    acc += i_data[i_pos_x_n + in_image_step_x_5] * f_data[f_data_n + filter_step_x_5];   
                    acc += i_data[i_pos_x_n + in_image_step_x_6] * f_data[f_data_n + filter_step_x_6];
                    acc += i_data[i_pos_x_n + in_image_step_x_7] * f_data[f_data_n + filter_step_x_7];
                }
                for (; n < filter_size_x; n++) {
                    acc += i_data[i_pos_x + n * in_image_step_x] * f_data[filter_step_x * n];
                }
                f_data += f_step;
                i_pos_x += i_step;
            }
            i_pos_y += in_image_step_x;
            out_data[x * out_image_step_x + y_offset] = acc;
        }
        for (int x = temp3 ; x < in_image_size_x; x++) {
            int i_pos_x = i_pos_y;
            float acc = 0;
            float *f_data =  filter_data;
            const int temp6 = temp2 - x;
            for (int m = 0 ; m < filter_size_y ; m++) {
                int n;
                for (n = 0 ; n < temp6 - 7; n+=8) {
                    const int i_pos_x_n = i_pos_x + n * in_image_step_x;
                    const int f_data_n = filter_step_x * n;
                    acc += i_data[i_pos_x_n] * f_data[f_data_n];
                    acc += i_data[i_pos_x_n + in_image_step_x] * f_data[f_data_n + filter_step_x];
                    acc += i_data[i_pos_x_n + in_image_step_x_2] * f_data[f_data_n + filter_step_x_2];
                    acc += i_data[i_pos_x_n + in_image_step_x_3] * f_data[f_data_n + filter_step_x_3];
                    acc += i_data[i_pos_x_n + in_image_step_x_4] * f_data[f_data_n + filter_step_x_4];
                    acc += i_data[i_pos_x_n + in_image_step_x_5] * f_data[f_data_n + filter_step_x_5];   
                    acc += i_data[i_pos_x_n + in_image_step_x_6] * f_data[f_data_n + filter_step_x_6];
                    acc += i_data[i_pos_x_n + in_image_step_x_7] * f_data[f_data_n + filter_step_x_7];
                }
                for (; n < temp6; n++) {
                    acc += i_data[i_pos_x + n * in_image_step_x] * f_data[filter_step_x * n];
                }
                f_data += f_step;
                i_pos_x += i_step;
            }
            i_pos_y += in_image_step_x;
            out_data[x * out_image_step_x + y_offset] = acc;
        }

        i_pos += i_step;
    }
    // Down side of image
    i_pos = 0;
    for (int y = temp ; y < in_image_size_y; y++ ) {
        int i_pos_y = i_pos;
        int temp7 = temp1 - y;
        const int y_offset = y * o_step;
        for (int x = 0 ; x < rest_x; x++) {
            int i_pos_x = i_pos_y;
            float acc = 0;
            float *f_data =  filter_data; 
            const int up_x = rest_x - x;
            for (int m = 0 ; m < temp7; m++) {
                int n;
                for (n = up_x ; n < filter_size_x - 7; n+=8) {
                    const int i_pos_x_n = i_pos_x + n * in_image_step_x;
                    const int f_data_n = filter_step_x * n;
                    acc += i_data[i_pos_x_n] * f_data[f_data_n];
                    acc += i_data[i_pos_x_n + in_image_step_x] * f_data[f_data_n + filter_step_x];
                    acc += i_data[i_pos_x_n + in_image_step_x_2] * f_data[f_data_n + filter_step_x_2];
                    acc += i_data[i_pos_x_n + in_image_step_x_3] * f_data[f_data_n + filter_step_x_3];
                    acc += i_data[i_pos_x_n + in_image_step_x_4] * f_data[f_data_n + filter_step_x_4];
                    acc += i_data[i_pos_x_n + in_image_step_x_5] * f_data[f_data_n + filter_step_x_5];   
                    acc += i_data[i_pos_x_n + in_image_step_x_6] * f_data[f_data_n + filter_step_x_6];
                    acc += i_data[i_pos_x_n + in_image_step_x_7] * f_data[f_data_n + filter_step_x_7];
                }
                for (; n < filter_size_x; n++) {
                    acc += i_data[i_pos_x + n * in_image_step_x] * f_data[filter_step_x * n];
                }
                f_data += f_step;
                i_pos_x += i_step;
            }
            i_pos_y += in_image_step_x;
            out_data[x * out_image_step_x + y_offset] = acc;
        }
        for (int x = rest_x ; x < temp0; x++) {
            int i_pos_x = i_pos_y;
            float acc = 0;
            float *f_data =  filter_data;
            for (int m = 0 ; m < temp7; m++) {
                int n;
                for (n = 0 ; n < filter_size_x - 7; n+=8) {
                    const int i_pos_x_n = i_pos_x + n * in_image_step_x;
                    const int f_data_n = filter_step_x * n;
                    acc += i_data[i_pos_x_n] * f_data[f_data_n];
                    acc += i_data[i_pos_x_n + in_image_step_x] * f_data[f_data_n + filter_step_x];
                    acc += i_data[i_pos_x_n + in_image_step_x_2] * f_data[f_data_n + filter_step_x_2];
                    acc += i_data[i_pos_x_n + in_image_step_x_3] * f_data[f_data_n + filter_step_x_3];
                    acc += i_data[i_pos_x_n + in_image_step_x_4] * f_data[f_data_n + filter_step_x_4];
                    acc += i_data[i_pos_x_n + in_image_step_x_5] * f_data[f_data_n + filter_step_x_5];   
                    acc += i_data[i_pos_x_n + in_image_step_x_6] * f_data[f_data_n + filter_step_x_6];
                    acc += i_data[i_pos_x_n + in_image_step_x_7] * f_data[f_data_n + filter_step_x_7];
                }
                for (; n < filter_size_x; n++) {
                    acc += i_data[i_pos_x + n * in_image_step_x] * f_data[filter_step_x * n];
                }
                f_data += f_step;
                i_pos_x += i_step;
            }
            i_pos_y += in_image_step_x;
            out_data[x * out_image_step_x + y_offset] = acc;
        }
        for (int x = temp0 ; x < in_image_size_x; x++) {
            int i_pos_x = i_pos_y;
            float acc = 0;
            float *f_data =  filter_data;
            for (int m = 0 ; m < temp7; m++) {
                int n;
                for (n = 0 ; n < temp2 - x - 7; n+= 8) {
                    const int i_pos_x_n = i_pos_x + n * in_image_step_x;
                    const int f_data_n = filter_step_x * n;
                    acc += i_data[i_pos_x_n] * f_data[f_data_n];
                    acc += i_data[i_pos_x_n + in_image_step_x] * f_data[f_data_n + filter_step_x];
                    acc += i_data[i_pos_x_n + in_image_step_x_2] * f_data[f_data_n + filter_step_x_2];
                    acc += i_data[i_pos_x_n + in_image_step_x_3] * f_data[f_data_n + filter_step_x_3];
                    acc += i_data[i_pos_x_n + in_image_step_x_4] * f_data[f_data_n + filter_step_x_4];
                    acc += i_data[i_pos_x_n + in_image_step_x_5] * f_data[f_data_n + filter_step_x_5];   
                    acc += i_data[i_pos_x_n + in_image_step_x_6] * f_data[f_data_n + filter_step_x_6];
                    acc += i_data[i_pos_x_n + in_image_step_x_7] * f_data[f_data_n + filter_step_x_7];
                }
                for (; n < temp2 - x; n++) {
                    acc += i_data[i_pos_x + n * in_image_step_x] * f_data[filter_step_x * n];
                }
                f_data += f_step;
                i_pos_x += i_step;
            }
            i_pos_y += in_image_step_x;
            out_data[x * out_image_step_x + y_offset] = acc;
        }

        i_pos += i_step;
    }
    // Main image block
    i_pos = 0;
    for (int y = rest_y ; y < temp; y++ ) {
        int i_pos_y = i_pos;
        const int y_offset = y * o_step;
        for (int x = rest_x ; x < temp0; x++) {
            int i_pos_x = i_pos_y;
            float acc = 0;
            float *f_data =  filter_data;
            for (int m = 0 ; m < filter_size_y ; m++) {
                int n;
                for (n = 0 ; n < filter_size_x - 7; n+=8) {
                    const int i_pos_x_n = i_pos_x + n * in_image_step_x;
                    const int f_data_n = filter_step_x * n;
                    acc += i_data[i_pos_x_n] * f_data[f_data_n];
                    acc += i_data[i_pos_x_n + in_image_step_x] * f_data[f_data_n + filter_step_x];
                    acc += i_data[i_pos_x_n + in_image_step_x_2] * f_data[f_data_n + filter_step_x_2];
                    acc += i_data[i_pos_x_n + in_image_step_x_3] * f_data[f_data_n + filter_step_x_3];
                    acc += i_data[i_pos_x_n + in_image_step_x_4] * f_data[f_data_n + filter_step_x_4];
                    acc += i_data[i_pos_x_n + in_image_step_x_5] * f_data[f_data_n + filter_step_x_5];   
                    acc += i_data[i_pos_x_n + in_image_step_x_6] * f_data[f_data_n + filter_step_x_6];
                    acc += i_data[i_pos_x_n + in_image_step_x_7] * f_data[f_data_n + filter_step_x_7];
                }
                for (; n < filter_size_x; n++) {
                    acc += i_data[i_pos_x + n * in_image_step_x] * f_data[filter_step_x * n];
                }
                f_data += f_step;
                i_pos_x += i_step;
            }
            i_pos_y += in_image_step_x;
            out_data[x * out_image_step_x + y_offset] = acc;
        }
        i_pos += i_step;
    }
    return ESP_OK;
}

