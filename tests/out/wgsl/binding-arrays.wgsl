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
    let uniform_index = uni.index;
    let non_uniform_index = in.index;
    let a1_ = textureSample(texture_array1_[0], samp, vec2<f32>(0.0, 0.0));
    let a2_ = textureSample(texture_array1_[uniform_index], samp, vec2<f32>(0.0, 0.0));
    let a3_ = textureSample(texture_array1_[non_uniform_index], samp, vec2<f32>(0.0, 0.0));
    let a = ((a1_ + a2_) + a3_);
    let b1_ = textureLoad(texture_array1_[0], vec2<i32>(0, 0), 0);
    let b2_ = textureLoad(texture_array1_[uniform_index], vec2<i32>(0, 0), 0);
    let b3_ = textureLoad(texture_array1_[non_uniform_index], vec2<i32>(0, 0), 0);
    let b = ((b1_ + b2_) + b3_);
    let _e49 = textureDimensions(texture_array1_[0]);
    let c1_ = vec2<f32>(_e49);
    let _e52 = textureDimensions(texture_array1_[uniform_index]);
    let c2_ = vec2<f32>(_e52);
    let _e55 = textureDimensions(texture_array1_[non_uniform_index]);
    let c3_ = vec2<f32>(_e55);
    let c = ((c1_ + c2_) + c3_);
    return ((a + b) + vec4<f32>(c.x, c.y, c.x, c.y));
}
