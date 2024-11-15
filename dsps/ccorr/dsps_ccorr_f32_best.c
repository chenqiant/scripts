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

#include "dsps_ccorr.h"
#include "esp_log.h"

// static const char *TAG = "dsps_conv";

// esp_err_t dsps_ccorr_f32_ansi(const float * Signal, const int siglen, const float * Kernel, const int kernlen, float * corrvout)
// {
//     if (NULL == Signal) {
//         return ESP_ERR_DSP_PARAM_OUTOFRANGE;
//     }
//     if (NULL == Kernel) {
//         return ESP_ERR_DSP_PARAM_OUTOFRANGE;
//     }
//     if (NULL == corrvout) {
//         return ESP_ERR_DSP_PARAM_OUTOFRANGE;
//     }

//     float *sig = (float *)Signal;
//     float *kern = (float *)Kernel;
//     int lsig = siglen;
//     int lkern = kernlen;

//     if (siglen < kernlen) {
//         sig = (float *)Kernel;
//         kern = (float *)Signal;
//         lsig = kernlen;
//         lkern = siglen;
//     }

//     for (int n = 0; n < lkern; n++) {
//         size_t k;
//         size_t kmin = lkern - 1 - n;
//         corrvout[n] = 0;

//         for (k = 0; k <= n; k++) {
//             corrvout[n] += sig[k] * kern[kmin + k];
//         }
//         // ESP_LOGV(TAG, "L1 k = %i, n = %i , kmin= %i, kmax= %i", 0, n, kmin, kmin + n);
//     }
//     for (int n = lkern; n < lsig; n++) {
//         size_t kmin, kmax, k;

//         corrvout[n] = 0;

//         kmin = n - lkern + 1;
//         kmax = n;
//         for (k = kmin; k <= kmax; k++) {
//             corrvout[n] += sig[k] * kern[k - kmin];
//         }
//         // ESP_LOGV(TAG, "L2 n=%i, kmin = %i, kmax = %i , k-kmin = %i", n, kmin, kmax, 0);
//     }

//     for (int n = lsig; n < lsig + lkern - 1; n++) {
//         size_t kmin, kmax, k;

//         corrvout[n] = 0;

//         kmin = n - lkern + 1;
//         kmax =  lsig - 1;

//         for (k = kmin; k <= kmax; k++) {
//             corrvout[n] += sig[k] * kern[k - kmin];
//         }
//         // ESP_LOGV(TAG, "L3 n=%i, kmin = %i, kmax = %i , k - kmin = %i", n, kmin, kmax, kmax - kmin);
//     }
//     return ESP_OK;
// }

