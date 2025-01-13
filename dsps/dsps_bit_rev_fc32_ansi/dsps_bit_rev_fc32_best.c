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


/*
esp_err_t dsps_bit_rev_fc32_ansi(float *data, int N)
{
    if (!dsp_is_power_of_two(N)) {
        return ESP_ERR_DSP_INVALID_LENGTH;
    }
    esp_err_t result = ESP_OK;

    int j, k;
    float r_temp, i_temp;
    j = 0;
    
    // 确保N-1能被8整除
    int i;
    // 主循环展开8次
    for (i = 1; i < N - 2; i+=2) {
        // 第一次迭代
        k = N >> 1;
        while (k <= j) {
            j -= k;
            k >>= 1;
        }
        j += k;
        if (i < j) {
            r_temp = data[j * 2];
            i_temp = data[j * 2 + 1];
            data[j * 2] = data[i * 2];
            data[j * 2 + 1] = data[i * 2 + 1];
            data[i * 2] = r_temp;
            data[i * 2 + 1] = i_temp;
        }

        // 第二次迭代
        k = N >> 1;
        while (k <= j) {
            j -= k;
            k >>= 1;
        }
        j += k;
        if ((i+1) < j) {
            r_temp = data[j * 2];
            i_temp = data[j * 2 + 1];
            data[j * 2] = data[(i+1) * 2];
            data[j * 2 + 1] = data[(i+1) * 2 + 1];
            data[(i+1) * 2] = r_temp;
            data[(i+1) * 2 + 1] = i_temp;
        }

    }

    // 处理剩余的元素
    for (; i < (N - 1); i++) {
        k = N >> 1;
        while (k <= j) {
            j -= k;
            k >>= 1;
        }
        j += k;
        if (i < j) {
            r_temp = data[j * 2];
            i_temp = data[j * 2 + 1];
            data[j * 2] = data[i * 2];
            data[j * 2 + 1] = data[i * 2 + 1];
            data[i * 2] = r_temp;
            data[i * 2 + 1] = i_temp;
        }
    }
    
    return result;

}
*/

