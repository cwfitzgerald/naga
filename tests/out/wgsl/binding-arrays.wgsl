struct UniformIndex {
    index: u32;
};

struct FragmentIn {
    @location(0) index: u32;
};

@group(0) @binding(0) 
var texture_array1_: binding_array<texture_2d<f32>>;
@group(0) @binding(1) 
var texture_array2_: binding_array<texture_2d<f32>,5>;
@group(0) @binding(2) 
var samp: sampler;
@group(0) @binding(3) 
var<uniform> uni: UniformIndex;

@stage(fragment) 
fn main(in: FragmentIn) -> @location(0) vec4<f32> {
    let a1_ = textureSample(texture_array1_[0], samp, vec2<f32>(0.0, 0.0));
    return vec4<f32>(0.0);
}
