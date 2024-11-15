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

esp_err_t dsps_fir_f32_ansi(fir_f32_t *restrict fir, const float *restrict input, float *restrict output, const int len) {
   if(len > 2){
        for (int i = 0; i < len; i++) {
            float acc0 = 0, acc1 = 0, acc2 = 0, acc3 = 0;
            float acc4 = 0, acc5 = 0, acc6 = 0, acc7 = 0;
            
            int coeff_pos = 0;
            fir->delay[fir->pos] = input[i];
            fir->pos++;
            if (fir->pos >= fir->N) {
                fir->pos = 0;
            }

            // Unrolled loop for first part
            int n;
            for (n = fir->pos; n < fir->N - 7; n += 8) {
                acc0 += fir->coeffs[coeff_pos++] * fir->delay[n];
                acc1 += fir->coeffs[coeff_pos++] * fir->delay[n + 1];
                acc2 += fir->coeffs[coeff_pos++] * fir->delay[n + 2];
                acc3 += fir->coeffs[coeff_pos++] * fir->delay[n + 3];
                acc4 += fir->coeffs[coeff_pos++] * fir->delay[n + 4];
                acc5 += fir->coeffs[coeff_pos++] * fir->delay[n + 5];
                acc6 += fir->coeffs[coeff_pos++] * fir->delay[n + 6];
                acc7 += fir->coeffs[coeff_pos++] * fir->delay[n + 7];
            }

            // Handle remaining elements in first part
            for (; n < fir->N; n++) {
                acc0 += fir->coeffs[coeff_pos++] * fir->delay[n];
            }

            // Unrolled loop for second part
            for (n = 0; n < fir->pos - 7; n += 8) {
                acc0 += fir->coeffs[coeff_pos++] * fir->delay[n];
                acc1 += fir->coeffs[coeff_pos++] * fir->delay[n + 1];
                acc2 += fir->coeffs[coeff_pos++] * fir->delay[n + 2];
                acc3 += fir->coeffs[coeff_pos++] * fir->delay[n + 3];
                acc4 += fir->coeffs[coeff_pos++] * fir->delay[n + 4];
                acc5 += fir->coeffs[coeff_pos++] * fir->delay[n + 5];
                acc6 += fir->coeffs[coeff_pos++] * fir->delay[n + 6];
                acc7 += fir->coeffs[coeff_pos++] * fir->delay[n + 7];
            }

            // Handle remaining elements in second part
            for (; n < fir->pos; n++) {
                acc0 += fir->coeffs[coeff_pos++] * fir->delay[n];
            }

            // Combine partial results
            output[i] = acc0 + acc1 + acc2 + acc3 + acc4 + acc5 + acc6 + acc7;
        }
    }
    else{
        for (int i = 0 ; i < len ; i++) {
            float acc = 0;
            int coeff_pos = 0;
            fir->delay[fir->pos] = input[i];
            fir->pos++;
            if (fir->pos >= fir->N) {
                fir->pos = 0;
            }
            for (int n = fir->pos; n < fir->N ; n++) {
                acc += fir->coeffs[coeff_pos++] * fir->delay[n];
            }
            for (int n = 0; n < fir->pos ; n++) {
                acc += fir->coeffs[coeff_pos++] * fir->delay[n];
            }
            output[i] = acc;
        }        
    }
    return ESP_OK;
}