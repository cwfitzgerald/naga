@group(0) @binding(0)
var texture_array1: binding_array<texture_2d<f32>>;
@group(0) @binding(1)
var texture_array2: binding_array<texture_2d<f32>, 5>;

struct VertexIn {
    @location(0) index: u32;
};

@stage(vertex)
fn main(in: VertexIn) -> @builtin(position) vec4<f32> {
    return vec4<f32>(0.0, 0.0, 0.0, 1.0);
}
