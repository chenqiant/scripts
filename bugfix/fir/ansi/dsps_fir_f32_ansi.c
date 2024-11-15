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
esp_err_t dsps_fir_f32_ansi(fir_f32_t *fir, const float *input, float *output, int len)
{
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
    return ESP_OK;
}

