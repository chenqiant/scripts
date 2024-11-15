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

typedef signed short int __int16_t;
typedef __int16_t int16_t;
typedef struct fir_f32_s {
    float  *coeffs;     /*!< Pointer to the coefficient buffer.*/
    float  *delay;      /*!< Pointer to the delay line buffer.*/
    int     N;          /*!< FIR filter coefficients amount.*/
    int     pos;        /*!< Position in delay line.*/
    int     decim;      /*!< Decimation factor.*/
    int16_t use_delay;  /*!< The delay line was allocated by init function.*/
} fir_f32_t;

typedef int esp_err_t;
#define ESP_OK 0

int dsps_fird_f32_ansi(fir_f32_t *restrict fir, const float *restrict input, float *restrict output, int len)
{

    int result = 0;
    for (int i = 0; i < len; i++) {
            for (int k = 0 ; k < fir->decim ; k++) {
                fir->delay[fir->pos++] = *input++;
                if (fir->pos >= fir->N) {
                    fir->pos = 0;
                }
            }            
            // int m = fir->pos;
            // for(int k = 0; k < fir->decim - 7 ; k+=8){
            //     fir->delay[m] = input[k];
            //     if (m >= fir->N) {
            //         m = 0;
            //     }
            //     fir->delay[m+1] = input[k+1];
            //     if (m+1 >= fir->N) {
            //         m = -1;
            //     }
            //     fir->delay[m+2] = input[k+2];
            //     if (m+2 >= fir->N) {
            //         m = -2;
            //     }
            //     fir->delay[m+3] = input[k+3];
            //     if (m+3 >= fir->N) {
            //         m = -3;
            //     }
            //     fir->delay[m+4] = input[k+4];
            //     if (m+4 >= fir->N) {
            //         m = -4;
            //     }
            //     fir->delay[m+5] = input[k+5];
            //     if (m+5 >= fir->N) {
            //         m = -5;
            //     }
            //     fir->delay[m+6] = input[k+6];
            //     if (m+6 >= fir->N) {
            //         m = -6;
            //     }
            //     fir->delay[m+7] = input[k+7];
            //     if (m+7 >= fir->N) {
            //         m = -7;
            //     }
            //     m+=8;
            // }

            float acc0 = 0, acc1 = 0, acc2 = 0, acc3 = 0;
            float acc4 = 0, acc5 = 0, acc6 = 0, acc7 = 0;
            int coeff_pos = 0;
            int n;

            // 第一部分卷积计算，展开8次
            for (n = fir->pos; n < fir-> N - 7; n += 8) {
                acc0 += fir->coeffs[coeff_pos] * fir->delay[n];
                acc1 += fir->coeffs[coeff_pos + 1] * fir->delay[n + 1];
                acc2 += fir->coeffs[coeff_pos + 2] * fir->delay[n + 2];
                acc3 += fir->coeffs[coeff_pos + 3] * fir->delay[n + 3];
                acc4 += fir->coeffs[coeff_pos + 4] * fir->delay[n + 4];
                acc5 += fir->coeffs[coeff_pos + 5] * fir->delay[n + 5];
                acc6 += fir->coeffs[coeff_pos + 6] * fir->delay[n + 6];
                acc7 += fir->coeffs[coeff_pos + 7] * fir->delay[n + 7];
                coeff_pos += 8;
            }

            // 处理剩余的元素
            for (; n < fir->N; n++) {
                acc0 += fir->coeffs[coeff_pos++] * fir->delay[n];
            }

            // 第二部分卷积计算，从延迟线开始到pos位置
            for (n = 0; n < fir->pos - 7; n += 8) {
                acc0 += fir->coeffs[coeff_pos] * fir->delay[n];
                acc1 += fir->coeffs[coeff_pos + 1] * fir->delay[n + 1];
                acc2 += fir->coeffs[coeff_pos + 2] * fir->delay[n + 2];
                acc3 += fir->coeffs[coeff_pos + 3] * fir->delay[n + 3];
                acc4 += fir->coeffs[coeff_pos + 4] * fir->delay[n + 4];
                acc5 += fir->coeffs[coeff_pos + 5] * fir->delay[n + 5];
                acc6 += fir->coeffs[coeff_pos + 6] * fir->delay[n + 6];
                acc7 += fir->coeffs[coeff_pos + 7] * fir->delay[n + 7];
                coeff_pos += 8;
            }

            // 处理剩余的元素
            for (; n < fir->pos; n++) {
                acc0 += fir->coeffs[coeff_pos++] * fir->delay[n];
            }

            output[result++] = acc0 + acc1 + acc2 + acc3 + acc4 + acc5 + acc6 + acc7;
    }        
    return result;
}