/*
 * SPDX-FileCopyrightText: 2023-2024 Espressif Systems (Shanghai) CO LTD
 *
 * SPDX-License-Identifier: Apache-2.0
 */


#include "dsps_add.h"


esp_err_t dsps_add_s16_ansi(const int16_t *input1, const int16_t *input2, int16_t *output, int len, int step1, int step2, int step_out, int shift)
{
    if (NULL == input1) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }
    if (NULL == input2) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }
    if (NULL == output) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }

    int i;

    for (i = 0; i < (len & -15); i += 16) {
        int32_t acc0 = (int32_t)input1[i * step1] + (int32_t)input2[i * step2];
        int32_t acc1 = (int32_t)input1[(i+1) * step1] + (int32_t)input2[(i+1) * step2];
        int32_t acc2 = (int32_t)input1[(i+2) * step1] + (int32_t)input2[(i+2) * step2];
        int32_t acc3 = (int32_t)input1[(i+3) * step1] + (int32_t)input2[(i+3) * step2];
        int32_t acc4 = (int32_t)input1[(i+4) * step1] + (int32_t)input2[(i+4) * step2];
        int32_t acc5 = (int32_t)input1[(i+5) * step1] + (int32_t)input2[(i+5) * step2];
        int32_t acc6 = (int32_t)input1[(i+6) * step1] + (int32_t)input2[(i+6) * step2];
        int32_t acc7 = (int32_t)input1[(i+7) * step1] + (int32_t)input2[(i+7) * step2];
        int32_t acc8 = (int32_t)input1[(i+8) * step1] + (int32_t)input2[(i+8) * step2];
        int32_t acc9 = (int32_t)input1[(i+9) * step1] + (int32_t)input2[(i+9) * step2];
        int32_t acc10 = (int32_t)input1[(i+10) * step1] + (int32_t)input2[(i+10) * step2];
        int32_t acc11 = (int32_t)input1[(i+11) * step1] + (int32_t)input2[(i+11) * step2];
        int32_t acc12 = (int32_t)input1[(i+12) * step1] + (int32_t)input2[(i+12) * step2];
        int32_t acc13 = (int32_t)input1[(i+13) * step1] + (int32_t)input2[(i+13) * step2];
        int32_t acc14 = (int32_t)input1[(i+14) * step1] + (int32_t)input2[(i+14) * step2];
        int32_t acc15 = (int32_t)input1[(i+15) * step1] + (int32_t)input2[(i+15) * step2];

        output[i * step_out] = acc0 >> shift;
        output[(i+1) * step_out] = acc1 >> shift;
        output[(i+2) * step_out] = acc2 >> shift;
        output[(i+3) * step_out] = acc3 >> shift;
        output[(i+4) * step_out] = acc4 >> shift;
        output[(i+5) * step_out] = acc5 >> shift;
        output[(i+6) * step_out] = acc6 >> shift;
        output[(i+7) * step_out] = acc7 >> shift;
        output[(i+8) * step_out] = acc8 >> shift;
        output[(i+9) * step_out] = acc9 >> shift;
        output[(i+10) * step_out] = acc10 >> shift;
        output[(i+11) * step_out] = acc11 >> shift;
        output[(i+12) * step_out] = acc12 >> shift;
        output[(i+13) * step_out] = acc13 >> shift;
        output[(i+14) * step_out] = acc14 >> shift;
        output[(i+15) * step_out] = acc15 >> shift;
    }
    // Handle remaining elements
    for (; i < len; i++) {
        int32_t acc = (int32_t)input1[i * step1] + (int32_t)input2[i * step2];
        output[i * step_out] = acc >> shift;
    }

    return ESP_OK;
}
