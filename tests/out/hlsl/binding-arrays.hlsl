
struct UniformIndex {
    uint index;
};

struct FragmentIn {
    nointerpolation uint index : LOC0;
};

Texture2D<float4> texture_array1_[10] : register(t0);
Texture2D<float4> texture_array2_[5] : register(t10);
SamplerState samp : register(s0);
cbuffer uni : register(b0) { UniformIndex uni; }

struct FragmentInput_main {
    uint index : LOC0;
};

int2 NagaDimensions2D(Texture2D<float4> tex)
{
    uint4 ret;
    tex.GetDimensions(0, ret.x, ret.y, ret.z);
    return ret.xy;
}

float4 main(FragmentInput_main fragmentinput_main) : SV_Target0
{
    FragmentIn in_ = { fragmentinput_main.index };
    uint uniform_index = uni.index;
    uint non_uniform_index = in_.index;
    float4 a1_ = texture_array1_[0].Sample(samp, float2(0.0, 0.0));
    float4 a2_ = texture_array1_[uniform_index].Sample(samp, float2(0.0, 0.0));
    float4 a3_ = texture_array1_[NonUniformResourceIndex(non_uniform_index)].Sample(samp, float2(0.0, 0.0));
    float4 a = ((a1_ + a2_) + a3_);
    float4 b1_ = texture_array1_[0].Load(int3(int2(0, 0), 0));
    float4 b2_ = texture_array1_[uniform_index].Load(int3(int2(0, 0), 0));
    float4 b3_ = texture_array1_[NonUniformResourceIndex(non_uniform_index)].Load(int3(int2(0, 0), 0));
    float4 b = ((b1_ + b2_) + b3_);
    float2 c1_ = float2(NagaDimensions2D(texture_array1_[0]));
    float2 c2_ = float2(NagaDimensions2D(texture_array1_[uniform_index]));
    float2 c3_ = float2(NagaDimensions2D(texture_array1_[NonUniformResourceIndex(non_uniform_index)]));
    float2 c = ((c1_ + c2_) + c3_);
    return ((a + b) + float4(c.x, c.y, c.x, c.y));
}
