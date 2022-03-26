@group(0) @binding(0)
var texture_array1: binding_array<texture_2d<f32>>;
@group(0) @binding(1)
var texture_array2: binding_array<texture_2d<f32>, 5>;
@group(0) @binding(2)
var samp: sampler;

struct FragmentIn {
    @location(0) index: u32;
};

@stage(fragment)
fn main(in: FragmentIn) -> @location(0) vec4<f32> {
    var a = textureSample(texture_array1[0], samp, vec2<f32>(0.0, 0.0));
    var b = textureSample(texture_array1[in.index], samp, vec2<f32>(0.0, 0.0));
    var c = textureLoad(texture_array1[0], vec2<i32>(0, 0), 0);
    var d = textureLoad(texture_array1[in.index], vec2<i32>(0, 0), 0);
    var e = textureDimensions(texture_array1[0]);
    var f = textureDimensions(texture_array1[in.index]);
    return vec4<f32>(0.0, 0.0, 0.0, 1.0);
}
