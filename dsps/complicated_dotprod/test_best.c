float test_loop(float *data1, float* data2, int start_index, int end_index, int update1, int update2, float offset)
{
    float result0 = 0;
    float result1 = 0; 
    float result2 = 0;
    float result3 = 0;
    float result4 = 0;
    float result5 = 0;
    float result6 = 0;
    float result7 = 0;

    int i;
    for (i = start_index; i < end_index-7; i+=8)
    {
        result0 += data1[i+update1]*data2[i+update2] + offset;
        result1 += data1[i+1+update1]*data2[i+1+update2] + offset;
        result2 += data1[i+2+update1]*data2[i+2+update2] + offset;
        result3 += data1[i+3+update1]*data2[i+3+update2] + offset;
        result4 += data1[i+4+update1]*data2[i+4+update2] + offset;
        result5 += data1[i+5+update1]*data2[i+5+update2] + offset;
        result6 += data1[i+6+update1]*data2[i+6+update2] + offset;
        result7 += data1[i+7+update1]*data2[i+7+update2] + offset;
    }

    // 处理剩余元素
    for (; i < end_index; i++) {
        result0 += data1[i+update1]*data2[i+update2] + offset;
    }

    return result0 + result1 + result2 + result3 + result4 + result5 + result6 + result7;
}