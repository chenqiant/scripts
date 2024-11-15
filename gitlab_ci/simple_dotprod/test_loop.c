float test_loop(float *data1, float* data2)
{
    float result = 0;
    for (int i=0; i< 1024 ; i++)
    {
        result+= data1[i]*data2[i];
    }
    return result;
}