/*
esp_err_t dsps_bit_rev_fc32_ansi(float *data, int N)
{
    if (!dsp_is_power_of_two(N)) {
        return ESP_ERR_DSP_INVALID_LENGTH;
    }
    esp_err_t result = ESP_OK;

    int j, k;
    float r_temp, i_temp;
    j = 0;
    
    // 确保N-1能被8整除
    int i;
    // 主循环展开8次
    for (i = 1; i < N - 8; i+=8) {
        // 第一次迭代
        k = N >> 1;
        while (k <= j) {
            j -= k;
            k >>= 1;
        }
        j += k;
        if (i < j) {
            r_temp = data[j * 2];
            i_temp = data[j * 2 + 1];
            data[j * 2] = data[i * 2];
            data[j * 2 + 1] = data[i * 2 + 1];
            data[i * 2] = r_temp;
            data[i * 2 + 1] = i_temp;
        }

        // 第二次迭代
        k = N >> 1;
        while (k <= j) {
            j -= k;
            k >>= 1;
        }
        j += k;
        if ((i+1) < j) {
            r_temp = data[j * 2];
            i_temp = data[j * 2 + 1];
            data[j * 2] = data[(i+1) * 2];
            data[j * 2 + 1] = data[(i+1) * 2 + 1];
            data[(i+1) * 2] = r_temp;
            data[(i+1) * 2 + 1] = i_temp;
        }

        // 第三次迭代
        k = N >> 1;
        while (k <= j) {
            j -= k;
            k >>= 1;
        }
        j += k;
        if ((i+2) < j) {
            r_temp = data[j * 2];
            i_temp = data[j * 2 + 1];
            data[j * 2] = data[(i+2) * 2];
            data[j * 2 + 1] = data[(i+2) * 2 + 1];
            data[(i+2) * 2] = r_temp;
            data[(i+2) * 2 + 1] = i_temp;
        }

        // 第四次迭代
        k = N >> 1;
        while (k <= j) {
            j -= k;
            k >>= 1;
        }
        j += k;
        if ((i+3) < j) {
            r_temp = data[j * 2];
            i_temp = data[j * 2 + 1];
            data[j * 2] = data[(i+3) * 2];
            data[j * 2 + 1] = data[(i+3) * 2 + 1];
            data[(i+3) * 2] = r_temp;
            data[(i+3) * 2 + 1] = i_temp;
        }

        // 第五次迭代
        k = N >> 1;
        while (k <= j) {
            j -= k;
            k >>= 1;
        }
        j += k;
        if ((i+4) < j) {
            r_temp = data[j * 2];
            i_temp = data[j * 2 + 1];
            data[j * 2] = data[(i+4) * 2];
            data[j * 2 + 1] = data[(i+4) * 2 + 1];
            data[(i+4) * 2] = r_temp;
            data[(i+4) * 2 + 1] = i_temp;
        }

        // 第六次迭代
        k = N >> 1;
        while (k <= j) {
            j -= k;
            k >>= 1;
        }
        j += k;
        if ((i+5) < j) {
            r_temp = data[j * 2];
            i_temp = data[j * 2 + 1];
            data[j * 2] = data[(i+5) * 2];
            data[j * 2 + 1] = data[(i+5) * 2 + 1];
            data[(i+5) * 2] = r_temp;
            data[(i+5) * 2 + 1] = i_temp;
        }

        // 第七次迭代
        k = N >> 1;
        while (k <= j) {
            j -= k;
            k >>= 1;
        }
        j += k;
        if ((i+6) < j) {
            r_temp = data[j * 2];
            i_temp = data[j * 2 + 1];
            data[j * 2] = data[(i+6) * 2];
            data[j * 2 + 1] = data[(i+6) * 2 + 1];
            data[(i+6) * 2] = r_temp;
            data[(i+6) * 2 + 1] = i_temp;
        }

        // 第八次迭代
        k = N >> 1;
        while (k <= j) {
            j -= k;
            k >>= 1;
        }
        j += k;
        if ((i+7) < j) {
            r_temp = data[j * 2];
            i_temp = data[j * 2 + 1];
            data[j * 2] = data[(i+7) * 2];
            data[j * 2 + 1] = data[(i+7) * 2 + 1];
            data[(i+7) * 2] = r_temp;
            data[(i+7) * 2 + 1] = i_temp;
        }
    }

    // 处理剩余的元素
    for (; i < (N - 1); i++) {
        k = N >> 1;
        while (k <= j) {
            j -= k;
            k >>= 1;
        }
        j += k;
        if (i < j) {
            r_temp = data[j * 2];
            i_temp = data[j * 2 + 1];
            data[j * 2] = data[i * 2];
            data[j * 2 + 1] = data[i * 2 + 1];
            data[i * 2] = r_temp;
            data[i * 2 + 1] = i_temp;
        }
    }
    
    return result;
}
*/


// 添加内联函数声明
static inline void bit_rev_single_step(float *data, int i, int *j, int N1) {
    int k = N1;
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
    int N1 = N >> 1;
    for (i = 1; i < N - 8; i += 8) {
        bit_rev_single_step(data, i, &j, N1);
        bit_rev_single_step(data, i+1, &j, N1);
        bit_rev_single_step(data, i+2, &j, N1);
        bit_rev_single_step(data, i+3, &j, N1);
        bit_rev_single_step(data, i+4, &j, N1);
        bit_rev_single_step(data, i+5, &j, N1);
        bit_rev_single_step(data, i+6, &j, N1);
        bit_rev_single_step(data, i+7, &j, N1);
    }

    // 处理剩余的元素
    for (; i < (N - 1); i++) {
        bit_rev_single_step(data, i, &j, N1);
    }
    
    return result;
}

