
struct VertexIn {
    nointerpolation uint index : LOC0;
};

Texture2D<float4> texture_array1_[10] : register(t0);
Texture2D<float4> texture_array2_[5] : register(t10);

float4 main(VertexIn in_) : SV_Position
{
    return float4(0.0, 0.0, 0.0, 1.0);
}
