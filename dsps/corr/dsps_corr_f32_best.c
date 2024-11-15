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

#include "dsps_corr.h"

esp_err_t dsps_corr_f32_ansi(const float *Signal, const int siglen, const float *Pattern, const int patlen, float *dest)
{
    if (NULL == Signal || NULL == Pattern || NULL == dest || siglen < patlen) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }

    const int len = siglen - patlen;
    // const int unroll_factor = 16;

    int n;
    if(len > 2){
        for (n = 0; n < len - 15; n += 16) {
            float k_corr0 = 0, k_corr1 = 0, k_corr2 = 0, k_corr3 = 0;
            float k_corr4 = 0, k_corr5 = 0, k_corr6 = 0, k_corr7 = 0;
            float k_corr8 = 0, k_corr9 = 0, k_corr10 = 0, k_corr11 = 0;
            float k_corr12 = 0, k_corr13 = 0, k_corr14 = 0, k_corr15 = 0;
            for (int m = 0; m < patlen; m++) {
                float pattern_val = Pattern[m];
                k_corr0 += Signal[n + m] * pattern_val;
                k_corr1 += Signal[n + m + 1] * pattern_val;
                k_corr2 += Signal[n + m + 2] * pattern_val;
                k_corr3 += Signal[n + m + 3] * pattern_val;
                k_corr4 += Signal[n + m + 4] * pattern_val;
                k_corr5 += Signal[n + m + 5] * pattern_val;
                k_corr6 += Signal[n + m + 6] * pattern_val;
                k_corr7 += Signal[n + m + 7] * pattern_val;
                k_corr8 += Signal[n + m + 8] * pattern_val;
                k_corr9 += Signal[n + m + 9] * pattern_val;
                k_corr10 += Signal[n + m + 10] * pattern_val;
                k_corr11 += Signal[n + m + 11] * pattern_val;
                k_corr12 += Signal[n + m + 12] * pattern_val;
                k_corr13 += Signal[n + m + 13] * pattern_val;
                k_corr14 += Signal[n + m + 14] * pattern_val;
                k_corr15 += Signal[n + m + 15] * pattern_val;
            }
            dest[n] = k_corr0;
            dest[n + 1] = k_corr1;
            dest[n + 2] = k_corr2;
            dest[n + 3] = k_corr3;
            dest[n + 4] = k_corr4;
            dest[n + 5] = k_corr5;
            dest[n + 6] = k_corr6;
            dest[n + 7] = k_corr7;
            dest[n + 8] = k_corr8;
            dest[n + 9] = k_corr9;
            dest[n + 10] = k_corr10;
            dest[n + 11] = k_corr11;
            dest[n + 12] = k_corr12;
            dest[n + 13] = k_corr13;
            dest[n + 14] = k_corr14;
            dest[n + 15] = k_corr15;
        }

        for (; n <= len; n++) {
            float k_corr = 0;
            for (int m = 0; m < patlen; m++) {
                k_corr += Signal[n + m] * Pattern[m];
            }
            dest[n] = k_corr;
        }
    }
    else{
        for (size_t n = 0; n <= len; n++) {
            float k_corr = 0;
            for (size_t m = 0; m < patlen; m++) {
                k_corr += Signal[n + m] * Pattern[m];
            }
            dest[n] = k_corr;
        }
    }

    return ESP_OK;
}

