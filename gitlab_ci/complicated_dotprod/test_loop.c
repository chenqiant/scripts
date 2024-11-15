float test_loop(float *data1, float* data2, int start_index, int end_index, int update1, int update2, float offset)
{
    float result = 0;
    for (int i=start_index; i< end_index ; i++)
    {
        result+= data1[i+update1]*data2[i+update2] + offset;
    }
    return result;
}