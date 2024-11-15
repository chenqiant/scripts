#include "dsps_dct.h"
#include <math.h>

esp_err_t dsps_dct_f32_ref2(float *data, int N, float *result)
{
    double factor = M_PI / N;
    double cosine_factors[N];
    for (int j = 0; j < N; j++) {
        cosine_factors[j] = (j + 0.5f) * factor; // 预先计算因子
    }

    for (int i = 0; i < N; i++) {
        float sum = 0.0f;
        for (int j = 0; j < N; j++) {
             sum += data[j] * cosf(cosine_factors[j] * i); // 计算求和
        }
        result[i] = sum;
    }
    return ESP_OK;
}