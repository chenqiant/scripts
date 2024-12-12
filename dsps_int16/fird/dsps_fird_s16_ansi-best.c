/*
 * SPDX-FileCopyrightText: 2022-2023 Espressif Systems (Shanghai) CO LTD
 *
 * SPDX-License-Identifier: Apache-2.0
 */

typedef signed short int __int16_t;
typedef __int16_t int16_t;
typedef signed int __int32_t;
typedef __int32_t int32_t;
typedef struct fir_s16_s {
    int16_t    *coeffs;         /*!< Pointer to the coefficient buffer.*/
    int16_t    *delay;          /*!< Pointer to the delay line buffer.*/
    int16_t     coeffs_len;     /*!< FIR filter coefficients amount.*/
    int16_t     pos;            /*!< Position in delay line.*/
    int16_t     decim;          /*!< Decimation factor.*/
    int16_t     d_pos;          /*!< Actual decimation counter.*/
    int16_t     shift;          /*!< Shift value of the result.*/
    int32_t    *rounding_buff;  /*!< Rounding buffer for the purposes of esp32s3 ee.ld.accx.ip assembly instruction */
    int32_t     rounding_val;   /*!< Rounding value*/
    int16_t     free_status;    /*!< Indicator for dsps_fird_s16_aes3_free() function*/
} fir_s16_t;


typedef int esp_err_t;
#define ESP_OK 0

int32_t dsps_fird_s16_ansi(fir_s16_t *fir, const int16_t *input, int16_t *output, int32_t len)
{
    int32_t result = 0;
    int32_t input_pos = 0;
    long long rounding = 0;
    const int32_t final_shift = fir->shift - 15;

    rounding = (long long)(fir->rounding_val);

    if (fir->shift >= 0) {
        rounding = (rounding >> fir->shift) & 0xFFFFFFFFFF;         // 40-bit mask
    } else {
        rounding = (rounding << (-fir->shift)) & 0xFFFFFFFFFF;      // 40-bit mask
    }

    // 将循环不变量提到外部
    const int16_t coeffs_len = fir->coeffs_len;
    const int16_t decim = fir->decim;
    const int16_t* coeffs = fir->coeffs;
    int16_t* delay = fir->delay;

    // len is already a length of the *output array, calculated as (length of the input array / decimation)
    for (int i = 0; i < len; i++) {

        for (int j = 0; j < decim - fir->d_pos; j++) {

            if (fir->pos >= coeffs_len) {
                fir->pos = 0;
            }
            delay[fir->pos++] = input[input_pos++];
        }
        fir->d_pos = 0;

        long long acc = rounding;
        int16_t coeff_pos = coeffs_len - 1;

        // First loop unrolled by 8
        int n;
        for (n = fir->pos; n < coeffs_len - 15; n += 16) {
            acc += (int32_t)coeffs[coeff_pos] * (int32_t)delay[n];
            acc += (int32_t)coeffs[coeff_pos-1] * (int32_t)delay[n+1];
            acc += (int32_t)coeffs[coeff_pos-2] * (int32_t)delay[n+2];
            acc += (int32_t)coeffs[coeff_pos-3] * (int32_t)delay[n+3];
            acc += (int32_t)coeffs[coeff_pos-4] * (int32_t)delay[n+4];
            acc += (int32_t)coeffs[coeff_pos-5] * (int32_t)delay[n+5];
            acc += (int32_t)coeffs[coeff_pos-6] * (int32_t)delay[n+6];
            acc += (int32_t)coeffs[coeff_pos-7] * (int32_t)delay[n+7];
            acc += (int32_t)coeffs[coeff_pos-8] * (int32_t)delay[n+8];
            acc += (int32_t)coeffs[coeff_pos-9] * (int32_t)delay[n+9];
            acc += (int32_t)coeffs[coeff_pos-10] * (int32_t)delay[n+10];
            acc += (int32_t)coeffs[coeff_pos-11] * (int32_t)delay[n+11];
            acc += (int32_t)coeffs[coeff_pos-12] * (int32_t)delay[n+12];
            acc += (int32_t)coeffs[coeff_pos-13] * (int32_t)delay[n+13];
            acc += (int32_t)coeffs[coeff_pos-14] * (int32_t)delay[n+14];
            acc += (int32_t)coeffs[coeff_pos-15] * (int32_t)delay[n+15];
            coeff_pos -= 16;
        }
        for (; n < coeffs_len; n++) {
            acc += (int32_t)coeffs[coeff_pos--] * (int32_t)delay[n];
        }

        for (n = 0; n < fir->pos - 15; n += 16) {
            acc += (int32_t)coeffs[coeff_pos] * (int32_t)delay[n];
            acc += (int32_t)coeffs[coeff_pos-1] * (int32_t)delay[n+1];
            acc += (int32_t)coeffs[coeff_pos-2] * (int32_t)delay[n+2];
            acc += (int32_t)coeffs[coeff_pos-3] * (int32_t)delay[n+3];
            acc += (int32_t)coeffs[coeff_pos-4] * (int32_t)delay[n+4];
            acc += (int32_t)coeffs[coeff_pos-5] * (int32_t)delay[n+5];
            acc += (int32_t)coeffs[coeff_pos-6] * (int32_t)delay[n+6];
            acc += (int32_t)coeffs[coeff_pos-7] * (int32_t)delay[n+7];
            acc += (int32_t)coeffs[coeff_pos-8] * (int32_t)delay[n+8];
            acc += (int32_t)coeffs[coeff_pos-9] * (int32_t)delay[n+9];
            acc += (int32_t)coeffs[coeff_pos-10] * (int32_t)delay[n+10];
            acc += (int32_t)coeffs[coeff_pos-11] * (int32_t)delay[n+11];
            acc += (int32_t)coeffs[coeff_pos-12] * (int32_t)delay[n+12];
            acc += (int32_t)coeffs[coeff_pos-13] * (int32_t)delay[n+13];
            acc += (int32_t)coeffs[coeff_pos-14] * (int32_t)delay[n+14];
            acc += (int32_t)coeffs[coeff_pos-15] * (int32_t)delay[n+15];
            coeff_pos -= 16;
        }
        for (; n < fir->pos; n++) {
            acc += (int32_t)coeffs[coeff_pos--] * (int32_t)delay[n];
        }

        if (final_shift > 0) {
            output[result++] = (int16_t)(acc << final_shift);
        } else {
            output[result++] = (int16_t)(acc >> (-final_shift));
        }

    }

    return result;
}