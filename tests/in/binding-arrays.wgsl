struct UniformIndex {
    index: u32;
};

@group(0) @binding(0)
var texture_array1: binding_array<texture_2d<f32>>;
@group(0) @binding(1)
var texture_array2: binding_array<texture_2d<f32>, 5>;
@group(0) @binding(2)
var samp: sampler;
@group(0) @binding(3)
var<uniform> uni: UniformIndex;

struct FragmentIn {
    @location(0) index: u32;
};

@stage(fragment)
fn main(in: FragmentIn) -> @location(0) vec4<f32> {
    let uniform_index = uni.index;
    let non_uniform_index = in.index;

    let a1 = textureSample(texture_array1[0], samp, vec2<f32>(0.0, 0.0));
    let a2 = textureSample(texture_array1[uniform_index], samp, vec2<f32>(0.0, 0.0));
    let a3 = textureSample(texture_array1[non_uniform_index], samp, vec2<f32>(0.0, 0.0)); 
    let a = a1 + a2 + a3;

    let b1 = textureLoad(texture_array1[0], vec2<i32>(0, 0), 0);
    let b2 = textureLoad(texture_array1[uniform_index], vec2<i32>(0, 0), 0);
    let b3 = textureLoad(texture_array1[non_uniform_index], vec2<i32>(0, 0), 0);
    let b = b1 + b2 + b3;

    let c1 = vec2<f32>(textureDimensions(texture_array1[0]));
    let c2 = vec2<f32>(textureDimensions(texture_array1[uniform_index]));
    let c3 = vec2<f32>(textureDimensions(texture_array1[non_uniform_index]));
    let c = c1 + c2 + c3;

    return a + b + vec4<f32>(c.x, c.y, c.x, c.y);
}
