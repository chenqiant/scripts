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
esp_err_t dsps_fft2r_fc32_arp4_(float *data, int N, float *w)
{
    if (!dsp_is_power_of_two(N)) {
        return ESP_ERR_DSP_INVALID_LENGTH;
    }
    if (!dsps_fft2r_initialized) {
        return ESP_ERR_DSP_UNINITIALIZED;
    }

    esp_err_t result = ESP_OK;

    int ie, ia, m;
    float re_temp, im_temp;
    float c, s;
    float data_ia_re, data_ia_im, data_m_re, data_m_im;
    ie = 1;
    for (int N2 = N / 2; N2 > 0; N2 >>= 1) {
        ia = 0;
        for (int j = 0; j < ie; j++) {
            c = w[2 * j];
            s = w[2 * j + 1];
            for (int i = 0; i < N2; i++) {
                m = ia + N2;
                // 缓存数组访问
                data_ia_re = data[2 * ia];
                data_ia_im = data[2 * ia + 1];
                data_m_re = data[2 * m];
                data_m_im = data[2 * m + 1];
                re_temp = c * data_m_re + s * data_m_im;
                im_temp = c * data_m_im - s * data_m_re;
                data[2 * m] = data_ia_re - re_temp;
                data[2 * m + 1] = data_ia_im - im_temp;
                data[2 * ia] = data_ia_re + re_temp;
                data[2 * ia + 1] = data_ia_im + im_temp;
                ia++;
            }
            ia += N2;
        }
        ie <<= 1;
    }
    return result;
}
*/


esp_err_t dsps_fft2r_fc32_arp4_(float *data, int N, float *w)
{
    if (!dsp_is_power_of_two(N)) {
        return ESP_ERR_DSP_INVALID_LENGTH;
    }
    if (!dsps_fft2r_initialized) {
        return ESP_ERR_DSP_UNINITIALIZED;
    }

    esp_err_t result = ESP_OK;

    int ie, ia, m;
    float re_temp, im_temp;
    float c, s;
    float data_ia_re, data_ia_im, data_m_re, data_m_im;
    ie = 1;
    for (int N2 = N / 2; N2 > 0; N2 >>= 1) {
        ia = 0;
        for (int j = 0; j < ie; j++) {
            c = w[2 * j];
            s = w[2 * j + 1];
            int i;
            for (i = 0; i < N2 - 3; i += 4) {
                // 第一次迭代
                m = ia + N2;
                data_ia_re = data[2 * ia];
                data_ia_im = data[2 * ia + 1];
                data_m_re = data[2 * m];
                data_m_im = data[2 * m + 1];
                re_temp = c * data_m_re + s * data_m_im;
                im_temp = c * data_m_im - s * data_m_re;
                data[2 * m] = data_ia_re - re_temp;
                data[2 * m + 1] = data_ia_im - im_temp;
                data[2 * ia] = data_ia_re + re_temp;
                data[2 * ia + 1] = data_ia_im + im_temp;
                ia++;

                // 第二次迭代
                m = ia + N2;
                data_ia_re = data[2 * ia];
                data_ia_im = data[2 * ia + 1];
                data_m_re = data[2 * m];
                data_m_im = data[2 * m + 1];
                re_temp = c * data_m_re + s * data_m_im;
                im_temp = c * data_m_im - s * data_m_re;
                data[2 * m] = data_ia_re - re_temp;
                data[2 * m + 1] = data_ia_im - im_temp;
                data[2 * ia] = data_ia_re + re_temp;
                data[2 * ia + 1] = data_ia_im + im_temp;
                ia++;

                // 第二次迭代
                m = ia + N2;
                data_ia_re = data[2 * ia];
                data_ia_im = data[2 * ia + 1];
                data_m_re = data[2 * m];
                data_m_im = data[2 * m + 1];
                re_temp = c * data_m_re + s * data_m_im;
                im_temp = c * data_m_im - s * data_m_re;
                data[2 * m] = data_ia_re - re_temp;
                data[2 * m + 1] = data_ia_im - im_temp;
                data[2 * ia] = data_ia_re + re_temp;
                data[2 * ia + 1] = data_ia_im + im_temp;
                ia++;

                // 第二次迭代
                m = ia + N2;
                data_ia_re = data[2 * ia];
                data_ia_im = data[2 * ia + 1];
                data_m_re = data[2 * m];
                data_m_im = data[2 * m + 1];
                re_temp = c * data_m_re + s * data_m_im;
                im_temp = c * data_m_im - s * data_m_re;
                data[2 * m] = data_ia_re - re_temp;
                data[2 * m + 1] = data_ia_im - im_temp;
                data[2 * ia] = data_ia_re + re_temp;
                data[2 * ia + 1] = data_ia_im + im_temp;
                ia++;

            }
            // 最后一次迭代
            for (; i < N2; i++) {
                // 第一次迭代
                m = ia + N2;
                data_ia_re = data[2 * ia];
                data_ia_im = data[2 * ia + 1];
                data_m_re = data[2 * m];
                data_m_im = data[2 * m + 1];
                re_temp = c * data_m_re + s * data_m_im;
                im_temp = c * data_m_im - s * data_m_re;
                data[2 * m] = data_ia_re - re_temp;
                data[2 * m + 1] = data_ia_im - im_temp;
                data[2 * ia] = data_ia_re + re_temp;
                data[2 * ia + 1] = data_ia_im + im_temp;
                ia++;
            }
            ia += N2;
        }
        ie <<= 1;
    }
    return result;
}
