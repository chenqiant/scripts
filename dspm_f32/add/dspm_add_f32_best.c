/*
 * SPDX-FileCopyrightText: 2023 Espressif Systems (Shanghai) CO LTD
 *
 * SPDX-License-Identifier: Apache-2.0
 */


#include "dspm_add.h"

esp_err_t dspm_add_f32_ansi(const float *input1, const float *input2, float *output, int rows, int cols, int padd1, int padd2, int padd_out, int step1, int step2, int step_out)
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

    if (rows <= 0) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }
    if (cols <= 0) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }

    if (padd1 < 0) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }
    if (padd2 < 0) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }
    if (padd_out < 0) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }

    if (step1 <= 0) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }
    if (step2 <= 0) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }
    if (step_out <= 0) {
        return ESP_ERR_DSP_PARAM_OUTOFRANGE;
    }

    const int ptr_input1_step = cols + padd1;
    const int ptr_input2_step = cols + padd2;
    const int ptr_output_step = cols + padd_out;
    float *ptr_input1 = (float *)input1;
    float *ptr_input2 = (float *)input2;

    for (int row = 0; row < rows; row++) {
        int col = 0;
        for (; col < cols - 7; col += 8) {
            output[col * step_out] = ptr_input1[col * step1] + ptr_input2[col * step2];
            output[(col + 1) * step_out] = ptr_input1[(col + 1) * step1] + ptr_input2[(col + 1) * step2];
            output[(col + 2) * step_out] = ptr_input1[(col + 2) * step1] + ptr_input2[(col + 2) * step2];
            output[(col + 3) * step_out] = ptr_input1[(col + 3) * step1] + ptr_input2[(col + 3) * step2];
            output[(col + 4) * step_out] = ptr_input1[(col + 4) * step1] + ptr_input2[(col + 4) * step2];
            output[(col + 5) * step_out] = ptr_input1[(col + 5) * step1] + ptr_input2[(col + 5) * step2];
            output[(col + 6) * step_out] = ptr_input1[(col + 6) * step1] + ptr_input2[(col + 6) * step2];
            output[(col + 7) * step_out] = ptr_input1[(col + 7) * step1] + ptr_input2[(col + 7) * step2];
        }   
        for (; col < cols; col++) {
            output[col * step_out] = ptr_input1[col * step1] + ptr_input2[col * step2];
        }
        ptr_input1 += ptr_input1_step;
        ptr_input2 += ptr_input2_step;
        output += ptr_output_step;
    }
    return ESP_OK;
}