esp_err_t dsps_ccorr_f32_ansi(const float *restrict Signal, const int siglen, const float *restrict Kernel, const int kernlen, float *restrict corrvout)
{
    if (NULL == Signal) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }
    if (NULL == Kernel) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }
    if (NULL == corrvout) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }

    float *sig = (float *)Signal;
    float *kern = (float *)Kernel;
    int lsig = siglen;
    int lkern = kernlen;

    if (siglen < kernlen) {
        sig = (float *)Kernel;
        kern = (float *)Signal;
        lsig = kernlen;
        lkern = siglen;
    }

    for (int n = 0; n < lkern; n++) {
        size_t k;
        size_t kmin = lkern - 1 - n;
        float sum0 = 0, sum1 = 0, sum2 = 0, sum3 = 0;
        float sum4 = 0, sum5 = 0, sum6 = 0, sum7 = 0;
        int limit = n - (n % 8); // 计算主循环边界

        for (k = 0; k < limit; k += 8) {
            sum0 += sig[k] * kern[kmin + k];
            sum1 += sig[k+1] * kern[kmin + k + 1];
            sum2 += sig[k+2] * kern[kmin + k + 2];
            sum3 += sig[k+3] * kern[kmin + k + 3];
            sum4 += sig[k+4] * kern[kmin + k + 4];
            sum5 += sig[k+5] * kern[kmin + k + 5];
            sum6 += sig[k+6] * kern[kmin + k + 6];
            sum7 += sig[k+7] * kern[kmin + k + 7];
        }
        
        for (; k <= n; k++) {
            sum0 += sig[k] * kern[kmin + k];
        }
        
        corrvout[n] = sum0 + sum1 + sum2 + sum3 + sum4 + sum5 + sum6 + sum7;
        // ESP_LOGV(TAG, "L1 k = %i, n = %i , kmin= %i, kmax= %i", 0, n, kmin, kmin + n);
    }
    for (int n = lkern; n < lsig; n++) {
        size_t kmin, kmax, k;
        float sum0 = 0, sum1 = 0, sum2 = 0, sum3 = 0;
        float sum4 = 0, sum5 = 0, sum6 = 0, sum7 = 0;
        float sum8 = 0, sum9 = 0, sum10 = 0, sum11 = 0;
        float sum12 = 0, sum13 = 0, sum14 = 0, sum15 = 0;

        kmin = n - lkern + 1;
        kmax = n;
        int limit = kmax - ((kmax - kmin + 1) % 16);

        for (k = kmin; k < limit; k += 16) {
            sum0 += sig[k] * kern[k - kmin];
            sum1 += sig[k+1] * kern[k+1 - kmin];
            sum2 += sig[k+2] * kern[k+2 - kmin];
            sum3 += sig[k+3] * kern[k+3 - kmin];
            sum4 += sig[k+4] * kern[k+4 - kmin];
            sum5 += sig[k+5] * kern[k+5 - kmin];
            sum6 += sig[k+6] * kern[k+6 - kmin];
            sum7 += sig[k+7] * kern[k+7 - kmin];
            sum8 += sig[k+8] * kern[k+8 - kmin];
            sum9 += sig[k+9] * kern[k+9 - kmin];
            sum10 += sig[k+10] * kern[k+10 - kmin];
            sum11 += sig[k+11] * kern[k+11 - kmin];
            sum12 += sig[k+12] * kern[k+12 - kmin];
            sum13 += sig[k+13] * kern[k+13 - kmin];
            sum14 += sig[k+14] * kern[k+14 - kmin];
            sum15 += sig[k+15] * kern[k+15 - kmin];
        }

        for (; k <= kmax; k++) {
            sum0 += sig[k] * kern[k - kmin];
        }

        corrvout[n] = sum0 + sum1 + sum2 + sum3 + sum4 + sum5 + sum6 + sum7 +
                      sum8 + sum9 + sum10 + sum11 + sum12 + sum13 + sum14 + sum15;
        // ESP_LOGV(TAG, "L2 n=%i, kmin = %i, kmax = %i , k-kmin = %i", n, kmin, kmax, 0);
    }

    for (int n = lsig; n < lsig + lkern - 1; n++) {
        size_t kmin, kmax, k;
        float sum0 = 0, sum1 = 0, sum2 = 0, sum3 = 0;
        float sum4 = 0, sum5 = 0, sum6 = 0, sum7 = 0;

        kmin = n - lkern + 1;
        kmax = lsig - 1;
        int limit = kmax - ((kmax - kmin + 1) % 8);

        for (k = kmin; k < limit; k += 8) {
            sum0 += sig[k] * kern[k - kmin];
            sum1 += sig[k+1] * kern[k+1 - kmin];
            sum2 += sig[k+2] * kern[k+2 - kmin];
            sum3 += sig[k+3] * kern[k+3 - kmin];
            sum4 += sig[k+4] * kern[k+4 - kmin];
            sum5 += sig[k+5] * kern[k+5 - kmin];
            sum6 += sig[k+6] * kern[k+6 - kmin];
            sum7 += sig[k+7] * kern[k+7 - kmin];
        }

        for (; k <= kmax; k++) {
            sum0 += sig[k] * kern[k - kmin];
        }

        corrvout[n] = sum0 + sum1 + sum2 + sum3 + sum4 + sum5 + sum6 + sum7;
        // ESP_LOGV(TAG, "L3 n=%i, kmin = %i, kmax = %i , k - kmin = %i", n, kmin, kmax, kmax - kmin);
    }
    return ESP_OK;
}
