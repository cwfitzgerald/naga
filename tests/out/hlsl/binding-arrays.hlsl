
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

float4 main(FragmentInput_main fragmentinput_main) : SV_Target0
{
    FragmentIn in_ = { fragmentinput_main.index };
    float4 a1_ = texture_array1_[0].Sample(samp, float2(0.0, 0.0));
    return float4(0.0.xxxx);
}
