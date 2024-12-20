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

int dsps_fird_f32_ansi(fir_f32_t *fir, const float *input, float *output, int len)
{
    int result = 0;
    for (int i = 0; i < len ; i++) {
        for (int k = 0 ; k < fir->decim ; k++) {
            fir->delay[fir->pos++] = *input++;
            if (fir->pos >= fir->N) {
                fir->pos = 0;
            }
        }
        float acc = 0;
        int coeff_pos = 0;
        for (int n = fir->pos; n < fir->N ; n++) {
            acc += fir->coeffs[coeff_pos++] * fir->delay[n];
        }
        for (int n = 0; n < fir->pos ; n++) {
            acc += fir->coeffs[coeff_pos++] * fir->delay[n];
        }
        output[result++] = acc;
    }
    return result;
}
