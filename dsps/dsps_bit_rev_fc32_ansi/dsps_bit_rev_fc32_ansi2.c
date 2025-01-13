#include <stdint.h>
#include <stdbool.h>

#define DSP_OK                          0 // For internal use only. Please use ESP_OK instead
#define ESP_ERR_DSP_BASE                0x70000
#define ESP_ERR_DSP_INVALID_LENGTH      (ESP_ERR_DSP_BASE + 1)
#define ESP_ERR_DSP_UNINITIALIZED       (ESP_ERR_DSP_BASE + 4)

extern uint8_t dsps_fft2r_initialized;
// uint8_t dsps_fft2r_initialized;
bool dsp_is_power_of_two(int x);
typedef int esp_err_t;
#define ESP_OK 0

static __attribute__((noinline)) void bit_rev_single_step(float *data, int i, int *j, int N) {
    int k = N >> 1;
    while (k <= *j) {
        *j -= k;
        k >>= 1;
    }
    *j += k;
    if (i < *j) {
        float r_temp = data[*j * 2];
        float i_temp = data[*j * 2 + 1];
        data[*j * 2] = data[i * 2];
        data[*j * 2 + 1] = data[i * 2 + 1];
        data[i * 2] = r_temp;
        data[i * 2 + 1] = i_temp;
    }
}

esp_err_t dsps_bit_rev_fc32_ansi(float *data, int N)
{
    if (!dsp_is_power_of_two(N)) {
        return ESP_ERR_DSP_INVALID_LENGTH;
    }

    esp_err_t result = ESP_OK;

    int j = 0;
    int i;
    // 主循环展开8次
    for (i = 1; i < N - 8; i += 8) {
        bit_rev_single_step(data, i, &j, N);
        bit_rev_single_step(data, i+1, &j, N);
        bit_rev_single_step(data, i+2, &j, N);
        bit_rev_single_step(data, i+3, &j, N);
        bit_rev_single_step(data, i+4, &j, N);
        bit_rev_single_step(data, i+5, &j, N);
        bit_rev_single_step(data, i+6, &j, N);
        bit_rev_single_step(data, i+7, &j, N);
    }

    // 处理剩余的元素
    for (; i < (N - 1); i++) {
        bit_rev_single_step(data, i, &j, N);
    }
    return result;
}