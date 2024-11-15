#include "dsps_dct.h"
#include <math.h>

esp_err_t dsps_dct_f32_ref(float *restrict data, int N, float *restrict result)
{
    float factor = M_PI / N;
    float cosine_factors[N];
    size_t j;
    for (j = 0; j < N - 7; j += 8) {
        cosine_factors[j] = (j + 0.5f) * factor;
        cosine_factors[j+1] = (j + 1.5f) * factor;
        cosine_factors[j+2] = (j + 2.5f) * factor;
        cosine_factors[j+3] = (j + 3.5f) * factor;
        cosine_factors[j+4] = (j + 4.5f) * factor;
        cosine_factors[j+5] = (j + 5.5f) * factor;
        cosine_factors[j+6] = (j + 6.5f) * factor;
        cosine_factors[j+7] = (j + 7.5f) * factor;
    }

    // Handle remaining elements
    for (; j < N; j++) {
        cosine_factors[j] = (j + 0.5f) * factor;
    }    

    for (size_t i = 0; i < N; i++) {
        float sum0 = 0.0f, sum1 = 0.0f, sum2 = 0.0f, sum3 = 0.0f;
        float sum4 = 0.0f, sum5 = 0.0f, sum6 = 0.0f, sum7 = 0.0f;
        size_t j;
        for (j = 0; j < N - 7; j += 8) {
            sum0 += data[j] * cosf(cosine_factors[j] * i);
            sum1 += data[j+1] * cosf(cosine_factors[j+1] * i);
            sum2 += data[j+2] * cosf(cosine_factors[j+2] * i);
            sum3 += data[j+3] * cosf(cosine_factors[j+3] * i);
            sum4 += data[j+4] * cosf(cosine_factors[j+4] * i);
            sum5 += data[j+5] * cosf(cosine_factors[j+5] * i);
            sum6 += data[j+6] * cosf(cosine_factors[j+6] * i);
            sum7 += data[j+7] * cosf(cosine_factors[j+7] * i);
        }

        // 处理剩余元素
        for (; j < N; j++) {
            sum0 += data[j] * cosf(cosine_factors[j] * i);
        }
        result[i] = sum0 + sum1 + sum2 + sum3 + sum4 + sum5 + sum6 + sum7;
    }
    return ESP_OK;
}